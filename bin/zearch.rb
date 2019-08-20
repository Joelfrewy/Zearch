require 'rubygems'
require 'bundler'

require_relative '../lib/index'

data_store = DataStore.new()
search_engine = SearchEngine.new(data_store)

def welcome()
    str = "-" * 80 + "\n"
    str += "Welcome to Zearch! Begin searching or type exit to quit\n"
    str += "-" * 80 + "\n\n"
end

puts welcome()

while true
    search = Search.new()
    Prompter.prompt(search, search_engine)
    search_engine.execute(search)
    puts Formats.formatter(search).new(search, data_store).to_s
end

    
