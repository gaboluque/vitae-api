json.success true
json.profile do
  json.extract! current_user.profile, :name, :phone, :location, :gender, :description, :birth_date
  json.avatar current_user.profile.avatar.attached? ? current_user.profile.avatar.service_url : nil
end

