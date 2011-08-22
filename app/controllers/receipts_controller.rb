class ReceiptsController < ApplicationController
  
  load_and_authorize_resource

  def index
    if current_user
      if params[:q]
        @receipts = Receipt.where(:user_id => current_user.id).joins("LEFT OUTER JOIN receipt_lines ON receipt_lines.receipt_id = receipts.id").where("receipts.title like ? or receipt_lines.title like ?", "%#{params[:q]}%", "%#{params[:q]}%")
      else
        @receipts = Receipt.where(:user_id => current_user.id)
      end
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
    @receipt.receipt_lines.build
    @receipt.receipt_files.build
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    @receipt.user = current_user
    if @receipt.save
      redirect_to @receipt, :notice => "Successfully created receipt."
    else
      render :action => 'new'
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
  end

  def update
    @receipt = Receipt.find(params[:id])
    @receipt.receipt_lines.each do |u|
      found = false
      unless params["receipt"]["receipt_lines_attributes"].nil?
        params["receipt"]["receipt_lines_attributes"].each_pair do |i,v|
          if u.id == (params["receipt"]["receipt_lines_attributes"][i]["id"].to_i)
            found = true
          end
        end
      end
      unless found
        u.destroy
      end
    end
    @receipt.receipt_files.each do |u|
      found = false
      unless params["receipt"]["receipt_files_attributes"].nil?
        params["receipt"]["receipt_files_attributes"].each_pair do |i,v|
          if u.id == (params["receipt"]["receipt_files_attributes"][i]["id"].to_i)
            found = true
          end
        end
      end
      unless found
        u.destroy
      end
    end

    if @receipt.update_attributes(params[:receipt])
      redirect_to @receipt, :notice  => "Successfully updated receipt."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to receipts_url, :notice => "Successfully destroyed receipt."
  end
end
