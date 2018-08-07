<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';


if(isset($_GET['module_id']) && isset($_GET['username'])) {
	$module_id=sanitize($_GET['module_id']);
	$username=sanitize($_GET['username']);
	
	//$result = mysqli_query($GLOBALS["con"],"SELECT `topic`.*, `enroll`.`note`, `enroll`.`quiz`, `enroll`.`active` FROM `topic` LEFT JOIN `enroll` ON `topic`.`topic_id` = `enroll`.`topic_id` WHERE `topic`.`module_id` = $module_id AND (`enroll`.`username` IS NULL OR `enroll`.`username` = '$username') ORDER BY `topic`.`le_no`");
	$result = mysqli_query($GLOBALS["con"],"SELECT `topic`.* FROM `topic` WHERE `topic`.`module_id` = $module_id ORDER BY `topic`.`le_no`");
	if (mysqli_num_rows($result) != 0) {
		// output data of each row
		while ($row = mysqli_fetch_array($result)) {
			$rowc = mysqli_query($GLOBALS["con"],"SELECT `note`, `quiz`, `active` FROM `enroll` WHERE `topic_id` = " . $row['topic_id'] . " AND `username` = '$username'");
			if (mysqli_num_rows($rowc) != 0) {
				while ($erow = mysqli_fetch_array($rowc)) {
					$rows[] = array(
						'topic_id' => $row['topic_id'],
						'module_id' => $row['module_id'],
						'le_no' => ($row['le_no'] < 10) ? "0" . $row['le_no'] : $row['le_no'],
						'name' => $row['name'],
						'note' => $erow['note'],
						'quiz' => $erow['quiz'],
						'active' => $erow['active']
					);
				}
			} else {
				$rows[] = array(
					'topic_id' => $row['topic_id'],
					'module_id' => $row['module_id'],
					'le_no' => ($row['le_no'] < 10) ? "0" . $row['le_no'] : $row['le_no'],
					'name' => $row['name'],
					'note' => NULL,
					'quiz' => NULL,
					'active' => NULL
				);
			}
		}
	} else {
		$errors[]  = 'No topic found';
	}
} else {
	$errors[]  = 'No data has been send';
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
}
echo json_encode($rows);
?>