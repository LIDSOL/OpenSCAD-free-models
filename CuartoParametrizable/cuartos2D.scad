muro=0.2;
escala=20;

module cuarto(lonX=1,lonY=2.5,muro=0.2){
    difference(){
        square([lonX,lonY],center=true);
        square([lonX-(2*muro),lonY-(2*muro)],center=true);
    }
}

cuarto(2*escala,4*escala,0.2*escala);

translate([2*escala-0.2*escala,-1*escala])
cuarto(2*escala,2*escala,0.2*escala);

translate([4*escala-0.4*escala,-1*escala])
cuarto(2*escala,2*escala,0.2*escala);

translate([6*escala-0.6*escala,-2*escala])
cuarto(2*escala,3*escala,0.2*escala);

translate([6*escala-0.6*escala,2*escala+0.2*escala])
cuarto(2*escala,3*escala,0.2*escala);

/*
translate([7-0.8,2+0.2])
cuarto(2,2,0.2);
*/


translate([3*escala-0.3*escala,1.4*escala])
cuarto(3.8*escala,1.4*escala,0.2*escala);