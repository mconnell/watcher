# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_watcher_session',
  :secret      => '9559bb3154cb2bb77ece8bae3e184831dab2a8df962308ff29d215529c396d905fa489b124c033479b5716fc9b5d222c18eaec5ba5bcda7553f4a73310db3656'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
