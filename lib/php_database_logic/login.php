<?php
  $db = mysqli_connect("localhost", "root", "", "logic"); //

  // down here is just checking database connection state
  // if (!$db) {
  //     die("failed to connect" . mysqli_connect_error());
  // }



  // reading email and password input from pressed button
  if(isset($_POST["email"]) && isset($_POST["password"])) {
    
    $email = $_POST["email"];
    $password = $_POST["password"];

    // mysqli database querry
    $sql = "SELECT * FROM `admin_table` WHERE `email`='$email' && `Password`='$password'";

    $res = mysqli_query($db, $sql);
    $count = mysqli_num_rows($res);
    

    if($count != 0) {
      // connection established
      
      if($email && $password ) {
        // checking if email and password are correct
        echo json_encode("success");

      } else {
        // incorrect credentials
        echo json_encode("wrong email and password");
        
      }
    } else {
      // when no user found
      echo json_encode("no user found");

    }
    
  } else {

    // connection error
    json_encode("connection error");
 
  }

  // mysqli_close($db);

  header('Content-Type: application/json');


?>