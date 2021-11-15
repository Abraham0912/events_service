class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event_id, uniqueness: { scope: :user_id, message: "Ya existe un usuario con este evento" }
  validates :cost, numericality: { equal_to: 0, message: "El costo debe ser igual a cero" }
end
