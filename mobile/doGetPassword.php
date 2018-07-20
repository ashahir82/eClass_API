<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';

if(isset($_GET['username']) && isset($_GET['email'])) {
	$username=sanitize($_GET['username']);
	$email=sanitize($_GET['email']);
	
	$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `users` WHERE `username` = '$username' AND `email` = '$email'");
	if (mysqli_num_rows($result) == 0) {
		$errors[] = 'Account not exists';
	}
} else {
	$errors[]  = 'No data has been send';
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
} else {
	$rows['success']  = 'Account Verified';
}
echo json_encode($rows);
?>