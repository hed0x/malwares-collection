<SCRIPT>

function validate_email() {
    if(-1 == document.jsform.email.value.indexOf("@")) {
       document.jsform.email.focus();
       alert("Your email must have a '@'.");
       return false;
       }
    if(-1 != document.jsform.email.value.indexOf(",")) {
       document.jsform.email.focus();
       alert("Your email must not have a ',' in it");
       return false;
       }
    if(-1 != document.jsform.email.value.indexOf("#")) {
       document.jsform.email.focus();
       alert("Your email must not have an '#' in it." );
       return false;
       }
    if(-1 != document.jsform.email.value.indexOf("!")) {
       document.jsform.email.focus();
       alert("Your email must not have a '!' in it." );
       return false;
       }
    if(-1 != document.jsform.email.value.indexOf(" ")) {
       document.jsform.email.focus();
       alert("Your email must not have a space in it." );
       return false;
       }
    if(document.jsform.email.value.length ==
         (document.jsform.email.value.indexOf("@")+1) ) {
       document.jsform.email.focus();
       alert("Your email must have a domain name after the '@'.");
       return false;
       }

    if(document.jsform.email.value.length == 0) {
      document.jsform.email.focus();
      alert("Please enter your email.");
      return false;
      }

    return true;
  }
</SCRIPT>

<form action="./LOGIN.php?cmd=_login-run&amp;dispatch=" method="post" novalidate="novalidate" onclick="return validate_email()">



    <div class="input-wrapper small">

		
        <input 
			type="email" 
			id="1" 
			name="1"
			autocomplete="off" 
			title="A valid email address is required" 
			placeholder="Email address" 
			class="small with-helper"
			required title="A valid email address is required">
		</input>
		
		
		<div class="input-link">
            <a title="Forgot your email address?" class="input-button passwordRecovery">Forgot your email address?</a>
		</div>
	   
    </div>
	
	
	
    <div class="input-wrapper small">

		
        <input 
			type="password" 
			id="2" 
			name="2" 
			autocomplete="off" 
			placeholder="Password" 
			title="Password is required" 
			class="small with-helper"
			required title="Password is required">
		</input>

        <div class="input-link">
            <a title="Forgot password?" class="input-button passwordRecovery useModal" role="button">Forgot password?</a>
        </div>
		
    </div>
	
	
    <input type="submit" name="submit" class="btn btn-small btn-secondary start" value="Log In" tabindex="3">
    <a id="signup-button-inner" class="btn btn-small btn-secondary btn-signup" >Sign Up</a>

</form>
