class UserData < ActiveRecord::Base
  include ActiveRecordHelper

  after_initialize :log_access
  attr_accessible :preferred_name, :uid, :first_login_at

  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.fb_provider = auth.provider
    user.fb_uid = auth.uid
    user.fb_name = auth.info.name
    user.fb_oauth_token = auth.credentials.token
    user.fb_oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
  end
  def self.database_alive?
    is_alive = false
    is_recoverable = false
    begin
      use_pooled_connection {
        find_by_sql("select 1").first
        is_alive = true
      }
    rescue ActiveRecord::ActiveRecordError => exception
      if exception.message.include?('This connection has been closed')
        Rails.logger.warn("Attempting to reconnect to PostgreSQL server...")
        is_recoverable = true
      else
        Rails.logger.warn("PostgreSQL server is down: #{exception}")
        is_alive = false
      end
    end
    if is_recoverable
      begin
        connection.reconnect!
        is_alive = true
      rescue Java::JavaSql::SQLException => reconnect_exception
        Rails.logger.warn("PostgreSQL server is still down: #{reconnect_exception}")
        is_alive = false
      end
    end
    is_alive
  end

end
