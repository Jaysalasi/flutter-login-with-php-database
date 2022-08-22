<?php 

$db = mysqli_connect("localhost", "root", "", "logic"); //

if(isset($_POST["email"]) && isset($_POST["password"])) {
    
    $email = $_POST["email"];
    $sql1 = "SELECT * FROM `admin_table` WHERE email ='$_POST[email]' LIMIT 1";

    $query = "INSERT INTO `admin_table`(`email`, `password`) 
      VALUES ('$_POST[email]','$_POST[password]')";

      $result = mysqli_query($db, $sql1);
      $user = mysqli_fetch_assoc($result);

      if ($user) {
        if ($user['email'] == $email) {
            echo json_encode("user exist");
        }
        
    }  else {
        // insert into database
          mysqli_query($db, "INSERT INTO `admin_table`(`email`, `password`) 
          VALUES ('$_POST[email]','$_POST[password]')");

        //   json output
        echo json_encode("registration successful");
        // echo json_encode($email);
    }
  } 

    ?>
