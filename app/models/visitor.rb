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

  def no_html_allowed
    logger.info message
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

  def Visitor.check
    puts Visitor.first.inspect
    puts 'remove this?(y/n)' 
    gets check
    if check == 'y'
      Visitor.last.destroy
      check
    end
  end

end
