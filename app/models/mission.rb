# app/models/mission.rb
class Mission < ApplicationRecord
  belongs_to :agent

  VALID_STATUSES = ["assigned", "in_progress", "completed"]

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }

  # Добавьте кастомный сеттер для статуса
  def status=(value)
    unless VALID_STATUSES.include?(value)
      raise ArgumentError, "Invalid status: #{value}. Must be one of: #{VALID_STATUSES.join(', ')}"
    end
    super(value)
  end
end
