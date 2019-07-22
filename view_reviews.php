<?php
      include_once 'dbconfig.php';
?>
<!DOCTYPE html>
<html>
  <head>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
      <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
      <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
      <script type="text/javascript" class="init">

          $(document).ready(function() {
              $('#reviews').DataTable();
          } );

      </script>
  </head>
  <body>
    <h1></h1>
    <table  id="reviews" class="table table-striped table-bordered" style="width:100%">
      <thead>
      <tr>
          <th class="th-sm">ID</th>
          <th class="th-sm">Station</th>
          <th class="th-sm">Shopping</th>
          <th class="th-sm">Connection Speed</th>
          <th class="th-sm">Comment</th>
          <th class="th-sm">Approval Status</th>
      </tr>
      </thead>
      <tbody>
        <?php
          $user_id = $_SESSION['user_session'];
          $stmt = $DB_con->prepare("SELECT * FROM Review
                                      WHERE passenger_ID=:user_id
                                      ORDER BY rid;");
          $stmt->bindparam(":user_id", $user_id);
          $stmt->execute();
          while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
               echo "<tr>";
               echo "<td>".$row['rid']."</td>";
               echo "<td>".$row['station_name']."</td>";
               echo "<td>".$row['shopping']."</td>";
               echo "<td>".$row['connection_speed']."</td>";
               echo "<td>".$row['comment']."</td>";
               echo "<td>".$row['approval_status']."</td>";
               echo "</tr>";
          }
      ?>

    </tbody>
  </body>
</html>
