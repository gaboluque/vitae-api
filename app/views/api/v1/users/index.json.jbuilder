json.userList do
  json.partial! 'api/v1/users/list', users: @result[:data]
end