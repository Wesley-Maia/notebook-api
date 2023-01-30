class Phone < ApplicationRecord
  # belongs_to :contact
  belongs_to :contact, optional: true
end
