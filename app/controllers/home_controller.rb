# -*- coding: utf-8 -*-
class HomeController < LandingController
  before_filter :require_login, :only => :secret

  def index
  end

  def secret
  end

  def register
    if(User.find_by_email(params[:email_input]))
      flash[:notice] = "Takk, vi har registrert din interesse!"
    else
      email = params[:email_input]
      mobil = params[:mobil_input]
      password = params[:password_input]
      password_confirmation = params[:password_repeat_input]
      payment_method = params[:payment_input]

      @user = User.new(
          :email => email,
          :mobile => mobil,
          :password => password,
          :payment_method => payment_method)

      if @user.save
        flash[:notice] = "Takk for din interesse!"
      else
        flash[:sorry] = "Noe ser ut til å være feil med epostadressen. Vennligst prøv igjen."
      end
    end
    render :index
  end

end
