lonX=60;
lonY=60;
lonZ=60;
espesor=2;
espesorEstruct=2;
//cube([lonX,lonY,lonZ],center=true);


divisiones=6;
subDiv=divisiones/2;

//tamaño de elementos de matriz cubica

menX=(lonX-(2*espesor)-(espesor*(divisiones+2)))/divisiones;
menY=(lonY-(2*espesor)-(espesor*(divisiones+2)))/divisiones;
menZ=(lonZ-(2*espesor)-(espesor*(divisiones+2)))/divisiones;

//menX=lonX-espesor*2


difference(){
    //cubo a taladrar
  cube([lonX,lonY,lonZ],center=true);
 
//Matriz Cubica de cubos
//translate([-lonX/2-(divisiones)*espesor,-lonY/2-(divisiones)*espesor,-lonZ/2-(divisiones)*espesor])
for(i=[-subDiv:subDiv]){
    for(j=[-subDiv:subDiv]){
        for(k=[-subDiv:subDiv]){
            translate([(menX+espesor)*i,(menY+espesor)*j,(menZ+espesor)*k])
            cube([menX,menY,menZ],center=true);
        }
    }
}

//cuboGrosorEstructural
cube([lonX-2*espesor-1*espesorEstruct,lonY-2*espesor-1*espesorEstruct,lonZ-2*espesor-1*espesorEstruct],center=true);

translate([0,0,lonZ])
cube([lonX*2,lonY*2,lonZ*2],center=true);

}





module poste(diametro=5,tornillo=2.5){
difference(){
resta=0;
cylinder(d=diametro,$fn=100,h=InlonZ+espesor-resta);
cylinder(d=tornillo,$fn=100,h=InlonZ+6-resta);
}


}


diametro=5;
tornillo=2.5;
