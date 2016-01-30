class HomeController < ApplicationController
  require 'mongoid'

  def index
    @getContact = ReadSpreadSheets.getContact
  end
end
