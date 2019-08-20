RSpec.describe SearchEngine do
    
    let (:data_store) { double(:data_store) }
    let (:search_engine) { SearchEngine.new(data_store) }
    subject { Prompter }
    
    before do
        allow(data_store).to receive(:data).and_return({ 
            "users" => { 1 => {"_id" => 1, "name" => "user 1"} }, 
            "organizations" => { 1 => {"_id" => 1, "name" => "org 1"} }, 
            "tickets" => { 1 => {"_id" => 1, "name" => "ticket 1"} }, })
    end
    
    it "creates search from inputs" do
        allow(subject).to receive(:get_input).and_return("users", "_id", "1")
        search = subject.prompt(Search.new(), search_engine)
        expect(search.entity).to eq("users")
        expect(search.attribute).to eq("_id")
        expect(search.value).to eq("1")
    end
    
    it "ignores blank entity" do
        allow(subject).to receive(:get_input).and_return("", "", "users", "_id", "1")
        search = subject.prompt(Search.new(), search_engine)
        expect(search.entity).to eq("users")
        expect(search.attribute).to eq("_id")
        expect(search.value).to eq("1")
    end
    
    it "ignores blank attribute" do
        allow(subject).to receive(:get_input).and_return("users", "", "", "_id", "1")
        search = subject.prompt(Search.new(), search_engine)
        expect(search.entity).to eq("users")
        expect(search.attribute).to eq("_id")
        expect(search.value).to eq("1")
    end
    
    it "allows blank values" do
        allow(subject).to receive(:get_input).and_return("users", "_id", "")
        search = subject.prompt(Search.new(), search_engine)
        expect(search.entity).to eq("users")
        expect(search.attribute).to eq("_id")
        expect(search.value).to eq("")
    end
end