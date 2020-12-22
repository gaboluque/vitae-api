json.success true
json.auth do
  json.logged true
  json.jwt_token @token
  json.extract! current_user, :admin, :email
  json.extract! current_user.profile, :name, :phone
  json.env ENV.fetch('RAILS_ENV')
end