require_relative 'formatters/index'

class Formats
    FORMATS = {
        users: UserFormatter,
        tickets: TicketFormatter
    }
    
    def self.formatter(search)
        formatter = FORMATS[search.entity.to_sym]
        formatter || Formatter
    end
end