class JsonWebToken
    # secret to encode and decode token
    HMAC_SECRET = Rails.application.secrets.secret_key_base # holds the secret key

    # encoding the token
    def self.encode(payload, exp = 24.hours.from_now) 
        # set expiry to 24 hrs from creation time
        payload[:exp] = exp.to_i
        # sign token with application secret
        JWT.encode(payload, HMAC_SECRET)
    end

    # decoding the token
    def self.decode(token)
        # get payload, first index in decoded array
        body = JWT.decode(token, HMAC_SECRET)[0]
        HashWithIndifferentAccess.new body
        # rescue from all decode errors
        rescue JWT::DecodeError => e
        # custom error handler
            raise ExceptionHandler::InvalidToken, e.message
    end

    def self.blacklisted?(token)
        JWTBlacklist.exists?(token: token)
    end
end