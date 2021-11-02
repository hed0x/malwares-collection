//"S" = activa marquesina        "N" = desactiva marquesina

var estado="N";

//----------- declaracion del objeto marquesina --------------------------------
function Marquesina(layr,layr1){  
        this.crearCadenaTexto = crearCadenaTexto;
        this.layr=layr;
        this.ind1=0;
        this.espera=125;  
        this.sentido=1;
        this.mensaje=1;
        //Funciones
        this.actualizar = actualizar;
        this.escribeMarq = escribeMarq;
        this.crearCadenaTexto();
}
//---------- se crea la cedena de texto que se va a mostrar -----------------------
function crearCadenaTexto(){
         var indice;
         
         var msg1 = "E-S-T-E- -D-O-M-I-N-G-O- -E-N- -L-A- -M-A-D-R-U-G-A-D-A- -E-N-T-R-E- -L-A- -2-:-0-0- -A-M"; 
         var msg2 = "Y- -L-A-S- -6-:-0-0- -A-M- -S-U-S-P-E-N-D-E-R-E-M-O-S- -N-U-E-S-T-R-O-S- -S-E-R-V-I-C-I-O-S"; 
         var msg3 = "P-A-R-A- -R-E-A-L-I-Z-A-R- -M-A-N-T-E-N-I-M-I-E-N-T-O-S- -Y- -M-E-J-O-R-A-S-."; 
         var msg4 = "G-R-A-C-I-A-S- -P-O-R- -S-U- -C-O-M-P-R-E-N-S-I-Ó-N"; 

	 switch(this.mensaje){
		case 1: var arreglo = msg1.split("-"); break;	
		case 2: var arreglo = msg2.split("-"); break;	
		case 3: var arreglo = msg3.split("-"); break;	
		case 4: var arreglo = msg4.split("-"); break;	
         }
         var cadena = "";  
         if (this.sentido == 1){    
            for(indice = 0;indice <= this.ind1; indice++){
               cadena = cadena + arreglo[indice];    
            }      
         } 
         if (this.sentido == 2){    
            for(indice = this.ind1;indice <= arreglo.length - 1; indice++){
               cadena = cadena + arreglo[indice];    
            }      
         } 
         if (this.ind1 == arreglo.length - 1){
             this.ind1 = 0;
             this.espera = 10000;
         }
         this.display = cadena;
}
//----------- se actualiza el layer que sirve de marquesina ----------
function actualizar(){

        this.crearCadenaTexto();
        this.escribeMarq();
        this.ind1 += 1;  
        if (this.espera == 10000){
            this.espera = 125;
            if (this.sentido == 1){
                this.sentido = 2; 
            } 
            else{
                 this.sentido = 1;
		 switch(this.mensaje){
		       case 1: this.mensaje = 2; break;	
		       case 2: this.mensaje = 3; break;	
		       case 3: this.mensaje = 4; break;	
		       case 4: this.mensaje = 1; break;	

	         }
            }   
        }  
        window.setTimeout("marq.actualizar()", this.espera);
}
//---------- escribe el layer que sirve de marquesina ---------
function escribeMarq(){

        var htmlOut;
        if(this.sentido == 1){
          htmlOut = "<font face='Arial, Helvetica, sans-serif' size='1' color='#0066CC'><b>" +this.display +"</b></font>";
        }
        else{
             htmlOut = "<font face='Arial, Helvetica, sans-serif' size='1' color='#0066CC'><b>" +this.display +"</b></font>";
        } 
        if(document.layers) {
                this.layr.document.open();
                this.layr.document.write(htmlOut);
                this.layr.document.close();
        } else {
                this.layr.innerHTML = htmlOut;
        }
}
//------------ generacion de marquesina desplazable -------------------------
function Marquesinadez() {
        
        if(estado == "S"){
	if(document.layers){
                marq = new Marquesina(document.layers["marquesinaNs"])  // Netscape syntax
                marq.actualizar();
        } else {
                marq = new Marquesina(document.all["marquesinaIe"])  // IE syntax
                marq.actualizar();
        }
	}        
        
}



function marcar(){
	if(estado == "S"){
		if(document.all){
		document.write("<div id='marquesinaIe' style='position:absolute; left:2px; top:10px; width:355px; height:16px; z-index:1' > ");
			document.write("<marquee behavior='scroll' scrolldelay='125'>");
		      		document.write("<font class='c7'>ESTE DOMINGO EN LA MADRUGADA  ENTRE LAS 2:00 AM Y LAS 6:00 AM SUSPENDEREMOS NUESTROS SERVICIOS PARA REALIZAR MANTENIMIENTOS Y MEJORAS. GRACIAS POR SU COMPRENSIÓN.</font> ");
		  	document.write("</marquee>");
		document.write("</div>");
		}
	}
}



