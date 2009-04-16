class DomainsController < ApplicationController
  # GET /domains
  # GET /domains.xml
  def index
    @domains = Domain.paginate :page => params[:page], :per_page => 200
    @domain = Domain.new
    @count = Domain.count
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domains }
    end
  end

  # POST /domains
  # POST /domains.xml
  def create
    @domain = Domain.new(params[:domain])

    respond_to do |format|
      if @domain.save
        flash[:notice] = 'Domain was successfully created.'
        format.html { redirect_to(domains_path) }
      else
        flash[:error] = 'ERROR'
        format.html { redirect_to(domains_path) }
      end
    end
  end

  # PUT /domains/1
  # PUT /domains/1.xml
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_from_whois
        flash[:notice] = 'Domain was successfully updated.'
        format.html { redirect_to(domains_path) }
      else
        flash[:error] = 'Domain not updated.'
        format.html { redirect_to(domains_path) }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.xml
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to(domains_url) }
      format.xml  { head :ok }
    end
  end
end
