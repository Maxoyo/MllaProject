class ReadSpreadSheet
  require "google/api_client"
  require "google_drive"
  require 'Contact'

# Please forgive me this is ugly ...
 OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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


# Create a contact
  user = Contact.new
  user.first_name = l1
  user.last_name = l2
  user.age = l3
# Save a contact
  user.save

  p "end"
end