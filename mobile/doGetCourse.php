<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';

$rows = array();
//$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `course`");
$result = mysqli_query($GLOBALS["con"],"SELECT `course`.*, COUNT(`module`.`module_id`) AS CountM FROM `course` LEFT JOIN `module` ON `course`.`course_id` = `module`.`course_id` GROUP BY `course`.`course_id`");
if (mysqli_num_rows($result) != 0) {
	// output data of each row
	while ($row = mysqli_fetch_assoc($result)) {
		$rows[] = array(
			'id' => $row['course_id'],
			'name' => $row['name'],
			'description' => $row['description'],
			'CountM' => $row['CountM']
		);
	}
} else {
	
}
echo json_encode($rows);
?>