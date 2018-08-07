<?php
header("Access-Control-Allow-Origin: *");//to allow cross-site

include '../core/init.php';

if(isset($_GET['username'])) {
	$username=sanitize($_GET['username']);
	$rows = array();
	$rowsResult = array();
	
	$module = mysqli_query($GLOBALS["con"],"SELECT `module`.`module_id`, `module`.`name`, `module`.`code` FROM `enroll` RIGHT JOIN `topic` ON `enroll`.`topic_id` = `topic`.`topic_id` RIGHT JOIN `module` ON `topic`.`module_id` = `module`.`module_id` WHERE `username` = '$username' GROUP BY `module`.`module_id`");
	if (mysqli_num_rows($module) != 0) {
		// output data of each row
		while ($rowModule = mysqli_fetch_assoc($module)) {
			$rowsResult = array();
			//$result = mysqli_query($GLOBALS["con"],"SELECT * FROM `enroll` RIGHT JOIN `topic` ON `enroll`.`topic_id` = `topic`.`topic_id` WHERE (`username` IS NULL OR `username` = '$username') AND `module_id` = " . $rowModule['module_id'] . " ORDER BY `topic`.`le_no`");
			$result = mysqli_query($GLOBALS["con"],"SELECT `topic`.* FROM `topic` WHERE `topic`.`module_id` = " . $rowModule['module_id'] . " ORDER BY `topic`.`le_no`");
			while ($rowResult = mysqli_fetch_assoc($result)) {
				$rowc = mysqli_query($GLOBALS["con"],"SELECT `note`, `quiz`, `active` FROM `enroll` WHERE `topic_id` = " . $rowResult['topic_id'] . " AND `username` = '$username'");
				if (mysqli_num_rows($rowc) != 0) {
					while ($erow = mysqli_fetch_array($rowc)) {
						$rowsResult[] = array(
							'topic_id' => $rowResult['topic_id'],
							'module_id' => $rowResult['module_id'],
							'le_no' => ($rowResult['le_no'] < 10) ? "0" . $rowResult['le_no'] : $rowResult['le_no'],
							'name' => $rowResult['name'],
							'note' => $erow['note'],
							'quiz' => $erow['quiz'],
							'active' => $erow['active']
						);
					}
				} else {
					$rowsResult[] = array(
						'topic_id' => $rowResult['topic_id'],
						'module_id' => $rowResult['module_id'],
						'le_no' => ($rowResult['le_no'] < 10) ? "0" . $rowResult['le_no'] : $rowResult['le_no'],
						'name' => $rowResult['name'],
						'note' => NULL,
						'quiz' => NULL,
						'active' => NULL
					);
				}
			}
			$rows[] = array(
				'module_id' => $rowModule['module_id'],
				'name' => $rowModule['name'],
				'code' => $rowModule['code'],
				'topics' => $rowsResult
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