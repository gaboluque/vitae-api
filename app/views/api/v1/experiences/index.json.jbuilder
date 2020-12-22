json.success @result[:success]
json.partial! 'api/v1/experiences/list', experiences: @result[:entity]

