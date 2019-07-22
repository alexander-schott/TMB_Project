<?php
  include_once 'dbconfig.php';

  if(isset($_POST['submit']))
  {
    $user->redirect('show_blog_post.php');
  }
?>

<!DOCTYPE html>
<html>
  <head>
    <title>Blog Posts</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      th, td {
        text-align: center;
      }
      tr {
        curser : pointer;
        curser : hand;
      }
    </style>
  </head>
  <body>
    <h1 style="text-align:center">Blog Posts</h1>
    <div class="container">
      <table class="table table-hover table table-striped">
        <thead class="thead-dark">
          <tr>
            <th>Date</th>
            <th>Author</th>
            <th>Title</th>
          </tr>
         </thead>
        <?php
         $sql = "SELECT user_name, title, user_posting, post_timestamp, blogpost.id FROM `users`  
         INNER JOIN blogpost ON blogpost.user_id = users.user_id";  
         $stmt = $DB_con->prepare($sql);
         $stmt->execute();
          
         while ($data =$stmt->fetch(PDO::FETCH_ASSOC)) {
          $date = date("n-j-y", strtotime($data['post_timestamp']));
          $id = $data['id'];
          $title = $data['title'];
          $user_name = $data['user_name'];
          echo "<tr onclick=\"window.location='show_blog_post.php?id=$id'\"><td>$date</td><td>$user_name</td><td>$title</td></tr>\n";
        }?>
      </table>
    </div>
  </body>
</html>