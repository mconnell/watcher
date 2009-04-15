require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/new.html.erb" do
  include DomainsHelper
  
  before(:each) do
    assigns[:domain] = stub_model(Domain,
      :new_record? => true,
      :name => "value for name",
      :registered => false,
      :suspended => false,
      :status => "value for status"
    )
  end

  it "renders new domain form" do
    render
    
    response.should have_tag("form[action=?][method=post]", domains_path) do
      with_tag("input#domain_name[name=?]", "domain[name]")
      with_tag("input#domain_registered[name=?]", "domain[registered]")
      with_tag("input#domain_suspended[name=?]", "domain[suspended]")
      with_tag("input#domain_status[name=?]", "domain[status]")
    end
  end
end


