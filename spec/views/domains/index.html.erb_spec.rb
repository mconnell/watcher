require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/index.html.erb" do
  include DomainsHelper
  
  before(:each) do
    assigns[:domains] = [
      stub_model(Domain,
        :name => "value for name",
        :registered => false,
        :suspended => false,
        :status => "value for status"
      ),
      stub_model(Domain,
        :name => "value for name",
        :registered => false,
        :suspended => false,
        :status => "value for status"
      )
    ]
  end

  it "renders a list of domains" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for status".to_s, 2)
  end
end

