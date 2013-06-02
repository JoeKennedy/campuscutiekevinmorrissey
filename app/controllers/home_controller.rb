class HomeController < ApplicationController
  def index
    @days_til_bday = (Date.parse("2013-06-17") - Date.today).to_i
  end
end
