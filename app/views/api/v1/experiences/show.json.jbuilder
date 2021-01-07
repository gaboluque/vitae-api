json.entity do
  json.experience do
    json.partial! 'api/v1/experiences/experience', experience: @experience
  end
end
