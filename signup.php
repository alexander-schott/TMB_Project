<?php
require_once 'dbconfig.php';
if(isset($_POST['btn-signup']))
{
    $fname = trim($_POST['txt_fname']);
    $mi = trim($_POST['txt_mi']);
    $lname = trim($_POST['txt_lname']);
    $uid = trim($_POST['txt_uid']);
    $email = trim($_POST['txt_email']);
    $upass = trim($_POST['txt_upass']);
    $upass2 = trim($_POST['txt_upass2']);
 
   if($uid=="") {
      $error[] = "provide username !"; 
   }
   else if($email=="") {
      $error[] = "provide email id !"; 
   }
   else if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $error[] = 'Please enter a valid email address !';
   }
   else if($upass=="") {
      $error[] = "provide password !";
   }
   else if(strlen($upass) < 8){
      $error[] = "Password must be at least 8 characters";
   }
    if($upass2 != $upass) {
        $error[] = "passwords must match!";
    }
   else
   {
      try
      {
         $stmt = $DB_con->prepare("SELECT ID, first_name, minit, last_name, password, passenger_email FROM User WHERE ID=:uid OR passenger_email=:email");
         $stmt->execute(array(':uid'=>$uid, ':email'=>$email));
         $row=$stmt->fetch(PDO::FETCH_ASSOC);
    
         if($row['ID']==$uid) {
            $error[] = "sorry username already taken !";
         }
         else
         {
            if($user->register($uid,$fname,$mi,$lname,$upass,$email))
            {
                $user->redirect('signup.php?joined');
            }
         }
     }
     catch(PDOException $e)
     {
        echo $e->getMessage();
     }
  } 
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sign Up</title>
    <link rel="stylesheet" href="style.css" type="text/css"  />
  </head>
  <body>
    <div class="container">
      <div class="form-container">
         <form method="post">
            <h2>Sign Up</h2><hr />
              <?php
              if(isset($error))
              {
                 foreach($error as $error)
                 {
                    ?>
                    <div class="alert alert-danger">
                        <i class="glyphicon glyphicon-warning-sign"></i> &nbsp; <?php echo $error; ?>
                    </div>
                    <?php
                 }
              }
              else if(isset($_GET['joined']))
              {
                   ?>
                   <div class="alert alert-info">
                        <i class="glyphicon glyphicon-log-in"></i> &nbsp; Successfully registered <a href='index.php'>login</a> here
                   </div>
                   <?php
              }
              ?>
             <div class="form-group">
                 <input type="text" class="form-control" name="txt_fname" placeholder="First Name" value="<?php if(isset($error)){echo $fname;}?>" />
             </div>
             <div class="form-group">
                 <input type="text" class="form-control" name="txt_mi" placeholder="M.I." value="<?php if(isset($error)){echo $mi;}?>" />
             </div>
             <div class="form-group">
                 <input type="text" class="form-control" name="txt_lname" placeholder="Last Name" value="<?php if(isset($error)){echo $lname;}?>" />
             </div>
              <div class="form-group">
                <input type="text" class="form-control" name="txt_uid" placeholder="User ID (Unique)" value="<?php if(isset($error)){echo $uid;}?>" />
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="txt_email" placeholder="Email" value="<?php if(isset($error)){echo $email;}?>" />
              </div>
              <div class="form-group">
               <input type="password" class="form-control" name="txt_upass" placeholder="Enter Password" />
              </div>
             <div class="form-group">
                 <input type="password" class="form-control" name="txt_upass2" placeholder="Renter Password" />
             </div>
              <div class="clearfix"></div><hr />
              <div class="form-group">
                <button type="submit" class="btn btn-block btn-primary" name="btn-signup">
                  <i class="glyphicon glyphicon-open-file"></i>&nbsp;SIGN UP
                </button>
              </div>
              <br />
              <label>have an account ! <a href="index.php">Sign In</a></label>
            </form>
      </div>
    </div>
  </body>
</html>
