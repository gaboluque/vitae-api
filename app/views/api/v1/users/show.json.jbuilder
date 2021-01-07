json.user do
  json.extract! @user, :email, :admin
  json.profile_attributes do
    json.extract! @user.profile, :name, :phone, :gender, :location, :description, :birth_date
  end
  json.preview @user.profile.avatar.attached? ? @user.profile.avatar.service_url : nil
end
