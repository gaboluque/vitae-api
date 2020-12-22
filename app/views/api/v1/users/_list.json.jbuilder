json.total_count users.length
json.entries users do |user|
  json.extract! user, :id, :email, :admin
  json.name user.profile.name
end