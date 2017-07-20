class SearchParameter < ApplicationRecord
  belongs_to :user

  enum period: {today: 0, day3: 1, day7: 2}

  def self.all_tipos
    'all'
  end
end
