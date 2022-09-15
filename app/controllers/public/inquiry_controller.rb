class Public::InquiryController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    @user = User.find(params[:user_id])
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message, :user_name, :user_email))
    InquiryMailer.received_email(@inquiry).deliver
    InquiryMailer.received_admin_email(@inquiry).deliver
    render :action => 'thanks'
  end
end
