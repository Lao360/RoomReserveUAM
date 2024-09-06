<?php

$con = mysqli_connect("localhost","root","","engineer");
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

$id = $con->prepare("Select TOP 1 'id' from 'class'")+1;
$eventtitle = $_POST['eventtitle'];
$eventdescription = $_POST['eventdescription'];
$eventstart = $_POST['eventstart'];
$eventend = $_POST['eventend'];

$sql = $con->prepare("Insert INTO `class` (`id`, `class_name`, `describ`, `room_id`, `proffesor_id`, `starts`, `ends`) Values (NULL, '$eventtitle', '$eventdescription', '0', '2', '$eventstart', '$eventend')");

if ($sql->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql->error;
}

$rs = mysqli_query($con, $sql);
if($rs) 
{
	echo "Contact Records Inserted";
}

?>