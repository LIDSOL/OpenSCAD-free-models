                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1659079
bolts, nuts, threaded rods - OpenSCAD library Threading.scad by Parkinbot is licensed under the Creative Commons - Attribution - Non-Commercial license.
http://creativecommons.org/licenses/by-nc/3.0/

# Summary

I needed some threaded rods and didn't find a good library here. As OpenSCAD is not well enough equipped to do threaded stuff having small slope, I decided to write my own code, using some sweep() functionality I had published earlier with my [Naca_sweep.scad library](http://www.thingiverse.com/thing:900137). 


# How I Designed This

Solutions based on sweep() are usually pretty fast, also with F6. To get a properly closed manifold, which is not so easy to do with sweep(), I used some tricky union to glue two 180° extrusions together.
The lib has a lot of possibilities, some of them shown in the example collection *Threads.stl*. I tried to keep the footprint of the code small, so I just added help() and an example selector for more convenience. By looking at the example calls you will find inspiration for your application. 

Features
- help()
- example selector
- specify pitch, windings (integer), diameter, and angle of attack along your needs. 
- multiple helices 
- rods and nuts have same calling syntax

To explore the examples you can write: 
```
include <Threading.scad>
showexample = 2;  // =0: no example shown, =1 ... =10: shows example#
help();   // display prototypes in library with parameter explanation
```

Usage of library in own code: 
```
use <Threading.scad>
threading(pitch = 2, d=20, windings = 30, angle = 20, full = true);

// M8 hex bolt CCW
mirror([1,0,0])
union(){ 
threading(pitch = 1.25, d=8, windings=20, full=true); cylinder(d=14.6, h=4, $fn=6);
} 
```

Have fun, and please respect the lib's licensing: No commercial use allowed.