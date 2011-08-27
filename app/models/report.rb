class Report < ActiveRecord::Base

  validates_presence_of :name, :email, :message
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ , :message => " doesn't look like an email address."
  validates_length_of :message, :maximum => 300

  belongs_to :visitor

end
