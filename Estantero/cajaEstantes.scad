//modulos para el renderizado de varios tipos de caja a manufacturear en la máquina de corte lAser

//Largo se desplaza en "X"
//Ancho se desplaza en "Y"

module base(largo=80,ancho=80,espesor=3,dientes=20,Up=1,Down=1,Left=1,Right=1){
tamDientesLargo=(largo)/dientes;
tamDientesAncho=(ancho)/dientes;


union(){

//Dientes derecha
  if(Right==1){
    translate([largo/2,-ancho/2-tamDientesAncho/2])
    for(i=[1:dientes/2]){
       translate([0,tamDientesAncho*2*i])
       square([2*espesor,tamDientesAncho],center=true);
    }
}

//Dientes Izquierda

if(Left==1){
   translate([-largo/2,-ancho/2-3*tamDientesAncho/2])
   for(i=[1:dientes/2]){
      translate([0,tamDientesAncho*2*i])
      square([2*espesor,tamDientesAncho],center=true);
   }
}

//Dientes Arriba

if(Up==1){
   translate([-largo/2-3*tamDientesLargo/2,ancho/2])
   for(i=[1:dientes/2]){
     translate([tamDientesLargo*2*i,0])
     square([tamDientesLargo,2*espesor],center=true);
   }
}

//Dientes Abajo

if(Down==1){
   translate([-largo/2-tamDientesLargo/2,-ancho/2])
    for(i=[1:dientes/2]){
     translate([tamDientesLargo*2*i,0])
     square([tamDientesLargo,2*espesor],center=true);
    }
}

//Cuadrado
square([largo,ancho],center=true);
}

}//Fin module base


module pruebaBase (largo=40,ancho=30,alto=40,espesor=3,dientes=6){

  for(i=[1:3]){
    for(j=[1:2]){
      translate([((i*largo)+(i*2.5*espesor)),((j*ancho)+(j*2.5*espesor))])
      base(largo,ancho,espesor,dientes);
    }
  }

}//Fin module pruebaBase

//####CUBO BASE####//

module CuboBase (largo=40,ancho=30,alto=40,espesor=3,dientes=6){

//base y tapa
  for(i=[0:1]){
      translate([((i*largo)+(i*2.5*espesor)),0])
      base(largo,ancho,espesor,dientes,1,1,1,1);
  }

//lados largo
 translate([0,(ancho+alto)/2+(2.5*espesor)])
for(i=[0:1]){
   translate([((i*largo)+(i*2.5*espesor)),0])
   base(largo,alto,espesor,dientes,1,  1,1,1);
}

//lados alto
 translate([0,-ancho-(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*alto)+(i*2.5*espesor)),0])
     base(alto,ancho,espesor,dientes,1,1,1,1);
   }

}//Fin module CuboBase

//#####CAJA SIN O CON TAPA####//

module cajaSCTapa (largo=40,ancho=30,alto=40,espesor=3,dientes=6,modo=1){

//base
        
    if(modo==2){
    base(largo,ancho,espesor,dientes,1,1,0,0);
        }
       else{
        base(largo,ancho,espesor,dientes,1,1,1,1);
           }
    
//Tapa
    
 if(modo==1){
    translate([((largo)+(2.5*espesor)),0])
    square([largo,ancho],center=true);
    
    translate([((largo)+(2.5*espesor)),-ancho/2+(1.5*espesor)])
    square([largo+2*espesor,espesor],center=true);
  
     translate([((largo)+(2.5*espesor)),+ancho/2])
    square([2*espesor,2*espesor],center=true);
 }

//lados largo
 
 if(modo==1){
 
    translate([0,(ancho+alto)/2+(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*largo)+(i*2.5*  espesor)),0])
       difference(){
      base(largo,alto,espesor,dientes,0,  1,1,1);
           translate([0,(alto)/2])
       square([i*2*espesor,i*2*espesor],center=true);
        }
   }
 }
 
 if(modo==2){
      translate([0,(ancho+alto)/2+(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*largo)+(i*2.5*  espesor)),0])
      base(largo,alto,espesor,dientes,0,  1,0,0);   
   }
 
 } 
 
 else{
     
 translate([0,(ancho+alto)/2+(2.5*espesor)])
   for(i=[0:1]){
      translate([((i*largo)+(i*2.5*  espesor)),0])
       
      base(largo,alto,espesor,dientes,0,  1,1,1);
        
   }
 
  }



//lados alto
   
  
  if(modo==1){
      //reinicio
    translate([0,-ancho-(2.5*espesor)])
 difference(){
  union(){
   for(i=[0:1]){
      translate([((i*alto)+(i*2.5*espesor)),0])
     base(alto,ancho,espesor,dientes,1,1,0,1);
   }
   //circulos orillas (Material)
   
   translate([-((alto-espesor)/2),(ancho/2)-(1.5*espesor)])
   circle($fn=100,r=2*(espesor/2+0.5));
   
   translate([-(((alto-espesor)/2))+alto+(2.5*espesor),-(ancho/2)+(1.5*espesor)])
   circle($fn=100,r=2*(espesor/2+0.5));
   
  }
  
  //taladros bisagras
  
   translate([-(((alto-espesor)/2)),(ancho/2)-(1.5*espesor)])
   circle($fn=100,r=(espesor/2+0.5));
  
  translate([-(((alto-espesor)/2))+alto+(2.5*espesor),-(ancho/2)+(1.5*espesor)])
   circle($fn=100,r=(espesor/2+0.5));
 
  }
  
 }
 if(modo==2){
 //no hay reinicio
 //No dibujar nada en modo 2
 }
 
 if(modo==0){
   //reinicio
   translate([0,-ancho-(2.5*espesor)])
     for(i=[0:1]){
      translate([((i*alto)+(i*2.5*espesor)),0])
     base(alto,ancho,espesor,dientes,1,1,0,1);
   }
 }
  
  
}//Fin module cajaSCTapa

//####RENDERIZADOS#####//

/*
difference(){


//POSICIOAMIENTO

tolerancia=1;
LARGO1=87.07+(tolerancia*2);
ANCHO1=96.18+(tolerancia*2);
ALTO1=30;
ESPESOR1=3;
    
cajaSCTapa(largo=LARGO1,ancho=ANCHO1,alto=ALTO1,espesor=ESPESOR1,dientes=6,modo=1);


//####CENTRO BASE####
circle(r=3);
    
 //####CENTRO FRONTAL####
  translate([0,((ANCHO1/2)+(ALTO1/2)+(2.5*ESPESOR1))])   
    circle(r=3);
    
    //agujero para la tapa (frontal)
    translate([0,((ALTO1/2)+(ANCHO1/2)+(ALTO1/2)+(2.5*ESPESOR1))])   
    square([2*ESPESOR1,2*ESPESOR1],center=true);
    
    //####CENTRO POSTERIOR####
    translate([(LARGO1)+(2.5*ESPESOR1),((ANCHO1/2)+(ALTO1/2)+(2.5*ESPESOR1))])   
    circle(r=3);
    
//#### CENTRO TAPA ####
translate([((LARGO1)+(2.5*ESPESOR1)),0])  
circle(r=3);

//####CENTRO LATERAL 1 #####
translate([0,-((ANCHO1)+(2.5*ESPESOR1))])
circle(r=3);
    
    //####CENTRO LATERAL 2 ####
translate([ALTO1+(2.5*ESPESOR1),-((ANCHO1)+(2.5*ESPESOR1))])
circle(r=3);

}
*/

//Renderizado de la caja en base a la funcion caja SCTapa
cajaSCTapa(largo=215.9+4,ancho=260+4,alto=279.4,espesor=3,dientes=8,modo=0);

echo(260/30);

//CuboBase(largo=30,ancho=25,alto=40,espesor=3,dientes=6);

//pruebaBase(largo=40,ancho=30,alto=40,espesor=3,dientes=6,3D=0);


//base(80,80,3,10,1,1,1,1);


