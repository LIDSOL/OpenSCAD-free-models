for(i=[0:3]){
  translate([6*i,0])
    difference(){
  square([5,18],center=true);
         square([3,16],center=true);
    }
}

translate([0,17])
for(i=[0:1]){
translate([10*i,0])
difference(){
square([9,14],center=true);
square([7,12],center=true);    
}
}