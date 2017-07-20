class Event < ApplicationRecord
  belongs_to :app_user

  geocoded_by :latitude

  def evaluations
    nota = Rating.where(event_id: self.id).average(:nota)
    total = Rating.where(event_id: self.id).count

    if total < 5
      nota = 0
    end

    {nota: nota, total: total}
  end

  def is_today
    self.data_inicio.to_date == Time.zone.now.to_date or self.data_fim.to_date == Time.zone.now.to_date
  end
end
