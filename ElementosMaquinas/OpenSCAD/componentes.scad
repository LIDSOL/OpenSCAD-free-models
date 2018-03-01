module conectorUSBBtX12p04Y10p6(){
      square([12.04,10.6],center=true);
}


module conectorMiditX21p2Y19p5(i=1,j=1){
 square([21.2*i,19.*j],center=true);

}

module conectorBTABTDtX15Y8p5(){
 square([15,8.5],center=true);
}
    

module TArduinoX50Y54(resoluciOn=100){
    circle(r=3.51/2,$fn=resoluciOn);
    
    translate([50,0])
    circle(r=3.51/2,$fn=resoluciOn);
    
    translate([5,-54])
    circle(r=3.51/2,$fn=resoluciOn);
    
    translate([5+28,-54])
    circle(r=3.51/2,$fn=resoluciOn);
}

module agujerosNEMA(){
    //agujero central
    circle(r=22/2);
    //agujeros montaje
    translate([16,16])
      circle(r=3/2);
    
    translate([-16,-16])
      circle(r=3/2);
    
    translate([16,-16])
      circle(r=3/2);
    
    translate([-16,16])
      circle(r=3/2);
    
}

//####RENDERIZADOS####

//TArduinoX50Y54(resoluciOn=100);

$fn=100;
agujerosNEMA();