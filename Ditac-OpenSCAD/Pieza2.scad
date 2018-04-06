use<Diente.scad>
use<baseDitac.scad>;

numX=1;
numY=1;
resoluciOn=10;
espesor=3;
alfa=0.1;

//materiales
beta=(3*alfa)/32;
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

//linear_extrude(height=3)
union(){
baseDitac(espesor,alfa,dimX,dimY,resoluciOn);
//baseDitac();
    
//DIENTES ARRIBA
    
//inicio
translate([-lonX/2-gamma,lonY/2])

if(numX==1){
   for(i=[0:dimX]){
      translate([2*i*espesor,0])
       Diente(espesor,alfa,resoluciOn);
   }
}
else{
    
   for(i=[0:dimX]){
      translate([2*i*espesor,0])
       Diente(espesor,alfa,resoluciOn);
   }
    
    translate([7*i*espesor,0])
   for(i=[0:1:numX]){
    
         for(i=[0:dimX]){
      translate([2*i*espesor,0])
       Diente(espesor,alfa,resoluciOn);
   }
       
       
   }
   
   
   

}


//FIN DIENTES ARRIBA






//dientes abajo
//DIENTES ABAJO
//si la altura es impar,se puede replicar los dientes de arriba

if(numY%2==1){
   mirror([0,1]){
           if(numY==1){
            translate([-lonX/2-gamma,lonY/2])
            for(i=[0:dimX]){
               translate([2*i*espesor,0])
              Diente(espesor,alfa,resoluciOn);
           }
       }   
   }//fin mirror
}//fin altura impar

//FIN DIENTES ABAJO


//DIENTES IZQUIERDA

//inicio
rotate(90)
translate([-(3*espesor)/2-gamma,lonY/2])

if(numY==1){
   for(i=[0:dimY-1]){
       translate([2*i*espesor,0])
       Diente(espesor,alfa,resoluciOn);
   }
}

//FIN DIENTES IZQUIERDA

//DIENTES DERECHA

//si la anchura es impar se puede replicar el lado izquierdo
if(numX%2==1){
mirror([1,0]){
   //inicio
  rotate(90)
  translate([-(3*espesor)/2-gamma,lonY/2])
    if(numY==1){
        for(i=[0:dimY-1]){
          translate([2*i*espesor,0])
          Diente(espesor,alfa,resoluciOn);
       }
    }
  }

}
//FIN DIENTES DERECHA

}//finunion
