<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';

if(isset($_GET['username']) && isset($_GET['current']) && isset($_GET['new']) && isset($_GET['repeat'])) {
	$username=sanitize($_GET['username']);
	$current=sanitize($_GET['current']);
	$new=sanitize($_GET['new']);
	$repeat=sanitize($_GET['repeat']);
	
	if (user_exists($username) === true) {
		$rowc = mysqli_fetch_array(mysqli_query($GLOBALS["con"],"SELECT * FROM `users` WHERE `username` = '$username'"));
	} else {
		$errors[] = 'User not exists';
	}
	
	if (md5($_GET['current']) === $rowc['pass']) {
		if (trim($_GET['new']) !== trim($_GET['repeat'])) {
			$errors[] = 'New password not match';
		}
		if (strlen($_GET['new']) < 8) {
			$errors[] = 'New password less than 8 character';
		}
		if (strlen($_GET['new']) > 32) {
			$errors[] = 'New password more than 32 character.';
		}
	} else {
		$errors[] = 'Password incorrect';
	}
	
	if (empty($_GET) === false && empty($errors) === true) {
		$new = md5($new);
		mysqli_query($GLOBALS["con"],"UPDATE `users` SET `pass` = '$new' WHERE `username` = '$username'");
	}
} else {
	$errors[]  = 'No data has been send';
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
} else {
	$rows['success']  = 'Password update successfull';
}
echo json_encode($rows);
?>