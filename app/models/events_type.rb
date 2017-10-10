class EventsType < ApplicationRecord
  attr_accessor :icone_file

  validates :nome, presence: true
  validates :icone_file, presence: true, on: :create
  validate :icone_validation

  before_save :save_icone

  MAX_ICON_SIZE = 2.megabytes
  VALID_ICON_EXTENSIONS = %w(.png)

  def icone_validation
    if self.icone_file.present?
      unless VALID_ICON_EXTENSIONS.include? File.extname(self.icone_file.original_filename).downcase
        errors.add :icone_file, I18n.t('activerecord.errors.messages.png_only')
      end

      if self.icone_file.size > MAX_ICON_SIZE
        errors.add :icone_file, I18n.t('activerecord.errors.messages.max_size', size: MAX_ICON_SIZE.to_s(:human_size))
      end
    end
  end

  def save_icone
    if self.icone_file.present?
      self.icone = self.icone_file.read
    end
  end
end
