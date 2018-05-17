       
    
    //recortador en forma de cubo con bordes redondeados por funcion minkowski
    module recortadorMink(lonX=20,lonY=20,lonZ=20,esf=1){
        minkowski(){
        cube([lonX-(2*esf),lonY-(2*esf),lonZ-(2*esf)],center=true);
            sphere(r=esf,$fn=100);
            }
    }
    
    //recortador en forma de trangulo con bordes redondeados por funcion minkowski
        module recortadorMinkPoly(Base=40,Altura=20,Circulo=2){
            translate([Circulo,Circulo])
       minkowski(){
          polygon([[Base-(2*Circulo),0],[0,Altura-(2*Circulo)],[0,0]]);
          circle(r=Circulo,$fn=100);
       }
   }
   
   module RecortadorEstrella(lonX=50, lonY=50,orillas=2.5,redondeadorPoly=1.4){
       
          beta=90-atan(lonY/lonX);
       //echo(90-atan(lonY/lonX));
       //PRUEBAS CON FACTOR DE RELACION
        ajusteOrillasDiagonal=1;
       
       difference(){
           //cuadrado a taladrar
           square([lonX,lonY],center=true);
           circle(r=(2*orillas)-redondeadorPoly,$fn=100);
 
           
           //##Cuadrante(1,-1)
        translate([orillas,-(lonY/2)+orillas])
                     recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
      
           translate([lonX/2-orillas,-orillas])
           rotate(180)
             recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
           
            //##Cuadrante(-1,-1)
           mirror([1,0]){
        translate([orillas,-(lonY/2)+orillas])
                     recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
      
           translate([lonX/2-orillas,-orillas])
           rotate(180)
             recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
           }
           
           
           //##Cuadrantes (1,1) y (-1,1)
           mirror([0,1]){
                 //#Elemento1
        translate([orillas,-(lonY/2)+orillas])
                     recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
      
           translate([lonX/2-orillas,-orillas])
           rotate(180)
             recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
           
         //Elemento 2
           mirror([1,0]){
        translate([orillas,-(lonY/2)+orillas])
                     recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
      
           translate([lonX/2-orillas,-orillas])
           rotate(180)
             recortadorMinkPoly(lonX/2-(3*orillas)-((orillas+2*redondeadorPoly)*cos(beta)),lonY/2-(ajusteOrillasDiagonal*orillas)-(3*orillas*sin(beta)),redondeadorPoly);
           }
           
           }
           
           
           
           
       
       }

}//fin recortador estrella
   
 module panelMatriz(lonX=20,lonY=20,taladro=0.5,divisiones=10){
        translate([-(lonX/2),-(lonY/2)])
     difference(){
        square([lonX,lonY]);
     
         translate([(lonX/(divisiones+1)),(lonY/(divisiones+1))])
        for(i=[0:divisiones-1]){
            for(j=[0:divisiones-1]){
                translate([(lonX/(divisiones+1))*i,(lonY/(divisiones+1))*j])
                circle(r=taladro,$fn=100);
            }
        }
    }
}//fin module
    
    //######RENDERIZADOS######

//Se recomienda no tener renderizados (debugging)    

//panelMatriz(lonX=40,lonY=40,taladro=2,divisiones=4);

   //recortadorMinkPoly(25,25,4);
    
//RecortadorEstrella(lonX=200, lonY=200,orillas=10,redondeadorPoly=6);
    
   //recortadorMink(lonX=10,lonY=20,lonZ=10,esf=3);