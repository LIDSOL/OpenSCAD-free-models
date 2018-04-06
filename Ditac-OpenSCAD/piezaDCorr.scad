use<DienteCorr.scad>
use<baseDitacCorr.scad>;
use<agujeroRedondo.scad>;

//parametrizables
//numX=3;
//numY=3;
/*
resoluciOn=10;
espesor=3;
alfa=0.1;
beta=(3*alfa)/32;
*/


module piezaDCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,
numY=1,modo=0,tamaNio=0.15,modo3D=0,ajuste=0){
//resoluciOn mAxima 1000

//materiales
gamma=alfa+beta;

//control relaciOn par impar
listX=[for(a=[2:3:3*numX])a];
listY=[for(a=[2:3:3*numY])a];

//parseo relacion par-impar
dimX=listX[numX-1];
dimY=listY[numY-1];

//calculo longitudes
lonX=(2*dimX+1)*espesor;
lonY=(2*dimY+1)*espesor;

union(){
    
  if(modo==0){
//modo0 (Primer Cero)
baseDitacCorr(espesor,alfa,beta,dimX,dimY,resoluciOn,0,0,0,0,0);

  }
else if(modo==1){
baseDitacCorr(espesor,alfa,beta,dimX,dimY,resoluciOn,1,0,0,0,0);
}
else if(modo==3){
baseDitacCorr(espesor,alfa,beta,dimX,dimY,resoluciOn,3,0,0,0,0);
}
/*
  else{
      lonX=(2*dimX+1)*espesor+2*gamma;
      lonY=(2*dimY+1)*espesor+2*gamma;
      square([lonX,lonY],center=true);
  }
*/

//DIENTES ARRIBA
    //se hace este como referencia del caso base de los dientes
 translate([-(1*lonX)/2-gamma,lonY/2])
    for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
}

//reinicio
translate([-(1*lonX)/2-gamma,lonY/2])

for(i=[0:1:(numX/2)-1]){

translate([i*12*espesor,0])
if(numX>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if

}//fin for reinicio

//reinicio
//caso base final, se coloca un trío de dientes alfinal
//translate([-(1*lonX)/2-gamma,lonY/2])
if(numX%2==1){
         //translate([70*espesor,0])
         translate([(1*lonX)/2-gamma-5*espesor,lonY/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
   }
//FIN DIENTES ARRIBA

//DIENTES ABAJO
  //SI la altura es impar se copian los dientes de arriba 
 if(numY%2==1){
     mirror([0,1]){
     //dientes arriba copiados
    //se hace este como referencia del caso base de los dientes
 translate([-(1*lonX)/2-gamma,lonY/2])
    for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
}

//reinicio
translate([-(1*lonX)/2-gamma,lonY/2])

for(i=[0:1:(numX/2)-1]){

translate([i*12*espesor,0])
if(numX>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if

}//fin for reinicio

//reinicio
//caso base final, se coloca un trío de dientes alfinal
//translate([-(1*lonX)/2-gamma,lonY/2])
if(numX%2==1){
         //translate([70*espesor,0])
         translate([(1*lonX)/2-gamma-5*espesor,lonY/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
   }
//fin dientes arriba copiados
         
         
         }
     
 }
 else{
     //cuando la altura de y es impar
      mirror([0,1]){
    
          
           //se hace este como referencia del caso base de los dientes
 translate([-(1*lonX)/2-gamma+espesor+gamma,lonY/2])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }

//reinicio, reacomodo de las series
translate([-(1*lonX)/2-gamma+(espesor*6),lonY/2])

for(i=[0:1:(numX/2)-2]){

translate([i*12*espesor,0])
if(numX>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if


}//fin for reinicio

//reinicio
//caso base final, se coloca un trío de dientes alfinal
//translate([-(1*lonX)/2-gamma,lonY/2])
//CONTROL DE ERRORES PARTIENDO SI ES IMPAR O NO LA DIMENSION X
if(numX>1){
if(numX%2==0){
         //translate([70*espesor,0])
         translate([(1*lonX)/2-gamma-5*espesor,lonY/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
   }
   
   else{
    translate([(1*lonX)/2-gamma-11*espesor,lonY/2])
        //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   translate([(1*lonX)/2-gamma-11*espesor,lonY/2])
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
       
   }
   }//fin if DimensiOn
   //FIN DE CONTROL DE ERRORES
     
  }//fin mirror   
 }
       
//FIN DIENTES ABAJO
 
//DIENTES IZQUIERDA
//cuando la altura de y es impar
      mirror([0,1]){
    
          
           //se hace este como referencia del caso base de los dientes
          rotate(90)
          //CORREGIR
 translate([-lonY/2+espesor,+(1*lonX)/2])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //reinicio, reacomodo de las series
   //translate([-(1*lonX)/2-gamma+(espesor*6),lonY/2])
   rotate(90)
   translate([-lonY/2+(espesor*6)-gamma,+(1*lonX)/2])
//translate(-[lonY/2],+(1*lonX)/2+gamma-(espesor*6))

for(i=[0:1:(numY/2)-2]){

translate([i*12*espesor,0])
if(numY>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if


}//fin for reinicio

//reinicio
//caso base final, se coloca un trío de dientes alfinal
//translate([-(1*lonX)/2-gamma,lonY/2])
//CONTROL DE ERRORES PARTIENDO SI ES IMPAR O NO LA DIMENSION X
//if agregado  (control de error por mayoría de dimension)
if(numY>1){
if(numY%2==0){
      rotate(90)
    translate([lonY/2-gamma-5*espesor,(1*lonX)/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
   }
else{
     rotate(90)
    //CORREGIR
    translate([lonY/2-gamma-11*espesor,(1*lonX)/2])
       //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
  
   rotate(90)
   //CORREGIR
    translate([lonY/2-gamma-4*espesor,(1*lonX)/2])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
}
}//fin if mayoría de dimensiOn
   
   
   //FIN DE CONTROL DE ERRORES
  
   }//fin mirror

//FIN DIENTES IZQUIERDA
   
   
//DIENTES DERECHA
if(numX%2==1){
mirror([1,0]){
    //fin copia dientes izquierda
//cuando la altura de y es impar
      mirror([0,1]){
    
          
           //se hace este como referencia del caso base de los dientes
          rotate(90)
          //CORREGIR
 translate([-lonY/2+espesor,+(1*lonX)/2])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //reinicio, reacomodo de las series
   //translate([-(1*lonX)/2-gamma+(espesor*6),lonY/2])
   rotate(90)
   translate([-lonY/2+(espesor*6)-gamma,+(1*lonX)/2])
//translate(-[lonY/2],+(1*lonX)/2+gamma-(espesor*6))

for(i=[0:1:(numY/2)-2]){

translate([i*12*espesor,0])
if(numY>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if


}//fin for reinicio

//reinicio
//caso base final, se coloca un trío de dientes alfinal
//translate([-(1*lonX)/2-gamma,lonY/2])
//CONTROL DE ERRORES PARTIENDO SI ES IMPAR O NO LA DIMENSION X
//if agregado  (control de error por mayoría de dimension)
if(numY>1){
if(numY%2==0){
      rotate(90)
    translate([lonY/2-gamma-5*espesor,(1*lonX)/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
   }
   
else{
     rotate(90)
    //CORREGIR
    translate([lonY/2-gamma-11*espesor,(1*lonX)/2])
       //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
  
   rotate(90)
   //CORREGIR
    translate([lonY/2-gamma-4*espesor,(1*lonX)/2])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
}
}//fin if mayoría de dimensiOn
   
   
   //FIN DE CONTROL DE ERRORES
  
   }//fin mirror

//fin copia dientes izquierda
    
    
}//fin mirror
}//fin if impar
 
else if(numX%2==0){
if(numY%2==0){
   echo(numX%2);
    
    //dientes arriba copia
    //se hace este como referencia del caso base de los dientes
    mirror([1,0]){
    rotate(90)
 translate([-lonY/2+gamma+espesor,+(1*lonX)/2])
       //translate([100,100]) 
    for(i=[0:1]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
}

//reinicio
rotate(90)
//CORREGIR
translate([-lonY/2-gamma+6*espesor,+(1*lonX)/2])

for(i=[0:1:(numY/2)-2]){

translate([i*12*espesor,0])
if(numY>=1){
    //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
      //dueto de dientes
   translate([7*espesor,0])
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if

}//fin for reinicio
if(numY%2==0){
         rotate(90)
         translate([+lonY/2-gamma-5*espesor,(1*lonX)/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
    }
//fin dientes arriba copia

}//mirror
}//if numY par

//caso numY impar

if(numY%2==1){
    mirror([1,0]){
         rotate(90)
         translate([-lonY/2-gamma,+(1*lonX)/2])
       for(i=[0:2]){
       translate([2*i*espesor,0])
       
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        }
      //}
   //}
   
   
   //reinicio, reacomodo de las series
   //translate([-(1*lonX)/2-gamma+(espesor*6),lonY/2])
   rotate(90)
    //translate([-lonY/2-gamma,+(1*lonX)/2])
   translate([-lonY/2+(espesor*7)-gamma,+(1*lonX)/2])
//translate(-[lonY/2],+(1*lonX)/2+gamma-(espesor*6))

for(i=[0:1:(numY/2)-1]){

translate([i*12*espesor,0])
if(numY>=1){
    
      //dueto de dientes
  
   for(i=[0:1]){
       translate([2*i*espesor,0])
        DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
        translate([5*espesor,0])
       //trío de dientes
   for(i=[0:2]){
    translate([2*i*espesor,0])
     DienteCorr(espesor,alfa,beta,resoluciOn,tamaNio,modo3D,ajuste);
   }
   }
   //en caso de que termine en trío de dientes (recordar caso base que inicia con trío de dientes sin usar en bucle de iteración)
   
   
}//fin if


}//fin for reinicio
  
 }//fin mirror
//fin caso numY impar

  }//fin else if
  
//FIN DIENTES DERECHA
   }//llave que falta
  }//fin union
}



//cosa();
//linear_extrude(height=3)
//Los modos alteran los agujeros: cuadrado redondo y el no agujero

//modo 0 --> agujero cuadrado
//modo 1 --> agujero redondo
//modo 3- -> sin agujero


linear_extrude(height=3)
piezaDCorr(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,numX=1,
numY=1,modo=1,tamaNio=0.2,modo3D=1);

