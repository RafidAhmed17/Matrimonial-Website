<?php

  require('php/connect.php'); // Adding connect file for database connection
  session_start();

  $email = $_SESSION['email_id'];
  $sql0 = "SELECT c.Name,c.DateOfBirth,c.Email,c.Occupation,c.MobileNo,g.gender,co.country,co.MotherTongue,r.Religion
  from customer c,gender g, country co,religion r
  WHERE c.Email='$email' AND c.GID=g.GID AND c.CID = co.CID AND c.RID=r.RID";
  $result0 = mysqli_query($conn, $sql0);

  while($row = mysqli_fetch_array($result0)) {
    $name = $row['Name'];
    $dob = $row['DateOfBirth'];
    $email = $row['Email'];
    $occupation = $row['Occupation'];
    $mobileno = $row['MobileNo'];
    $gender = $row['gender'];
    $country = $row['country'];
    $mothertongue = $row['MotherTongue'];
    $religion = $row['Religion'];
    
  }
?>


<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
        <link rel="stylesheet" type="text/css" href="css/ProfilePage.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
</head>
<body>
    <div class="box1"> 
    
        <div> <a  class="logo" href="HomePage.html"><h1 class="header">BIBAH</h1> </a> </div>
         <h2>Profile</h2>
         <div class="buttons">
             <ul>
                <li><div class="search"><a class="btn srch"><img width="15px" height="15px" src="pics/search.png"> <p>SEARCH</p></a></div></li>
                <li><a class="btn logOut" href="HomePage.html">LOG OUT</a></li>
             </ul>
        </div>   
    </div>
    <br>
    <div class="box2">
        <div class="leftSection">
            <h1 class="infoFont">Name</h1>
            <h1 class="infosubFont"><?php echo $name ?></h1>
            <br>
            <h1 class="infoFont">E-mail</h1>
            <h1 class="infosubFont"><?php echo $email ?></h1>
            <br>
            <h1 class="infoFont">Date Of Birth</h1>
            <h1 class="infosubFont"><?php echo $dob ?></h1>
            <br>
            <h1 class="infoFont">Gender</h1>
            <h1 class="infosubFont"><?php echo $gender ?></h1>
            <br>
            <h1 class="infoFont">Occupation</h1>
            <h1 class="infosubFont"><?php echo $occupation ?></h1>
        </div>
        <div class="rightSection">
            <h1 class="infoFont">Religion</h1>
            <h1 class="infosubFont"><?php echo $religion ?></h1>
            <br>
            <h1 class="infoFont">Country</h1>
            <h1 class="infosubFont"><?php echo $country ?></h1>
            <br>
            <h1 class="infoFont">Mother Tongue</h1>
            <h1 class="infosubFont"><?php echo $mothertongue ?></h1>
            <br>
            <h1 class="infoFont">Mobile No</h1>
            <h1 class="infosubFont"><?php echo $mobileno ?></h1>
        </div>

    </div>



</body>
</html>