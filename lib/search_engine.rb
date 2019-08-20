require_relative 'data_store'
require 'set'

class SearchEngine
    def initialize(data_store)
        @data_store = data_store
        indexentities()
    end
    
    def indexentities()
        @indexed_entities = {}
        @data_store.data.each do |entity_name, entity|
            entity.each do |id, entity|
                entity.each do |attribute_name, value|
                    if value.kind_of?(Array)
                        value.each do |array_value|
                            self.add_index_value(entity_name, id, attribute_name, array_value)
                        end
                    else
                        self.add_index_value(entity_name, id, attribute_name, value)
                    end
                end
            end
        end
    end
    
    def add_index_value(entity_name, id, attribute_name, value)
        @indexed_entities[entity_name] = @indexed_entities[entity_name] || {}
        @indexed_entities[entity_name][attribute_name] = @indexed_entities[entity_name][attribute_name] || {}
        @indexed_entities[entity_name][attribute_name][value.to_s] = 
            @indexed_entities[entity_name][attribute_name][value.to_s] || Set.new
        @indexed_entities[entity_name][attribute_name][value.to_s] << id
    end
    
    def execute(search)
        results = []
        entity = @indexed_entities[search.entity] || {}
        attribute = entity[search.attribute] || {}
        value = attribute[search.value] || {}
        value.each do |id|
            results << @data_store.find(search.entity, id)
        end
        search.add_results(results)
    end
    
    def list_entities()
        @indexed_entities.collect { |key,value| key }
    end
    
    def list_attributes(entity)
        entity = @indexed_entities[entity] || {}
        entity.collect { |key,value| key }
    end
    
    def list_values(entity, attribute)
        entity = @indexed_entities[entity] || {}
        attribute = entity[attribute] || {}
        attribute.collect { |key,value| key }
    end
end