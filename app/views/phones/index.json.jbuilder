# frozen_string_literal: true

json.array! @phones, partial: 'phones/phone', as: :phone
