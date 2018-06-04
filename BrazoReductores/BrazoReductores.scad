
//home/pablovc/Documentos/OpenSCAD-free-models/SistemaTiDi
include<./../CASEgamma/CASEgamma.scad>;
include<./../Componentes/boards.scad>;
include<./../Componentes/sensores.scad>;
include<./../Componentes/motores.scad>;
include<./../Utilidades/Utilities.scad>;



module caMaReDoE(medidaX=64.2,medidaY=22.5,medidaZ=18.8,espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1,parte=0){
    lonX=medidaX+(2*(espesor+tolerancia+espaciaminetoX));
    lonY=medidaY+(2*(espesor+tolerancia));
    lonZ=(medidaZ*2)+(2*espesor+tolerancia);
        orillasRec=3;
    
    difference(){
        CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=parte);
        //motor reductor
        translate([0,0,-(lonZ-22.25)/2])
        rotate([90,0,0])
    redDobleEje(modo=0,centrado=2);
        
            translate([0,0,0])
        rotate([90,0,0])
            translate([0,0,-lonX*2])
           linear_extrude(height=lonX*4)
           RecortadorEstrellaInverso(lonX=lonX-(2*orillasRec)-(2*5),lonY=lonZ-(2*orillasRec)+4,orillas=3,redondeadorPoly=1);   
        
        
                   }
    }//fin module
    
    
    
    module tapaMotorRed(espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1){
        
        lonX=64.2+(2*(espesor+tolerancia+espaciaminetoX));
        lonY=22.5+(2*(espesor+tolerancia));
        lonZ=6;
        orillasRec=3;
        
        difference(){
                  CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ,espesor=1.5,diametroPoste=5,tornillo=2.5,parte=1);
            
            translate([0,0,-lonZ])
           linear_extrude(height=lonZ*2)
           RecortadorEstrellaInverso(lonX=lonX-(2*orillasRec),lonY=lonY-(2*orillasRec),orillas=2,redondeadorPoly=1);       
   
        }
        
        
        }

    
    module tapaMotorRedContra(espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1){
        
        lonX=64.2+(2*(espesor+tolerancia+espaciaminetoX));
        lonY=22.5+(2*(espesor+tolerancia));
        lonZ=6;
        orillasRec=3;
        
        difference(){
                  CASEgamma(lonX=lonX,lonY=lonY,lonZ=lonZ,espesor=1.5,diametroPoste=5,tornillo=3,parte=1);
            
            /*
            translate([0,0,-lonZ])
           linear_extrude(height=lonZ*2)
           RecortadorEstrellaInverso(lonX=lonX-(2*orillasRec),lonY=lonY-(2*orillasRec),orillas=2,redondeadorPoly=1);       
   */
            //reductor
            translate([0,0,18.8/2])
            rotate([90,0,0])
            redDobleEje(modo=0,centrado=2);
            
            
        }
        
        
        }

        

module caseMayorRedDobleEje(modo=0){
 escalamientoShaft=1.1;
    espesor=1.5;
    tolerancia=4;
    espaciaminetoX=5;
    escalamientoShaft=1.1;
    
       
        if(modo==0){  
                difference(){
                 caMaReDoE();
                }
         }       
              
   
             desplazamientoZ=(18.8*2+espesor+tolerancia+5)/4-3;
             desplazamientoX=(64.2+(2*(espesor+tolerancia+espaciaminetoX)))/2;
         
        if(modo==1){
            difference(){
                  caMaReDoE();
            //coples parte mOvil
            translate([-64.2*2,0,desplazamientoZ])
           rotate([0,90,0])
            rotate(90)
            linear_extrude(height=4*64.2)
        scale(escalamientoShaft)
        RedMotShaft(); 
            }    
         
    
              translate([desplazamientoX,0,desplazamientoZ])
              rotate([0,90,0])
                 for(i=[0:3]){
                     rotate(i*90)
                     translate([6,0,0])
                     difference(){
                    sphere(r=3);
                         translate([0,0,-3])
                    cube([6,6,6],center=true);
                    } 
                }
            //}
            
            mirror([1,0,0]){
     translate([desplazamientoX,0,desplazamientoZ])
              rotate([0,90,0])
                 for(i=[0:3]){
                     rotate(i*90)
                     translate([6,0,0])
                     difference(){
                    sphere(r=3);
                         translate([0,0,-3])
                    cube([6,6,6],center=true);
                    } 
                }
            }//fin mirror    
         }
}

//####PRUEBAS####


//BRAZO
/*
escalamientoShaft=1.1;
longitud=50;
radio=8;
linear_extrude(height=3)
difference(){
   seccionRedondoPlano(radio=radio,distancia=longitud);
        scale(escalamientoShaft)
        RedMotShaft(); 

}
translate([longitud+2,0,-2])
rotate([0,90,0])
rondana(ancho=12,radioInterno=2.5,radioExterno=4,resoluciOn=20);
*/


//parte 0
/*
CASEgamma(lonX=64.2+(2*(espesor+tolerancia+espaciaminetoX)),lonY=18.8+(2*(espesor+tolerancia)),lonZ=5,espesor=1.5,diametroPoste=5,tornillo=3,parte=1);
*/

//#####RENDERIZADOS#####
$fn=20;

//caMaReDoE(medidaX=64.2,medidaY=22.5,medidaZ=(18.8+18),espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1,parte=1);

//caseMayorRedDobleEje(modo=1);
  
//tapaMotorRedContra(espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1);

tapaMotorRed(espesor=1.5,tolerancia=4,espaciaminetoX=5,escalamientoShaft=1.1);