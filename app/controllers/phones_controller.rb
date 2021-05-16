# frozen_string_literal: true

# Class for the phones controller
class PhonesController < ApplicationController
  before_action :set_phone, only: %i[show edit update destroy]

  # GET /phones or /phones.json
  def index
    @phones = Phone.all
  end

  # GET /phones/1 or /phones/1.json
  def show; end

  # GET /phones/new
  def new
    @phone = Phone.new
    contact_options_for_phones
  end

  # GET /phones/1/edit
  def edit
    contact_options_for_phones
  end

  # POST /phones or /phones.json
  def create
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to @phone, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to @phone, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def contact_options_for_phones
    @contact_options_for_select = Contact.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_phone
    @phone = Phone.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def phone_params
    params.require(:phone).permit(:Phone, :contact_id)
  end
end
