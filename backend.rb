require 'rubygems'
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'PNfe33aca3efd5db370f02103a29ceef0b'
auth_token = '736020ee82cf40555e6d4033032ddaa9'
@client = Twilio::REST::Client.new account_sid, auth_token
@client.account.messages.list.each do |message|
    File.open(yourfile, 'w') { |file| file.write("#{message}") }