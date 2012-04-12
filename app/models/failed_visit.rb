class FailedVisit < ActiveRecord::Base

  def self.todays
    failed = FailedVisit.where(['created_at > ? and created_at < ?',Time.now.beginning_of_day, Time.now.end_of_day]).first
    failed = create(:count => 0)if failed.nil?
    return failed
  end

  def self.increment
    todays.update_attribute(:count, (todays.count + 1)) 
  end

end
