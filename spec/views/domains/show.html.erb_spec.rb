require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/show.html.erb" do
  include DomainsHelper
  before(:each) do
    assigns[:domain] = @domain = stub_model(Domain,
      :name => "value for name",
      :registered => false,
      :suspended => false,
      :status => "value for status"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ status/)
  end
end

