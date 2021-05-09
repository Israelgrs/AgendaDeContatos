# frozen_string_literal: true

# Classe referente ao acitverecord da aplicacao num todo
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
