(function($){
    $.zWebLanguage = {
        init:function(){
            var language = $.cookie( 'zmail300_language' );
            if(language != "CN"){
                this.change(language);
            }
        },
        change:function(aLanguage){
            if(gLanguage[aLanguage]){
                $("*[languageConfig]").each(function(){
                    var jsonObj = eval('('+this.getAttribute("languageConfig")+')');
                    if(!jsonObj){
                        return;
                    }
                    for(var name in jsonObj.attribute ){
                        try{
                            this.setAttribute(name,gLanguage[aLanguage][ jsonObj.attribute[name] ]);
                        }catch(ex){}
                    }
                    for(var name in jsonObj.property ){
                        try{
                            var isSet = true ;
                            if(this.id == "lgActIpt"){
                                isSet = false ;
                                switch(this.value){
                                    case gLanguage["EN"].account :
                                        isSet = true ;
                                    break;
                                    case gLanguage["CN"].account :
                                        isSet = true ;
                                    break;
                                    case gLanguage["HK"].account :
                                        isSet = true ;
                                    break;
                                }
                            }
                            if(isSet){
                                this[name] = window.gLanguage[aLanguage][ jsonObj.property[name] ];
                            }
                        }catch(ex){}
                    }
                });
                
                if(aLanguage == "EN" ){
                    //$("#logo").addClass("headerLogoEN");
                    //$("#mainBlock").addClass("mainBlockEN");
                    //$(".headerInfo").hide(0);
                    
                    $("#logo")[0].className = "headerLogoEN";
                    $("#mainBlock")[0].className = "mainBlockEN";
                    $(".headerInfo").hide(0);
                }else if(aLanguage == "HK" ){
                    $("#logo")[0].className = "headerLogoHK";
                    $("#mainBlock")[0].className = "mainBlockfan";
                    $(".headerInfo").show(0);
                }else{
                    $("#logo")[0].className = "headerLogo";
                    $("#mainBlock")[0].className = "mainBlock";
                    $(".headerInfo").show(0);
                }
            }
        }
    };
})(jQuery);

$(function(){
    $.zWebLanguage.init();
    $("#languageSelect").bind("change",function(){
        $.cookie("zmail300_language", this.value, { expires: 365, path: "/" });
        $.zWebLanguage.change(this.value);
    });
});

