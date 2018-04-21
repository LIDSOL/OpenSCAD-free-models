
radioEspira=1;
resoluciOn=100;


module trompo(radioEspira=1,resoluciOn=100){
    
linear_extrude(height=1,scale=0.1)
circle(r=radioEspira,$fn=resoluciOn);
mirror([0,0,1]){
  linear_extrude(height=1,scale=0.1)
circle(r=radioEspira,$fn=resoluciOn);
}

}


for(i=[0:20]){
    
    rotate(1*i)
    translate([0,0,i*1])
    translate([10,0,0,])
    trompo(1,20);
}