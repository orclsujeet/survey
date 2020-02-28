class AuthenticateApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @current_user ||= User.find_by_id(http_auth_header) if http_auth_header
    @current_user || errors.add(:token, 'Invalid token') && nil
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization']
    else
      errors.add :token, 'Missing token'
    end
    nil
  end
end
