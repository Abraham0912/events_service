class Event < ApplicationRecord
  #Se obto por agregarlo en la migracion, me parece que esta depreciado
  
  # after_initialize do
  #   if self.new_record?
  #     self.cancel = :false
  #   end
  # end
  belongs_to :palace
end
