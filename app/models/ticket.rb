class Ticket < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true,length: { minimum: 10 }
  belongs_to :user
  belongs_to :project
  belongs_to :state
  has_many :assets
  accepts_nested_attributes_for :assets
  attr_accessor :tag_names
  has_many :comments
  has_and_belongs_to_many :tags
  before_create :associate_tags
  config = ActiveRecord::Base.configurations[::Rails.env]
  ActiveRecord::Base.establish_connection
  config["adapter"]

  searcher do
    label :tag, :from => :tags, :field => :name
  end

  private

  def associate_tags
    if tag_names
      tag_names.split(",").each do |name|
        self.tags << Tag.find_or_create_by_name(name)
      end
    end
  end
  scope :test,->(time){ where("id=?",time) }

  def self.test(time) 
    puts ActiveRecord::Base.connection.execute("Select * from tickets group by title ")
  end

 end
