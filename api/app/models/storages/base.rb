class Storages::Base < ApplicationRecord
  belongs_to :storage, polymorphic: true
  validates :storage_type, :storage_id, presence: true

  validates :name, presence: true, uniqueness: true
  validates :storage_units, presence: true
end
