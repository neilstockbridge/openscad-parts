
# For the Lulzbot TAZ 2.1 ( and maybe later)

  - `stock-tool-mount-base.stl` is the Lulzbot-supplied trowel-shaped base for custom tools with the extruder mount part shaved off
  - `blank-tool-mount-base.stl` is the same but with all the holes removed so that CSG can be used to make your own holes
  - `tool-mount-base.blend` is the source for the previous

To reorient the tool base to that the "tip" of the trowel is at the origin and the rest grows away in +ve Y:

    rotate([0,0, 180 ]) translate([0, -95.8, 0])
      import( file="blank-tool-mount-base.stl", convexity= 2 );

