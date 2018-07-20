<?php
// Error massage
$connect_error ='Harap maaf, laman ini mengalami masalah sambungan pangkalan data.';
// Create connection
$con = mysqli_connect('localhost', 'root', 'd33d@t82', 'eclass');
// Check connection
if (!$con) {
    die("Sambungan gagal: " . $connect_error);
}
?>