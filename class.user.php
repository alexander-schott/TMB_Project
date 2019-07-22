<?php
class USER
{
    private $db;
 
    public function __construct()
    {
        global $DB_con;
        $this->db = $DB_con;
    }
 
    public function register($uid,$fname,$mi,$lname,$upass,$email)
    {
       try
       {
           $stmt = $this->db->prepare("INSERT INTO User(ID, first_name, minit, last_name, password, passenger_email) 
                                                       VALUES(:uid, :fname, :mi, :lname, :upass, :email)");
              
           $stmt->bindparam(":uid", $uid);
           $stmt->bindparam(":fname", $fname);
           $stmt->bindparam(":lname", $lname);
           $stmt->bindparam(":mi", $mi);
           $stmt->bindparam(":upass", $upass);
           $stmt->bindparam(":email", $email);
           $stmt->execute(); 
   
           return $stmt; 
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }    
    }
 
    public function login($uid,$upass)
    {
       try
       {
          $stmt = $this->db->prepare("SELECT * FROM User WHERE ID=:uid");
           $stmt->execute(array(':uid'=>$uid));
           $userRow=$stmt->fetch(PDO::FETCH_ASSOC);
           if($stmt->rowCount() > 0)
          {
             if($upass==$userRow['password'])
             {
                 $_SESSION['user_session'] = $userRow['ID'];
                 $id = $_SESSION['user_session'];
                 $stmt1 = $this->db->prepare("SELECT ID FROM ADMIN
		                                          WHERE ID =:uid;");
                 $stmt1->execute(array(':uid'=>$uid));
                 if($stmt1->rowCount() > 0) {
                     return 2;
                 }
                 return 1;
             }
             else
             {
                return 0;
             }
          }
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }
   }
 
   public function is_loggedin()
   {
      if(isset($_SESSION['user_session']))
      {
         return true;
      }
      return false;
   }
 
   public function redirect($url)
   {
       header("Location: $url");
   }
 
   public function logout()
   {
        session_destroy();
        unset($_SESSION['user_session']);
        return true;
   }
}
?>
