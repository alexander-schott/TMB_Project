<?php
require_once 'dbconfig.php';
if(!empty($_GET['logout']) && $_GET['logout']=="true")
{
  session_destroy();
  unset($_SESSION['user_session']);
}

if(isset($_POST['btn-login']))
{
 $uid = $_POST['txt_uid'];
 $upass = $_POST['txt_password'];
    if($user->login($uid,$upass) == 2)
    {
        $user->redirect('admin_home.php');
    }
 else if($user->login($uid,$upass) == 1)
 {
     $user->redirect('home.php');
 }
 else
 {
  $error = "Wrong Details !";
 } 
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="style.css" type="text/css"  />
  </head>
  <body>
    <div class="container">
      <div class="form-container">
        <form method="post">
          <h2>Sign In</h2><hr />
          <?php
          if(isset($error))
          {
                ?>
                <div class="alert alert-danger">
                    <i class="glyphicon glyphicon-warning-sign"></i> &nbsp; <?php echo $error; ?> !
                </div>
                <?php
          }
          ?>
          <div class="form-group">
           <input type="text" class="form-control" name="txt_uid" placeholder="User ID" required />
          </div>
          <div class="form-group">
           <input type="password" class="form-control" name="txt_password" placeholder="Your Password" required />
          </div>
          <div class="clearfix"></div><hr />
          <div class="form-group">
           <button type="submit" name="btn-login" class="btn btn-block btn-primary">
               <i class="glyphicon glyphicon-log-in"></i>&nbsp;SIGN IN
              </button>
          </div>
          <br />
          <label>Don't have account yet ! <a href="signup.php">Sign Up</a></label>
        </form>
      </div>
    </div>
  </body>
</html>
