<?php

<<<<<<< .merge_file_OYBhNX
$AccountSid = "PNfe33aca3efd5db370f02103a29ceef0b";
$AuthToken = "736020ee82cf40555e6d4033032ddaa9";

require "Services/Twilio.php";

// Instantiate a new Twilio Rest Client
$client = new Services_Twilio($AccountSid, $AuthToken);

//Grab user phone number and sms message body from Twilio
$phone = $_REQUEST['From'];
$body = $_REQUEST['Body'];

//remove +1 from beginning of phone number
$from = substr($phone, 2);
if($body != NULL ){
	$myfile = fopen("testfile.txt", "w");
}
//connect to database
$host = 'localhost';
$user = 'mysqladmin'
$pass = 'hackgt';
$db = 'voter';

$con = mysqli_connect($host,$user,$pass,$db);

$song = strstr($body, 'by', true); //takes a substring of everything before the “by” in the message
$artist_with_by = strstr($body, 'by', false);
$artist = substr($artist_with_by, 3); //taking the string of everything after the “by"

if (mysqli_connect_errno()) {
    printf("Could not connect: %s\n", mysqli_connect_error());
    exit();
}

//Post voting info to database
mysqli_query($con,"INSERT INTO voter (song, artist, votes) VALUES ('$song', '$artist', '1')");
mysqli_close($con);
?>
<Response>
    <Message>Thanks for your vote!</Message>
</Response>
=======
$con=mysqli_connect("azamabdul.com","")

?>
>>>>>>> .merge_file_LIbblU
