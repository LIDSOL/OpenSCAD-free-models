use<ruedasCorrRedondo.scad>
use<baseDitacCorr.scad>

espesor=3;

difference(){
ruedasCorrRedondo(7,100);
square([espesor*7,espesor*7],center=true);
 
}
baseDitacCorr(3,0.1,(3*0.1)/32,3,3,100,0,0,0,0);