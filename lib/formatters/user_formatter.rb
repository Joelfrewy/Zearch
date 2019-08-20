require_relative 'formatter'

class UserFormatter < Formatter
    def format_attribute(attribute_name, value)
        case attribute_name
        when 'organization_id'
            attribute_name = 'organization'
            value = @data_store.find('organizations', value)["name"]
        end
        super(attribute_name, value)
    end
end