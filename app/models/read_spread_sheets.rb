class ReadSpreadSheets
  require "google/api_client"
  require "google_drive"
  require 'openssl'
#This is ugly ...
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
  session = GoogleDrive.saved_session("config.json")



# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
  ws = session.spreadsheet_by_title("Public test").worksheets[0]

# Gets content of A2 cell.
  p ws[2, 1]  #==> "echo pouet"
  p ws[2, 2]
end