require_relative 'formatter'

class TicketFormatter < Formatter
    def format_attribute(attribute_name, value)
        case attribute_name
        when 'organization_id'
            attribute_name = 'organization'
            ref = @data_store.find('organizations', value) || {}
            value = ref["name"] || "None"
        when 'submitter_id'
            attribute_name = 'submitter'
            ref = @data_store.find('users', value) || {}
            value = ref["name"] || "None"
        when 'assignee_id'
            attribute_name = 'assignee'
            ref = @data_store.find('users', value) || {}
            value = ref["name"] || "None"
        end
        super(attribute_name, value)
    end
end