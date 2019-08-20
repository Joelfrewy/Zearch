RSpec.describe DataStore do
  
  subject { DataStore.new() }
  
  before do
      allow(subject).to receive(:data).and_return({ 
          "users" => { 1 => {"_id" => 1, "name" => "user 1"} }, 
          "organizations" => { 1 => {"_id" => 1, "name" => "org 1"} }, 
          "tickets" => { 1 => {"_id" => 1, "name" => "ticket 1"} }, })
  end
  
  it "finds user with valid id" do
      result = subject.find("users", 1)
      expect(result["name"]).to eq("user 1")
  end
  
  it "returns nil for invalid user id" do
      result = subject.find("users", 300)
      expect(result).to be nil
  end
  
  it "finds organization with valid id" do
      result = subject.find("organizations", 1)
      expect(result["name"]).to eq("org 1")
  end
  
  it "returns nil for invalid organization id" do
      result = subject.find("organizations", 1000)
      expect(result).to be nil
  end
  
  it "finds ticket with valid id" do
      result = subject.find("tickets", 1)
      expect(result["name"]).to eq("ticket 1")
  end
  
  it "returns nil for invalid ticket id" do
      result = subject.find("tickets", 100)
      expect(result).to be nil
  end
end