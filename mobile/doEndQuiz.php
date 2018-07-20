<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';


if(isset($_GET['topic_id']) && isset($_GET['username']) && isset($_GET['mark'])) {
	$topic_id=sanitize($_GET['topic_id']);
	$username=sanitize($_GET['username']);
	$mark=sanitize($_GET['mark']);
	
	$endtime = date("l, j M Y - H:i A");
	
	if (user_exists($username) === true && topic_exists($topic_id) === true) {
		$gotEnroll = mysqli_query($GLOBALS["con"],"SELECT * FROM `enroll` WHERE `topic_id` = $topic_id AND `username` = '$username'");
		if (mysqli_num_rows($gotEnroll) !== 0) {
			mysqli_query($GLOBALS["con"],"INSERT INTO `score` (`username`, `topic_id`, `mark`, `datetime`) VALUES ('$username', $topic_id, $mark, '$endtime')");
			
			$rowc = mysqli_fetch_array(mysqli_query($GLOBALS["con"],"SELECT MAX(`mark`) AS HighScore FROM `score` WHERE `topic_id` = $topic_id AND `username` = '$username'"));
			if ($mark >= 50 && $mark >= $rowc['HighScore']) {
				mysqli_query($GLOBALS["con"],"UPDATE `enroll` SET `quiz` = 1, `quiz_datetime` = '$endtime' WHERE `topic_id` = $topic_id AND `username` = '$username'");
			}
		} else {
			$errors[]  = 'No enrollment record found';
		}
	} else {
		$errors[]  = 'User or Topic not exits';
	}
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
} else {
	$rows['success']  = 'Update successfull';
}
echo json_encode($rows);
?>