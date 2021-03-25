class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.start_date.present? && record.start_date < Date.today ||
        record.end_date.present? && record.end_date < Date.today
      record.errors.add(:start_date, "can't be in the past")
      record.errors.add(:end_date, "can't be in the past")
    end
  end
end
