<?php
  include_once 'dbconfig.php';
  
  if(isset($_POST['save_post'])) {
    $title = $_POST['ptitle'];
    $body = $_POST['pbody'];
    $user_id = $_SESSION['user_session'];
    
    try
     {
       $query = "INSERT INTO blogpost(title, user_id, user_posting) VALUES(:title, :user_id, :body)";
       $stmt = $DB_con->prepare($query);
       $stmt->bindparam(":title", $title);
       $stmt->bindparam(":user_id", $user_id);
       $stmt->bindparam(":body", $body);            
       $stmt->execute();
       $user->redirect('home.php');
     }
     catch(PDOException $e)
     {
         echo $e->getMessage();
     } 
  }

?>
<!DOCTYPE html>
<html>
  <head>
      <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <div class="form-container">
      <form method="post">
          Station: <select name="station_name" id="station_name">
              <?php
                  $stmt = $DB_con->prepare("SELECT name FROM Station
                    ORDER BY name;");
                  $stmt->execute();
                  while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                      echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
                  }

              ?>
          </select>
          Shopping: <select name="shopping" id="shopping">
              <option value='1'>1</option>
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
              <option value='5'>5</option>
          </select>
          Connection Speed: <select name="connection" id="connection">
              <option value='1'>1</option>
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
              <option value='5'>5</option>
          </select>
          <textarea name="pbody" id="pbody"></textarea><br>
          <button type="submit" name="save_post" class="btn btn-block btn-primary">Submit Review</button><br><hr>
      </form>
    </div>
  </body>
</html>
