
diametroEjeCortinero=36;
gruesoExternoGancho=10;
gruesoPieza=30;
redondeoPieza=4;
distanciaCentroEjeApared=70;


   difference(){
       minkowski(){
cube([diametroEjeCortinero+(2*gruesoExternoGancho),gruesoPieza,diametroEjeCortinero+(2*gruesoExternoGancho)],center=true);
       sphere(r=redondeoPieza,$fn=100);
           }
       
        rotate([90,0,0])
    cylinder(d=
diametroEjeCortinero,h=gruesoPieza*2,$fn=100,center=true);
   }
   
   translate([distanciaCentroEjeApared-(gruesoPieza/4),0,0])
   cube([gruesoPieza/2,gruesoPieza,diametroEjeCortinero+(2*gruesoExternoGancho)+(2*redondeoPieza)],center=true);