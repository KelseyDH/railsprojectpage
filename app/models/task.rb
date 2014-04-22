class Task < ActiveRecord::Base


belongs_to :project



validates :title, presence: true, uniqueness: true

scope :ordered_by_creation, -> {order("created_at DESC")}

before_save :capitalize

def capitalize
  self.title = self.title.capitalize!
end

end
