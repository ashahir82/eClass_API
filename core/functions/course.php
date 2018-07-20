<?php
function topic_exists($topic_id) {
	$topic_id = sanitize($topic_id);
	$query = mysqli_query($GLOBALS["con"],"SELECT COUNT(`topic_id`) FROM `topic` WHERE `topic_id` = $topic_id");
	return (mysqli_result($query, 0) == 1) ? true : false;
}

function topic_name($topic_id) {
	$topic_id = (int)$topic_id;
	$query = mysqli_query($GLOBALS["con"],"SELECT `name` FROM `topic` WHERE `topic_id` = $topic_id");
	if (mysqli_num_rows($query) != 0) {
		return mysqli_result($query, 0, 'name');
	} else {
		return $topic_id;
	}
}

function topic_module($topic_id) {
	$topic_id = (int)$topic_id;
	$query = mysqli_query($GLOBALS["con"],"SELECT `module_id` FROM `topic` WHERE `topic_id` = $topic_id");
	if (mysqli_num_rows($query) != 0) {
		return mysqli_result($query, 0, 'module_id');
	} else {
		return $topic_id;
	}
}
?>