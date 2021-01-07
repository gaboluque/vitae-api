json.profile do
  json.extract! current_user.profile, :name, :phone, :location, :gender, :description, :birth_date
  json.preview current_user.profile.avatar.attached? ? rails_blob_url(current_user.profile.avatar) : nil
  json.avatar nil
end

