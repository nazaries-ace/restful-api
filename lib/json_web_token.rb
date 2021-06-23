class JsonWebToken
    class << self
      def encode(payload, expiry = 24.hours.from_now)
        payload[:expiry] = expiry.to_i
        secret_key_base = Rails.application.secrets.secret_key_base
        JWT.encode(payload, secret_key_base)
      end
      
      def decode(token)
        secret_key_base = Rails.application.secrets.secret_key_base
        body = JWT.decode(token, secret_key_base, true, algorithm: 'HS256')
        #HashWithIndifferentAccess.new body
        return body
        # text = 'decode running!'
        # return text
        rescue
            nil
      end
    end
  end