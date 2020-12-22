json.extract! experience, :id, :title, :kind, :place, :location, :title, :content, :ongoing
json.start_month experience.start_date.month
json.start_year experience.start_date.year
if experience.end_date
  json.end_month experience.end_date.month
  json.end_year experience.end_date.year
end
json.preview experience.document.attached? ? rails_blob_url(experience.document) : nil