class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id

  belongs_to :user

  def provider_name
    if provider == "openid"
      "Open ID"
    else
      provider.titleize
    end
  end
end
