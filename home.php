<?php
include_once 'dbconfig.php';
if(!($user->is_loggedin()))
{
 $user->redirect('index.php');
}
$uid = $_SESSION['user_session'];
$stmt = $DB_con->prepare("SELECT * FROM User WHERE ID=:uid");
$stmt->execute(array(":uid"=>$uid));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css"  />
<title>welcome - <?php print($userRow['user_email']); ?></title>
<style>
h2 {
    border: 1px solid black;
    display:inline;
  }
</style>
</head>

<body>

<div class="header">
 <div class="left">
    </div>
    <div class="right">
        <label><a href="leave_review.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>Leave Review</span></a></label>
        <label><a href="view_reviews.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>View Reviews</span></a></label>
        <label><a href="buy_card.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>Buy Card</span></a></label>
        <label><a href="go_on_trip.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>Go on Trip</span></a></label>
        <label><a href="view_trips.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>View Trips</span></a></label>
        <label><a href="edit_profile.php"><i class="glyphicon glyphicon-pencil"></i><span style='border:2px black solid'>Edit Profile</span></a></label>
    </div>
</div>
<div class="content">
Welcome  <?php print "{$userRow['first_name']} {$userRow['last_name']}"; ?>
</div>
</body>
</html>
