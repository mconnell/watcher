require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DomainsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "domains", :action => "index").should == "/domains"
    end
  
    it "maps #new" do
      route_for(:controller => "domains", :action => "new").should == "/domains/new"
    end
  
    it "maps #show" do
      route_for(:controller => "domains", :action => "show", :id => "1").should == "/domains/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "domains", :action => "edit", :id => "1").should == "/domains/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "domains", :action => "create").should == {:path => "/domains", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "domains", :action => "update", :id => "1").should == {:path =>"/domains/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "domains", :action => "destroy", :id => "1").should == {:path =>"/domains/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/domains").should == {:controller => "domains", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/domains/new").should == {:controller => "domains", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/domains").should == {:controller => "domains", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/domains/1").should == {:controller => "domains", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/domains/1/edit").should == {:controller => "domains", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/domains/1").should == {:controller => "domains", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/domains/1").should == {:controller => "domains", :action => "destroy", :id => "1"}
    end
  end
end
