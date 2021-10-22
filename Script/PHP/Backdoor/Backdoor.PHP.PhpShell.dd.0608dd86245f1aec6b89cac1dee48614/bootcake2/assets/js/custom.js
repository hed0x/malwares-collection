jQuery(document).ready(function(){

jQuery("table#wp-calendar").addClass("table table-striped");
  
});

jQuery(document).ready(function(){

   var btt=jQuery('.back-to-top');


   btt.on('click',function(e){

      jQuery('html,body').animate({

        scrollTop:0
      },500);

      e.preventDefault();

   });

   jQuery(window).on('scroll',function(){

    var self = jQuery(this),

       height=self.height(),
       top=self.scrollTop();

       if (top > height) {
           
           if (!btt.is(':visible')) {

            btt.show();

           }

       }else{
            btt.hide();      

           }

   });




});
