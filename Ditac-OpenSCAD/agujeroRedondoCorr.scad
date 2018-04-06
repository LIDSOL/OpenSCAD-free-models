

module agujeroRedondoCorr(espesor=3,alfa=0.1,beta=(3*0.1)/3,resolucion=100){

gamma=alfa+beta;
  
    
    
    circle(r=(espesor/sqrt(2))+gamma,$fn=resolucion,center=true);

 

}

agujeroRedondoCorr();