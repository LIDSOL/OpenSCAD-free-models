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

espesor=3;
alfa=0.1;
beta=(3*0.1)/32;
resoluciOn=100;
separaciOn=4;
vacIo=0;



module cubo11X(espesor11X=3,alfa11X=0.1,beta11X=(3*0.1)/32,resoluciOn11X=100,dimZ=2,base11X=1,tapa11X=1,LadoA11X=1,LadoB11X=1,LadoC11X=1,LadoD11X=1,explota=1){
    
    //Base
      if(dimZ%2==1){
        if(base11X==1){  
         piezaDCorr3D(espesor11X,alfa11X,beta11X,resoluciOn11X,1,1,0);         
        }else if(base11X==2){  
          piezaDRCorr3D(espesor11X,alfa11X,      beta11X,resoluciOn11X,1,1,0);
            }
            else if(base11X==3){
                
          piezaDRCorr3D(espesor11X,alfa11X,beta11X,    resoluciOn11X,1,1,1);
            }
       }else{
         if(base11X==1){ 
         rotate(90)
         
        piezaDCorr3D(espesor11X,alfa11X,beta11X,    resoluciOn11X,1,1,0);
         }else if(base11X==2){
             rotate(90)
         
        piezaDRCorr3D(espesor11X,alfa11X,beta11X,    resoluciOn11X,1,1,0);
             
         }
         else if(base11X==3){
             rotate(90)
         
        piezaDRCorr3D(espesor11X,alfa11X,beta11X,    resoluciOn11X,1,1,1);
             
         }
           
      }
      
    //Tapa
   if(tapa11X==1){
      translate([0,0,(6*espesor11X)*dimZ*explota])
      
      piezaDCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,1,0);
   }else if(tapa11X==2){
       translate([0,0,(6*espesor11X)*dimZ*explota])
     
      piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,1,0);
       }
       else if(tapa11X==3){
       translate([0,0,(6*espesor11X)*dimZ*explota])
      
      piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,1,1);
       }
       
    //LadoA
   if(LadoA11X==1){
      rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*  espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
      
       piezaDCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,0);
   }else if(LadoA11X==2){
   rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*  espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,0);
       }
       else if(LadoA11X==3){
   rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*  espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,1);
       }
    //LadoB
   if(LadoB11X==1){
       mirror([0,1,0]){
       rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*espesor11X)*dimZ)+(0.5*espesor11X)+beta11X)*explota])
       rotate([0,90,0])
       
       piezaDCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,0);  
       }
   }else if(LadoB11X==2){
        mirror([0,1,0]){
       rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*espesor11X)*dimZ)+(0.5*espesor11X)+beta11X)*explota])
       rotate([0,90,0])
       
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,0);  
       }
     }
     else if(LadoB11X==3){
        mirror([0,1,0]){
       rotate(90)
       translate([2.5*espesor11X*explota,0,(((3*espesor11X)*dimZ)+(0.5*espesor11X)+beta11X)*explota])
       rotate([0,90,0])
       
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,dimZ,1,1);  
       }
     }
    //LadoC
   if(LadoC11X==1){
       translate([2.5*espesor11X*explota,0,(((3*   espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
      
       piezaDCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,0);
   }else if(LadoC11X==2){
     translate([2.5*espesor11X*explota,0,(((3*   espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
      
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,0);
       }
       else if(LadoC11X==3){
     translate([2.5*espesor11X*explota,0,(((3*   espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
     
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,1);
       }
   //LadoD
   if(LadoD11X==1){
       mirror([1,0,0]){
           translate([2.5*espesor11X*explota,0,(((3* espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
        
       piezaDCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,0);
       }
   }else if(LadoD11X==2){
       mirror([1,0,0]){
           translate([2.5*espesor11X*explota,0,(((3* espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
       
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,0);
       }
   }
   else if(LadoD11X==3){
       mirror([1,0,0]){
           translate([2.5*espesor11X*explota,0,(((3* espesor11X)*dimZ+(0.5*espesor11X)+beta11X))*explota])
       rotate([0,90,0])
       rotate(90)
      
       piezaDRCorr3D(espesor11X,alfa11X,beta11X,   resoluciOn11X,1,dimZ,1);
       }
   }
    
}

module piezaDCorr3D(espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100,numX3D=1,numY3D=1,vacIo3D=0){
    linear_extrude(height=espesor3D)
    piezaDCorr(espesor3D,alfa3D,beta3D,resoluciOn3D,numX3D,numY3D,vacIo3D);
    }
    
 module piezaDRCorr3D(espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100,numX3D=1,numY3D=1,vacIo3D=0){
    linear_extrude(height=espesor3D)
    piezaDRCorr(espesor3D,alfa3D,beta3D,resoluciOn3D,numX3D,numY3D,vacIo3D);
    }
    
 module barrasCorr3D(dimX=2,dimY=2,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100){
     linear_extrude(height=espesor3D)
     barrasCorr(2,2,espesor,alfa,beta,resoluciOn);
 }
 
 module barrasRCorr3D(dimX=2,dimY=2,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100){
     linear_extrude(height=espesor3D)
     barrasRCorr(2,2,espesor,alfa,beta,resoluciOn);
 }
 
 module  cadena3D(dimX=2,dimY=4,espesor3D=3,alfa3D=0.1,resoluciOn3D=100,izq=0,der=0,arr=1,ab=1){
        linear_extrude(height=espesor3D)
 cadena(dimX,dimY,espesor3D,alfa3D,resoluciOn3D,izq,der,arr,ab);
 }
 
 module ejesCorr3D(dim=2,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100){
     linear_extrude(height=espesor3D)
     ejesCorr(dim,espesor3D,alfa3D,beta3D,resoluciOn3D);
 }
 
 module ruedasCorr3D(dim=1,resoluciOn3D=100,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32){
       linear_extrude(height=espesor3D)
     ruedasCorr(dim,resoluciOn3D,espesor3D,alfa3D,beta3D);
 }
 
 module ruedasCorrRedondo3D(dim=1,resoluciOn3D=100,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32){
       linear_extrude(height=espesor3D)
     ruedasCorrRedondo(dim,resoluciOn3D,espesor3D,alfa3D,beta3D);
 }
 
 module unificadorFrontalCorr3D(dim=2,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100){
     linear_extrude(height=espesor3D)
     unificadorFrontalCorr(dim,espesor3D,alfa3D,beta3D,resoluciOn3D);
 }
 
 module unificadorLateralCorr3D(espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,resoluciOn3D=100,dim=4){
      linear_extrude(height=espesor3D)
     unificadorLateralCorr(espesor3D,alfa3D,beta3D,resoluciOn3D,dim);
 }
 
 module codo3D(dimX=2,resoluciOn3D=100,espesor3D=3,alfa3D=0.1,beta3D=(3*0.1)/32,lados=10){
       linear_extrude(height=espesor3D)
       codo(dimX,resoluciOn3D,espesor3D,alfa3D,beta3D,lados);
     }
     
 //PRUEBA DE CUBO
  //para el cubo la tapa,base y cada lado se le asigna un valor siendo el 1, con agujeros cuadrados, 2 para agujeros redodndos y el 3 para estar sin agujeros, si se requiere que una pieza no aparezca se debe colocar el valor de cero o un valor entero mayor a 3

//cubo11X(espesor111=3,alfa111=0.1,beta111=(3*0.1)/32,resoluciOn111=100,dimZ=1,base11X=1,tapa11X=3,LadoA11X=3,LadoB11X=3,LadoC11X=3,LadoD11X=3,explota=2);
     
  cubo11X(espesor,alfa,beta,resoluciOn,1,1,3,3,3,3,3,2);
     
 //PIEZAS EN 3D
    
       //piezaDCorr3D(espesor,alfa,beta,resoluciOn,1,1,vacIo=0);
    
      
    
    //translate([26,0,0]) piezaDRCorr3D(espesor,alfa,beta,resoluciOn,1,1,vacIo=0);
 
       //barrasCorr3D(2,2,espesor,alfa,beta,resoluciOn);

       //barrasRCorr3D(2,2,espesor,alfa,beta,resoluciOn);
 
       //cadena3D(2,4,espesor,alfa,resoluciOn,0,0,1,1);
 
      //ejesCorr3D(2,espesor,alfa,beta,resoluciOn);
 
      //ruedasCorr3D(1,resoluciOn,espesor,alfa,beta);
 
      //ruedasCorrRedondo3D(1,resoluciOn,espesor,alfa,beta);
 
     //unificadorFrontalCorr3D(2,espesor,alfa,beta,resoluciOn);
 
      //unificadorLateralCorr3D(espesor,alfa,beta,resoluciOn,4);
         
         //codo3D(2,resoluciOn,espesor,alfa,beta,10);

//PIEZAS EN 2D

//piezaDCorr(espesor,alfa,beta,resoluciOn,numX=2,numY=1,vacIo=0);

//piezaDRCorr(espesor,alfa,beta,resoluciOn,numX=1,numY=1,vacIo=0);

//barrasCorr(2,2,espesor,alfa,beta,resoluciOn);

//barrasRCorr(2,2,espesor,alfa,beta,resoluciOn);

//cadena(2,4,espesor,alfa,resoluciOn,0,0,1,1);

//ejesCorr(2,espesor,alfa,beta,resoluciOn);

//ruedasCorr(1,resoluciOn,espesor,alfa,beta);

//ruedasCorrRedondo(1,resoluciOn,espesor,alfa,beta);

//unificadorFrontalCorr(2,espesor,alfa,beta,resoluciOn);

//unificadorLateralCorr(espesor,alfa,beta,resoluciOn,4);

//codo(2,resoluciOn,espesor,alfa,beta,10);
