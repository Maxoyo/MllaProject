class HomeController < ApplicationController
  require 'mongoid'

  def index
    @getContact = ReadSpreadSheets.getContact
    #I think that's not how I should fill those parameter ...
    @putContact = ReadSpreadSheets.putContact(@getContact[0],@getContact[1],@getContact[2])
  end
end
