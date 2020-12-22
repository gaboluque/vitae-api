json.experiences do
  json.kind :experiences
  json.entries experiences do |experience|
    json.extract! experience, :id, :title, :kind, :place, :location, :title
  end
end