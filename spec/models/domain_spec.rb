require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Domain do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :registered => false,
      :suspended => false,
      :status => "value for status",
      :whois_created_at => Time.now,
      :whois_expires_at => Time.now,
      :whois_changed_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Domain.create!(@valid_attributes)
  end
end
