<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';

if(isset($_GET['username'])) {
	$username=sanitize($_GET['username']);
	//$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `course`");
	$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `users` WHERE `username` = '$username'");
	if (mysqli_num_rows($result) != 0) {
		// output data of each row
		while ($row = mysqli_fetch_assoc($result)) {
			$rows = array(
				'username' => $row['username'],
				'fullname' => $row['fullname'],
				'email' => $row['email'],
				'active' => ($row['active'] == 1) ? true : false,
				'last_login' => $row['last_login']
			);
		}
	} else {
		$errors[]  = 'No record found';
	}
} else {
	$errors[]  = 'No data has been send';
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
}
echo json_encode($rows);
?>