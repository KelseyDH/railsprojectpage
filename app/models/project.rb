class Project < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  after_initialize :set_defaults


  before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

  def set_defaults 
  end



end
