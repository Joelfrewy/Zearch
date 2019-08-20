RSpec.describe DataStore do
  
  subject { Search.new() }
  
  it "successfully adds inputs" do
      subject.add_inputs("users", "_id", 1)
      expect(subject.entity).to eq("users")
      expect(subject.attribute).to eq("_id")
      expect(subject.value).to eq(1)
  end
  
  it "successfully adds results" do
      subject.add_inputs("users", "_id", 1)
      subject.add_results({"_id" => 1, "name" => "user 1" })
      expect(subject.entity).to eq("users")
      expect(subject.attribute).to eq("_id")
      expect(subject.value).to eq(1)
  end
  
  it "unsuccessfully adds results with undefined parameters" do
      expect{subject.add_results([{"_id" => 1, "name" => "user 1"}])}.to raise_error(RuntimeError)
  end
  
  it "unsuccessfully adds results with undefined entity parameter" do
      subject.add_inputs(nil, "_id", 1)
      expect{subject.add_results([{"_id" => 1, "name" => "user 1"}])}.to raise_error("undefined entity parameter")
  end
  
  it "unsuccessfully adds results with undefined attribute parameter" do
      subject.add_inputs("users", nil, 1)
      expect{subject.add_results([{"_id" => 1, "name" => "user 1"}])}.to raise_error("undefined attribute parameter")
  end
  
  it "unsuccessfully adds results with undefined value parameter" do
      subject.add_inputs("users", "_id", nil)
      expect{subject.add_results([{"_id" => 1, "name" => "user 1"}])}.to raise_error("undefined value parameter")
  end
end