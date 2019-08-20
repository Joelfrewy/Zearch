RSpec.describe SearchEngine do
    
    let (:data_store) { double(:data_store) }
    subject {SearchEngine.new(data_store)}
    
    before do
        allow(data_store).to receive(:data).and_return({ 
            "users" => { 1 => {"_id" => 1, "name" => "user 1"} }, 
            "organizations" => { 1 => {"_id" => 1, "name" => "org 1"} }, 
            "tickets" => { 1 => {"_id" => 1, "name" => "ticket 1"} }, })
    end
    
    describe '#list_entities' do
        it "lists entities" do
            expect(subject.list_entities()).to eq(["users", "organizations", "tickets"])
        end
    end
    
    describe '#list_attributes' do
        it "lists attributes of valid entity" do
            expect(subject.list_attributes("organizations")).to eq(["_id", "name"])
        end
        
        it "returns nil for invalid entity" do
            expect(subject.list_attributes("cities")).to eq([])
        end
    end
    
    describe '#list_values' do
        it "lists values of valid entity" do
            expect(subject.list_values("users", "name")).to eq(["user 1"])
        end
        
        it "returns empty array for invalid entity or attribute" do
            expect(subject.list_values("cities", "name")).to eq([])
            expect(subject.list_values("users", "fax")).to eq([])
        end
    end
end