json.partial! 'api/v1/partials/info', result: @result
json.user_list do
  json.partial! 'api/v1/users/list', users: @result[:extra]
end