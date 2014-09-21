require 'rubygems'
require 'twilio-ruby'
require 'mysql'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC6c76cd9a15da6f85af498cc6f7bc0199'
auth_token = '736020ee82cf40555e6d4033032ddaa9'
con = Mysql.new 'localhost', 'root', 'hackgt', 'votedb'
@client = Twilio::REST::Client.new account_sid, auth_token
song =""
artist =""
body=""
@client.account.messages.list.each {|message|
    puts message.body
    message.body=~/(^[\s\S]*)by(.*)/
    song=$1
    artist=$2
    checkexists = con.query "SELECT song FROM votetable WHERE song='#{song}';"
    puts "query: #{checkexists.fetch_row} song:#{song}" 
    if checkexists.fetch_row != song
	     con.query("INSERT INTO votetable(song,artist) VALUES('#{song}','#{artist}')")
	     
    end
}

