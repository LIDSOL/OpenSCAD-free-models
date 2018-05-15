       
    
    
    module recortadorMink(lonX=20,lonY=20,lonZ=20,esf=1){
        minkowski(){
        cube([lonX-(2*esf),lonY-(2*esf),lonZ-(2*esf)],center=true);
            sphere(r=esf,$fn=100);
            }
    }
    
        module recortadorMinkPoly(Base=40,Altura=20,Circulo=2){
       minkowski(){
          polygon([[Base,0],[0,Altura],[0,0]]);
          circle(r=Circulo,$fn=100);
       }
   }
   
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

//panelMatriz(lonX=30,lonY=40,taladro=1,divisiones=5);

   //recortadorMinkPoly(20,5,6);
    

   //recortadorMink(lonX=10,lonY=20,lonZ=10,esf=3);