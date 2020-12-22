json.success @result[:success]
json.user_list do
  json.partial! 'api/v1/users/list', users: @result[:entity]
end