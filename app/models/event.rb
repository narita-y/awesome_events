class Event < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  def created_by?( user )
    return false unless user
    owner_id == user.id
  end

  def self.ransackable_attributes( auth_object = nil)
    %w(name start_time)
  end

  def self.ransackable_associations( auth_object = nil)
    []
  end

  private

  def start_time_should_be_before_end_time
    return unless start_time && end_time

    if start_time >= end_time
      errors.add( :start_time, 'は終了時間よりも前に設定してください')
    end
  end
end
