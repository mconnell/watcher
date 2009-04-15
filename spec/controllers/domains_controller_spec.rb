require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DomainsController do

  def mock_domain(stubs={})
    @mock_domain ||= mock_model(Domain, stubs)
  end
  
  describe "GET index" do
    it "assigns all domains as @domains" do
      Domain.should_receive(:find).with(:all).and_return([mock_domain])
      get :index
      assigns[:domains].should == [mock_domain]
    end
  end

  describe "GET show" do
    it "assigns the requested domain as @domain" do
      Domain.should_receive(:find).with("37").and_return(mock_domain)
      get :show, :id => "37"
      assigns[:domain].should equal(mock_domain)
    end
  end

  describe "GET new" do
    it "assigns a new domain as @domain" do
      Domain.should_receive(:new).and_return(mock_domain)
      get :new
      assigns[:domain].should equal(mock_domain)
    end
  end

  describe "GET edit" do
    it "assigns the requested domain as @domain" do
      Domain.should_receive(:find).with("37").and_return(mock_domain)
      get :edit, :id => "37"
      assigns[:domain].should equal(mock_domain)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created domain as @domain" do
        Domain.should_receive(:new).with({'these' => 'params'}).and_return(mock_domain(:save => true))
        post :create, :domain => {:these => 'params'}
        assigns[:domain].should equal(mock_domain)
      end

      it "redirects to the created domain" do
        Domain.stub!(:new).and_return(mock_domain(:save => true))
        post :create, :domain => {}
        response.should redirect_to(domain_url(mock_domain))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved domain as @domain" do
        Domain.stub!(:new).with({'these' => 'params'}).and_return(mock_domain(:save => false))
        post :create, :domain => {:these => 'params'}
        assigns[:domain].should equal(mock_domain)
      end

      it "re-renders the 'new' template" do
        Domain.stub!(:new).and_return(mock_domain(:save => false))
        post :create, :domain => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested domain" do
        Domain.should_receive(:find).with("37").and_return(mock_domain)
        mock_domain.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :domain => {:these => 'params'}
      end

      it "assigns the requested domain as @domain" do
        Domain.stub!(:find).and_return(mock_domain(:update_attributes => true))
        put :update, :id => "1"
        assigns[:domain].should equal(mock_domain)
      end

      it "redirects to the domain" do
        Domain.stub!(:find).and_return(mock_domain(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(domain_url(mock_domain))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested domain" do
        Domain.should_receive(:find).with("37").and_return(mock_domain)
        mock_domain.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :domain => {:these => 'params'}
      end

      it "assigns the domain as @domain" do
        Domain.stub!(:find).and_return(mock_domain(:update_attributes => false))
        put :update, :id => "1"
        assigns[:domain].should equal(mock_domain)
      end

      it "re-renders the 'edit' template" do
        Domain.stub!(:find).and_return(mock_domain(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested domain" do
      Domain.should_receive(:find).with("37").and_return(mock_domain)
      mock_domain.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the domains list" do
      Domain.stub!(:find).and_return(mock_domain(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(domains_url)
    end
  end

end
