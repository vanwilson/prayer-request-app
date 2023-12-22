class Prayer < ApplicationRecord
  belongs_to :user
  validates :pray_for, :title, :prayer_type, :body, presence: true
end
