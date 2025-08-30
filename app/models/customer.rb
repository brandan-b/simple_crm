# frozen_string_literal: true

# Code comments must not use em dashes.
class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  # Allowlist which columns can be searched or filtered by ActiveAdmin/Ransack
def self.ransackable_attributes(auth_object = nil)
  %w[full_name phone_number email_address notes created_at updated_at]
end

# Allowlist associations used by ActiveStorage so filters do not crash
def self.ransackable_associations(auth_object = nil)
  %w[image_attachment image_blob]
end

end
