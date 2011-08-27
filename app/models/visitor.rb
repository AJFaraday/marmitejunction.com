class Visitor < ActiveRecord::Base

  validates_presence_of :name, :email, :message
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ , :message => " doesn't look like an email address."
  validates_length_of :message, :maximum => 300

  after_create :set_reported_false

  has_many :reports

  def set_reported_false
    update_attribute :reported, false
  end

end
