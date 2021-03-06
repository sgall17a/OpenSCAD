; generated by Slic3r 0.9.9 on 2015-02-20 at 19:08:33

; layer_height = 0.1
; perimeters = 2
; top_solid_layers = 4
; bottom_solid_layers = 3
; fill_density = .3
; perimeter_speed = 20
; infill_speed = 40
; travel_speed = 40
; nozzle_diameter = 0.4
; filament_diameter = 1.75
; extrusion_multiplier = .898
; perimeters extrusion width = 0.68mm
; infill extrusion width = 1.28mm
; solid infill extrusion width = 0.68mm
; top infill extrusion width = 0.09mm
; first layer extrusion width = 0.25mm

G21 ; set units to millimeters
M107
M104 S195 ; set temperature
G28 ; home all axes
G1 Z5 F5000 ; lift nozzle
M109 S195 ; wait for temperature to be reached
G90 ; use absolute coordinates
G92 E0
M82 ; use absolute distances for extrusion
M104 S0 ; turn off temperature
G28 X0  ; home X axis
g28 y0  ; home y axis
M84     ; disable motors
; filament used = 0.0mm (0.0cm3)
