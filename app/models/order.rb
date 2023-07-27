class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy

  validates :client_email, presence: true, format: URI::MailTo::EMAIL_REGEXP

  STATUS_PENDING = 'pending'
  STATUS_PROCESSING = 'processing'
  STATUS_PROCESSED_WITH_ERROR = 'processing error'
  STATUS_PAID = 'paid'
end