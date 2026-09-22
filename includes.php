<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include __DIR__ . "/maintenance.php";
include __DIR__ . "/database.php";

$useridd = isset($_SESSION['id']) ? $_SESSION['id'] : null;

$_USER = null;
$tix = 0;
$auth = false;

if ($useridd !== null && isset($db)) {
    $sql = "SELECT * FROM users WHERE id = :id";
    $stupid = $db->prepare($sql);
    $stupid->execute([':id' => $useridd]);
    $_USER = $stupid->fetch();

    if ($_USER) {
        $tix = $_USER['tix'] ?? 0;
        $auth = true;
    }
}
?>
