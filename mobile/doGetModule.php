<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';


if(isset($_GET['course_id'])) {
	$course_id=sanitize($_GET['course_id']);
	$rows = array();
	//$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `module` WHERE `course_id` = $course_id");
	$result = mysqli_query($GLOBALS["con"],"SELECT `module`.*, COUNT(`topic`.`topic_id`) AS CountT FROM `module` LEFT JOIN `topic` ON `module`.`module_id` = `topic`.`module_id` WHERE `module`.`course_id` = $course_id ORDER BY `module`.`code`");
	if (mysqli_num_rows($result) != 0) {
		// output data of each row
		while ($row = mysqli_fetch_array($result)) {
			$rows[] = array(
				'id' => $row['module_id'],
				'name' => $row['name'],
				'code' => $row['code'],
				'CountT' => $row['CountT']
			);
		}
	} else {
		$errors[]  = 'No module found';
	}
} else {
	$errors[]  = 'No data has been send';
}
if (!empty($errors)) {
	$rows['errors']  = $errors;
}
echo json_encode($rows);
?>