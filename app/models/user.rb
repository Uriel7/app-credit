class User < ApplicationRecord
  has_one :profile
  has_many :requisitions

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def make_profile(auth)
    p = self.build_profile do |profile|
      profile.first_name = auth.info.first_name.split(' ').first
      profile.second_name = auth.info.first_name.split(' ').last
      profile.first_last_name = auth.info.last_name.split(' ').first
      profile.second_last_name = auth.info.last_name.split(' ').last
      profile.birth_date = Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y') if auth.extra.raw_info.birthday?
      profile.gender = auth.extra.raw_info.gender
    end
    p.save
  end

  def has_profile?
    !self.profile.nil?
  end
end
