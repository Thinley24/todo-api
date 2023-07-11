# singleton message to house all the messages
class Message
    def self.not_found(record = 'record')
        "Sorry, #{record} not found."
    end

    def self.Invalid_credentials
        'Invalid credentials'
    end

    def self.Invalid_token
        'Invalid token'
    end

    def self.missing_token
        'Missing token'
    end

    def self.Unauthorized
        'Unauthorized request'
    end

    def self.account_created
        'Account created successfully'
    end

    def self.account_not_created
        'Account could not be created'
    end

    def self.expired_token
        'Sorry, your token has expired. Please login to continue.'
    end
end
