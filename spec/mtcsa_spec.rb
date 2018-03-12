require 'spec_helper'
require 'mtcsa'
describe MTCSA do
  
  it "should load the database when load is called" do
    expect(MTCSA.load).to eq(MTCSA.db)
  end
  
  it "expect the mtcsa_list to be greater then 5000 records" do
    expect(MTCSA.mtcsa_list.length).to be > 5000
  end

  it "mtcsa_eligible?( should return true when a postal code that is MTCSA eligible is checked" do
    expect(MTCSA.mtcsa_eligible?(30162) ).to be true
  end
  
  it "mtcsa_eligible?( should return false when a postal code that is not MTCSA eligible is checked" do
    expect(MTCSA.mtcsa_eligible?(301747) ).to be false
  end
  
  it "Should return ranges of eleigble boxes when a valid zipcode is provided" do
    expect(MTCSA.find_by_zip(30162).length).to be > 0
  end  
  
  it "should return a blank array if no mtcsa postoffices exist in the zipcode" do
    expect(MTCSA.find_by_zip(30747).length).to be 0
  end
  ## 30162 1420 MARTHA BERRY ROME GA B 1-96 B 101-149
  it "should return a street address with number if MTCSA is supported for the PO Box" do
    expect(MTCSA.mtcsa_address(30162, 122)[:address]).to eq("1420 MARTHA BERRY UNIT 122 ROME GA 30162")
  end
  
  it "mtcsa_address should return nil if MTCSA is not supported for the PO Box even if the post office offers it" do
    expect(MTCSA.mtcsa_address(30162, 100)).to be nil
  end

end