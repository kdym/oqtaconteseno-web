module EventsHelper
  def humanize_minutes minutes
    text = []

    days = minutes / (60 * 24)

    if days.to_i > 0
      text << sprintf('%s%s', days.to_i, I18n.t('time_units.days.small'))
    end

    hours = days.modulo(1) * 24

    if hours.to_i > 0
      text << sprintf('%s%s', hours.to_i, I18n.t('time_units.hours.small'))
    end

    mins = hours.modulo(1) * 60

    if mins.to_i > 0
      text << sprintf('%s%s', mins.to_i, I18n.t('time_units.minutes.small'))
    end

    text.join ''
  end
end