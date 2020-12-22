json.success @result[:success]
json.partial! 'api/v1/partials/info', result: @result
json.partial! 'api/v1/experiences/list', experiences: @result[:extra]

