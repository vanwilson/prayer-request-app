class Prayer < ApplicationRecord
  belongs_to :user
  validates :pray_for, presence: true
  validates :title, presence: true
  validates :prayer_type, presence: true
  validates :body, presence: true
end
