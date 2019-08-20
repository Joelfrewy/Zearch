require 'time'

class Formatter
    
    def initialize(search, data_store)
        @search = search
        @data_store = data_store
    end
    
    def to_s()
        str = format_search()
        str += @search.results.map{ |entity| self.format_entity(entity) }.join("\n\n")
        str += "\n\n"
    end
    
    def format_search()
        count = @search.results.size()
        str = "\n" + "-" * 80 + "\n"
        str += "found #{count} result#{count == 1 ? "" : "s"} in #{@search.entity} where #{@search.attribute} is #{@search.value}\n"
        str += "-" * 80 + "\n\n"
    end
    
    def format_entity(entity)
        entity.map{ |attribute_name, value| format_attribute(attribute_name, value) }.join("\n")
    end
    
    def format_attribute(attribute_name, value)
        "#{(attribute_name + ": ").ljust(20)} #{format_value(value)}"
    end
    
    def format_value(value)
        if value.kind_of?(Array)
            value.map{ |item| item }.join(", ")
        elsif value =~ /\d{4}\-\d{2}\-\d{2}\T\d{2}\:\d{2}\:\d{2}\ -\d{1,2}\:\d{1,2}\z/
            puts value
            Time.parse(value).strftime('%d-%b-%Y, %I:%M %P')
        else
            value
        end
    end
end