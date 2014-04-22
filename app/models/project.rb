class Project < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  after_initialize :set_defaults

  default_scope {order ("title ASC") }


  has_many :tasks, dependent: :destroy


  def self.recent_ten
    order("created_at DESC").limit(10)
  end

  scope :recent, lambda {|x| order("created_at DESC").limit(x) }

  scope :after, lambda {|date| where(["created_at DESC"]).limit(x) }

  before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

  def set_defaults 
  end



end
