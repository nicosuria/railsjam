require 'spec_helper'

describe Event do
  before(:each) do
    @event = Event.new
    @date = Time.now
  end

  it "should not be valid when empty" do
    @event.should_not be_valid
  end

  ['user_id', 'name'].each do |field|
    it "should require #{field}" do
     @event.should_not be_valid
    end
  end
  

end
