class Project < ActiveRecord::Base
  has_many :tickets
  belongs_to :user
  validates :name, presence: true

  def last_ticket
    tickets.last
  end
end
