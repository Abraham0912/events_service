class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event_id, uniqueness: { scope: :user_id, message: "Ya existe un usuario con este evento" }
end
