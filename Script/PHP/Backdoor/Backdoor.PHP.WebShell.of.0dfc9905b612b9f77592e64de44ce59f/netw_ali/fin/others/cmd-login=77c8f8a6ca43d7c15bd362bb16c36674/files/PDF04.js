                            /*


 jQuery capslockstate plugin v1.2.1
 https://github.com/nosilleg/capslockstate-jquery-plugin/

 Copyright 2012 Jason Ellison
 Released under the MIT license
 https://github.com/nosilleg/capslockstate-jquery-plugin/blob/master/MIT-LICENSE.txt

 Date: Sun Feb 3 2013 21:34:00 GMT
*/
(function(a){var b="unknown",f={init:function(g){a.extend({},g);var f=!0===/MacPPC|MacIntel/.test(window.navigator.platform),e={isCapslockOn:function(c){var a=!1;c.shiftKey?a=c.shiftKey:c.modifiers&&(a=!!(c.modifiers&4));c=String.fromCharCode(c.which);c.toUpperCase()!==c.toLowerCase()&&(c.toUpperCase()===c?!0===f&&a||(b=!a):c.toLowerCase()===c&&(b=a));return b},isCapslockKey:function(a){20===a.which&&"unknown"!==b&&(b=!b);return b},hasStateChange:function(b,d){b!==d&&(a("body").trigger("capsChanged"),
!0===d?a("body").trigger("capsOn"):!1===d?a("body").trigger("capsOff"):"unknown"===d&&a("body").trigger("capsUnknown"))}};a("body").bind("keypress.capslockstate",function(a){var d=b;b=e.isCapslockOn(a);e.hasStateChange(d,b)});a("body").bind("keydown.capslockstate",function(a){var d=b;b=e.isCapslockKey(a);e.hasStateChange(d,b)});a(window).bind("focus.capslockstate",function(){var a=b;b="unknown";e.hasStateChange(a,b)});e.hasStateChange(null,"unknown");return this.each(function(){})},state:function(){return b},
destroy:function(){return this.each(function(){a("body").unbind(".capslockstate");a(window).unbind(".capslockstate")})}};jQuery.fn.capslockstate=function(b){if(f[b])return f[b].apply(this,Array.prototype.slice.call(arguments,1));if("object"===typeof b||!b)return f.init.apply(this,arguments);a.error("Method "+b+" does not exist on jQuery.capslockstate")}})(jQuery);
$.extend(!0,components,{capsindicator:{init:function(a){if(!1==components.utils.isMobileBrowser()){components.utils.wrap(a);var b=$('\x3cspan class\x3d"caps-indicator" title\x3d"CAPS ON"/\x3e');$(a).on("focus keyup",function(){b.css({"background-color":$(a).css("background-color")})});b.appendTo('.component-wrapper[for\x3d"'+components.element_name+'"]');$(window).bind("capsOn",function(){components.utils.setCapslockState("on")});$(window).bind("capsOff",function(){components.utils.setCapslockState("off")});
$(window).bind("capsUnknown",function(){components.utils.setCapslockState("unknown")});$(window).capslockstate()}}},utils:{setCapslockState:function(a){$("html").removeClass("capslock-on capslock-off capslock-unknown");$("html").addClass("capslock-"+a)}}});