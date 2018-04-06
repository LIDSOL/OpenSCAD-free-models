use<piezaDCorr.scad>
use<piezaDRCorr.scad>
use<barrasCorr.scad>
use<barrasRedondoCorr.scad>
use<cadenaCorr.scad>
use<ejesCorr.scad>
use<ruedasCorr.scad>
use<ruedasCorrRedondo.scad>
use<unificadorFrontalCorr.scad>
use<unificadorLateralCorr.scad>
use<codo.scad>
use<engranes.scad>

espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
resoluciOn=100;

//MODULOS

module despliegueBase(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,rejilla=1,limX=3,limY=3)
{

if(rejilla==0){
for(i=[1:limX]){
    for(j=[1:limY]){
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        piezaDCorr(espesor,alfa,beta,          resoluciOn,numX=i,numY=j,vacIo=1);
        
    }
}
}

if(rejilla==1){
//
    for(i=[1:limX]){
    for(j=[1:limY]){
      //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        piezaDCorr(espesor,alfa,beta,          resoluciOn,numX=i,numY=j,vacIo=0);
        
    }
}
//
}

}


module despliegueBaseRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,rejilla=1,limX=3,limY=3)
{

if(rejilla==0){
for(i=[1:limX]){
    for(j=[1:limY]){
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        piezaDRCorr(espesor,alfa,beta,          resoluciOn,numX=i,numY=j,vacIo=1);
        
    }
}
}

if(rejilla==1){
//
    for(i=[1:limX]){
    for(j=[1:limY]){
      //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        piezaDRCorr(espesor,alfa,beta,          resoluciOn,numX=i,numY=j,vacIo=0);
        
    }
}
//
}

}

module despliegueBarras(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3,limY=3)
{


for(i=[1:limX]){
    for(j=[1:limY]){
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        barrasCorr(i,j,espesor,alfa,beta,resoluciOn);
        
    }
}

}


module despliegueBarrasRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3,limY=3)
{


for(i=[1:limX]){
    for(j=[1:limY]){
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        barrasRCorr(i,j,espesor,alfa,beta,resoluciOn);
        
    }
}

}

module despliegueCadena(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3,limY=3)
{


for(i=[1:limX]){
    for(j=[3:limY]){
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([((i*6+1)+((i+1)*6+1))*i,((j*6+1)+((j+1)*6+1))*j])
        cadena(i,j,espesor,alfa,resoluciOn,0,0,1,1);
        
    }
}

}

module despliegueEjes(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3)
{


for(i=[1:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,(2*i)*i])
       ejesCorr(i,espesor,alfa,beta,resoluciOn);
        
    
   }

}

module despliegueRuedas(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3)
{

for(i=[1:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,(6*i)*i])
      
ruedasCorr(i,resoluciOn,espesor,alfa,beta);
        
    
   }

}

module despliegueRuedasRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3)
{

for(i=[1:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,(6*i)*i])
      
ruedasCorrRedondo(i,resoluciOn,espesor,alfa,beta);
        
    
   }

}


module despliegueUnificadorFrontal(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=3)
{

for(i=[1:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,(12)*i])
      
unificadorFrontalCorr(i,espesor,alfa,beta,resoluciOn);
        
    
   }

}

module despliegueUnificadorLateral(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=5)
{

for(i=[4:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,8*i])
      // el unificador lateral debe comenzar en la dimension igual a 4 para que pueda corresponder con la relación par-impar
unificadorLateralCorr(espesor,alfa,beta,resoluciOn,i);
        
    
   }

}

module despliegueCodo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=5)
{

for(i=[4:limX]){
   
        //el desplazamiento de las piezas debe ser exponencial porque la distancia que se genera se va elevando al cuadrado
        translate([0,(25)*i])
      // el codo debe comenzar en la dimension igual a 4 al ser el mimino de lados para que el ángulo sea obtuso
codo(2,resoluciOn,espesor,alfa,beta,lados=i);
        
    
   }

}


//RENDERIZADOS




limiteX=5;
//por el unificador laterla el limite de x "limiteY" debe ser siempre mayor a 4, además que para el codo el minimo de lados para que sea el angulo obtuso debe ser tambien mayor a 4
limiteY=5;
//por la cadena el limite de y "limiteY" debe ser siempre mayor a 3

linear_extrude(height=espesor)

//engrane(dimX=1,tamaNIo=1,redondo=1,resoluciOn=100,espesor=3,alfa=0.1,beta=(3*0.1)/32);


despliegueBase(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,escala=8,rejilla=1,limX=limiteX,limY=limiteY);

//despliegueBaseRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,escala=8,rejilla=1,limX=limiteX,limY=limiteY);

//despliegueBarras(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX,limY=limiteY);

//despliegueBarrasRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX,limY=limiteY);

//despliegueCadena(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX,limY=limiteY);

//despliegueEjes(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX);

//despliegueRuedas(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX);

//despliegueRuedasRedondo(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX);

//despliegueUnificadorFrontal(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX);

//despliegueUnificadorLateral(espesor=3,alfa=0.1,beta=(3*0.1)/32,resoluciOn=100,limX=limiteX);

// despliegueCodo(espesor,alfa,beta,resoluciOn,limX=limiteX);
