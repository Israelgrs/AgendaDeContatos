# frozen_string_literal: true

# The class for the contacts Controller
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :set_options_for_select, only: %i[new edit update create]
  http_basic_authenticate_with name: 'Israel', password: '12345', only: :destroy

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all.order(:name).page(params[:page]).per(15)
  end

  # GET /contacts/1 or /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_address
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_options_for_select
    @kind_options_for_select = Kind.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :kind_id, :rmk, address_attributes: [:id, :street, :city, :state], phones_attributes: [:id, :Phone, :_destroy])
  end
end
