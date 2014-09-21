require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require 'mysql'

post '/backend' do
    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = 'AC6c76cd9a15da6f85af498cc6f7bc0199'
    auth_token = '736020ee82cf40555e6d4033032ddaa9'
    con = Mysql.new 'localhost', 'root', 'hackgt', 'votedb'
    @client = Twilio::REST::Client.new account_sid, auth_token
    song =""
    artist =""
    body=""
    @client.account.messages.list.each {|message|
        
        message.body=~/(^[\s\S]*)by(.*)/
        song=$1
        artist=$2
        checkexists = con.query "SELECT song FROM votetable WHERE song='#{song}';"
         
        if "#{checkexists.fetch_row}" != "[\"#{song}\"]"
    	puts "inserted"
    	con.query("INSERT INTO votetable(song,artist,votes) VALUES('#{song}','#{artist}',1);")
         else
    	con.query("UPDATE votetable SET votes=votes+1 WHERE song='#{song}';")
        end
        song =""
        artist=""
    }
end