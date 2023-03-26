<!DOCTYPE html>
<html>
<head>
	<title>Collision in MegaDiscoteca5</title>
</head>
<body>

<!-- Codul in PHP, ca sa nu zici ca nu stii chiar nimic:

$flag='flag{fake_flag_4_testing}';
if (isset($_GET['arg1']) and isset($_GET['arg2'])) {
    if ($_GET['arg1'] != $_GET['arg2'])
        if (md5($_GET['arg1']) === md5($_GET['arg2']))
            die('Faina treaba, ia steagul asta '.$flag);
    else
        print 'Scuze, mai invata si tu ...';
}
-->
<?php
error_reporting(0);
$flag='flag{wow_2_strings_with_the_same_MD5_sum__or_is_That_so}';
if (isset($_GET['arg1']) and isset($_GET['arg2'])) {
    if ($_GET['arg1'] != $_GET['arg2'])
    	if (md5($_GET['arg1']) === md5($_GET['arg2']))
        	die('Faina treaba, ia steagul asta '.$flag);
    else
        print 'Scuze, mai invata si tu ...';
}
?>
</body>
</html>
