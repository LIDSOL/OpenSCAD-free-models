

module agujeroRedondo(espesor=3,alfa=0.1,resolucion=10){
beta=(3*alfa)/32;
gamma=alfa+beta;
  
    
    
    circle(r=((espesor)/sqrt(2))+gamma,$fn=resolucion,center=true);

 

}

agujeroRedondo();