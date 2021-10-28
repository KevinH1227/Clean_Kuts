class Appointment < ApplicationRecord
  belongs_to :client, foreign_key: :client_id, class_name: 'User'
  belongs_to :barber, foreign_key: :barber_id, class_name: 'User'
  belongs_to :service
  belongs_to :time_slot

  validates :start_time, :end_time, presence: true

  default_scope -> { order(:start_time) }  # Our meetings will be ordered by their start_time by default

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end

  def other_user(current_user)
    if current_user.barber?
      return self.client
    else 
      return self.barber
    end
  end

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end
  # def start_hour
  #   return self.start_time.strftime('%H:%M')
  # end

  # def end_hour
  #   return self.end_time.strftime('%H:%M')
  # end

  def day
    return self.start_time.strftime("%B #{self.start_time.day.ordinalize}, %Y @ %H:%M")
  end

  # def duration
  #   total_minutes = self.service.duration / 60
  #   hours, minutes = total_minutes.divmod(60)
  #   duration = ""
  #   if hours > 0
  #     if minutes == 0
  #       duration = "#{hours} hour"
  #     else
  #       duration = "#{hours} hour and #{minutes} minutes"
  #     end
  #   else
  #     duration = "#{minutes} minutes"
  #   end
  #   return duration
  # end

  def durations
    def isPlural(num)
      return num > 1
    end
    total_minutes = self.service.duration / 60
    # total_minutes -= 1
    hours, minutes = total_minutes.divmod(60)

    if hours > 0 
      hours_str = "#{hours} hour#{isPlural(hours) ? "s" : ""}"
    end
    if minutes > 0 
      minutes_str = "#{minutes} minute#{isPlural(minutes) ? "s" : ""}"
    end

    if hours_str && minutes_str
      return "#{hours_str} and #{minutes_str}"
    elsif hours_str
      return hours_str
    elsif minutes_str
      return minutes_str
    end
  end
end
