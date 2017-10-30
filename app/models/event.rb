class Event < ApplicationRecord
  belongs_to :app_user
  belongs_to :events_type

  include EventsHelper

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

  def timing
    start_date = self.data_inicio.to_time
    end_date = self.data_fim.to_time
    now = Time.zone.now.to_time

    total_timing = ((end_date - start_date) / 1.minutes)
    timing = ((now - start_date) / 1.minutes)

    if timing < 0
      {time: I18n.t('events_timing.starts_at', time: humanize_minutes(timing * -1)), class: 'text-primary'}
    else
      end_timing = ((end_date - now) / 1.minutes)

      if (timing / total_timing) * 100 >= 50
        return {time: I18n.t('events_timing.ends_at', time: humanize_minutes(end_timing)), class: 'text-warning'}
      elsif (timing / total_timing) * 100 >= 80
        return {time: I18n.t('events_timing.ends_at', time: humanize_minutes(end_timing)), class: 'text-danger'}
      else
        return {time: I18n.t('events_timing.started_at', time: humanize_minutes(timing)), class: 'text-success'}
      end
    end
  end

  def paid_event
    if self.gratis
      {pricing: I18n.t('activerecord.attributes.event.paid'), class: 'text-danger'}
    else
      {pricing: I18n.t('activerecord.attributes.event.not_paid'), class: 'text-success'}
    end
  end
end