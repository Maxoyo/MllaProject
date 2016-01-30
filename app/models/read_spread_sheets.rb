class ReadSpreadSheets
  require "google/api_client"
  require "google_drive"
  require 'Contact'
  # Please forgive me this is ugly ...
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def self.getContact
  # Creates a session. This will prompt the credential via command line for the
  # first time and save it to config.json file for later usages.
    session = GoogleDrive.saved_session("config.json")

  # First worksheet of
  # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
    ws = session.spreadsheet_by_title("Public test").worksheets[0]

  # Gets content of cells.
    l1 = p ws[2, 1]
    l2 = p ws[2, 2]
    l3 = p ws[2, 3]

  # Put this content in an array
    array = Array.new(3)
    array[0] = l1
    array[1] = l2
    array[2] = l3

  # Function return the array
    return array
  end

  def self.putContact(r1,r2,r3)
    # Create a contact
    user = Contact.new
    user.first_name = r1
    user.last_name = r2
    user.age = r3
    # Save a contact in MongoDB
    user.save!
  end

  p "end"
end