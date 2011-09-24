# -*- coding: utf-8 -*-
class HomeController < LandingController
  before_filter :require_login, :only => :secret

  def index
  end

  def secret
  end

  def hold_meg_informert
    if(PotentialCustomer.find_by_email(params[:email_input]))
      flash[:notice] = "Takk, vi har registrert din interesse!"
    else
      @potentialCustomer = PotentialCustomer.new(:email => params[:email_input])
      if @potentialCustomer.save
        flash[:notice] = "Takk for din interesse!"
      else
        flash[:notice] = "Noe ser ut til å være feil med epostadressen. Vennligst prøv igjen."
      end
    end
    render :index
  end

end
