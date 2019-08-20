class Prompter
    
    def self.prompt(search, search_engine)
        entities = search_engine.list_entities()
        self.preview("choose an entity", entities)
        while entity = self.get_input()
            if entity != "" then break end
            puts ">>> please enter a valid entity"
        end
        attributes = search_engine.list_attributes(entity)
        self.preview("choose an attribute", attributes)
        while attribute = self.get_input()
            if attribute != "" then break end
            puts ">>> please enter a valid attribute"
        end
        values = search_engine.list_values(entity, attribute)
        self.preview("choose a value", values)
        value = self.get_input()
        search.add_inputs(entity, attribute, value)
        search
    end
    
    def self.preview(instruction, collection)
        puts ">>> #{instruction}: #{collection.size() == 0 ? "" : "e.g."} #{collection.take(5).join(", ")} #{collection.size() > 5 ? ", ..." : ""}"
    end
    
    def self.get_input()
        input = gets.chomp
        if input == "exit" then
            puts self.goodbye()
            exit 
        end
        input
    end
    
    def self.goodbye()
        str = "\n" + "-" * 80 + "\n"
        str += "Goodbye!\n"
        str += "-" * 80 + "\n\n"
    end
end