class AppUser < ApplicationRecord
  def facebook_info
    facebook_user = FacebookHelper.get_user_by_id self.facebook_id

    {user_name: facebook_user['name'], photo: facebook_user['picture']['data']['url']}
  end
end
