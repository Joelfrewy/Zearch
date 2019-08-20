require 'json'

class DataStore
    def initialize()
        @data = load()
    end
    
    def load()
        data = {}
        ["users", "organizations", "tickets"].each do |entity_name|
            file = File.open "data/#{entity_name}.json"
            entity = JSON.load file
            entity.each do |entity|
                data[entity_name] = data[entity_name] || {}
                data[entity_name][entity["_id"]] = entity
            end
        end
        data
    end
    
    def data
        @data
    end
    
    def find(entity, id)
        self.data[entity][id]
    end
end