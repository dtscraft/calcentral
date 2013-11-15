Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas, :url => "https://#{Settings.cas_server}"
end

# More configurable logging.
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '315056908636772', '2e58ebca676edd4ad09114c50bda3a99',  provider_ignores_state: true
end

if Settings.application.fake_cas && Settings.application.fake_cas_id
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:cas] = OmniAuth::AuthHash.new(
    {
      :provider => 'cas',
      :uid => Settings.application.fake_cas_id
    })
end
if Rails.env.test?
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        #http://stackoverflow.com/questions/10964121/testing-deviseomniauthfacebook-with-cucumber
        #https://github.com/mkdynamic/omniauth-facebook#auth-hash
        {
          :provider => 'facebook',
          :uid => '1234567',
          :info => {
            :nickname => 'jbloggs',
            :email => 'joe@bloggs.com',
            :name => 'Joe Bloggs',
            :first_name => 'Joe',
            :last_name => 'Bloggs',
            :image => 'http://graph.facebook.com/1234567/picture?type=square',
            :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
            :location => 'Palo Alto, California',
            :verified => true
          },
          :credentials => {
            :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
            :expires_at => 1321747205, # when the access token expires (it always will)
            :expires => true # this will always be true
          },
          :extra => {
            :raw_info => {
              :id => '1234567',
              :name => 'Joe Bloggs',
              :first_name => 'Joe',
              :last_name => 'Bloggs',
              :link => 'http://www.facebook.com/jbloggs',
              :username => 'jbloggs',
              :location => { :id => '123456789', :name => 'Palo Alto, California' },
              :gender => 'male',
              :email => 'joe@bloggs.com',
              :timezone => -8,
              :locale => 'en_US',
              :verified => true,
              :updated_time => '2011-11-11T06:21:03+0000'
            }
          }
        }
    )
end
