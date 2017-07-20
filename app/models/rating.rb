class Rating < ApplicationRecord
  belongs_to :app_user
  belongs_to :event
end
