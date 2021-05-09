# frozen_string_literal: true

json.array! @kinds, partial: 'kinds/kind', as: :kind
