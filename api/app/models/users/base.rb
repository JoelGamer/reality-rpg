class Users::Base < ApplicationRecord
  after_create :create_inventory

  has_one :inventory, class_name: 'Users::Inventories::Base', foreign_key: :user_id, inverse_of: false, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  private

  def create_inventory
    Users::Inventories::Base.create!(user: self)
  end
end
