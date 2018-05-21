module rondana (ancho=8,radioInterno=5,radioExterno=12,resoluciOn=100){
    
    difference(){
            cylinder(d=radioExterno,h=ancho,center=true,$fn=resoluciOn);
            cylinder(d=radioInterno,h=2*ancho,center=true,$fn=resoluciOn);
    }
    
}//fin module rondana

resoluciOn=200;

translate([0,0,45/2-0.5])
   cylinder(d=10.4,h=1,center=true,$fn=resoluciOn);
rondana (ancho=45,radioInterno=8.9,radioExterno=10.4,resoluciOn=resoluciOn);

$fn=200;


translate([(10.4)/4+3.5,0,5])
rotate([0,90,0])
union(){

translate([0,0,0.5])
cube([35,5.5,1],center=true);

translate([35/2-5/2,0,0])
rotate([0,180,0])
cylinder(r1=5/2,r2=3/2,h=0.5);

translate([-35/2+10/2,0,-1])
cube([10,5,2],center=true);

}

