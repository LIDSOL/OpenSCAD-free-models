lonX=60;
lonY=60;
lonZ=60;
espesor=2;
//cube([lonX,lonY,lonZ],center=true);


divisiones=4;

menX=(lonX-(2*espesor)-(espesor*(divisiones-1)))/divisiones;
menY=(lonY-(2*espesor)-(espesor*(divisiones-1)))/divisiones;
menZ=(lonZ-(2*espesor)-(espesor*(divisiones-1)))/divisiones;

translate([])
for(i=[0:divisiones-1]){
    for(j=[0:divisiones-1]){
        for(k=[0:divisiones-1]){
            translate([(menX+espesor)*i,(menY+espesor)*j,(menZ+espesor)*k])
            cube([menX,menY,menZ],center=true);
        }
    }
}