json.success true
json.entity do
  json.user do
    json.extract! @user, :id, :email, :admin
    json.profile_attributes do
      json.extract! @user.profile, :id, :name, :phone, :gender, :location, :description, :birth_date
    end
    json.hub_attributes do
      json.extract! @user.hub, :tag, :id
    end
    json.preview @user.profile.avatar.attached? ? rails_blob_url(@user.profile.avatar) : nil
  end
end
