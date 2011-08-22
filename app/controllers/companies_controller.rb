class CompaniesController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:q]
      @companies = Company.where("name like ?", "%#{params[:q]}%")
    else 
      @companies = Company.all
    end
    respond_to do |format|
      format.html
      format.json { render :json => @companies.map(&:attributes) }
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => "Successfully created company."
    else
      render :action => 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice  => "Successfully updated company."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url, :notice => "Successfully destroyed company."
  end
end
