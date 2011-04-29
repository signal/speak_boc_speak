# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_speak_boc_speak_session',
  :secret      => '97e80ce80770244944ea73d97704242e5424129353e3a546c54ee8647daa3cc5ced9aaf545f142b2e0156c51d0ef61d8a52003966751bcf16d6b774d8be64377'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
