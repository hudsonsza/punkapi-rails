# app/controllers/concerns/response.rb
module Response
  def json_response(object, status = :ok)
    if object.nil?
        render json: { message: 'Couldn\'t find' }, status: :not_found
    else
        render json: object, status: status
    end
    
  end
end