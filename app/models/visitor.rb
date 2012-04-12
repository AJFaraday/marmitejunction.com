class Visitor < ActiveRecord::Base

  validates_presence_of :name, :email, :message
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ , :message => " doesn't look like an email address."
  validates_length_of :message, :maximum => 300
  validate :no_html_allowed

  after_create :set_reported_false

  has_many :reports



  def set_reported_false
    if message.include? '</a>'
      #self.destroy
      update_attribute :reported, true
    end
    update_attribute :reported, false
  end

  attr_accessor :failed

  def no_html_allowed
    if message.include? '>' and message.include? '</'
      errors.add(:message, 'cannot include html tags.')
    end
    forbidden = ['http://','@']
    forbidden.each do |mark|
      if message.include?(mark)
        errors.add(:message, 'cannot include URLs or email addresses, I was getting bored of cleaning the spam out of the guest book.')
      end
    end
  end

end
