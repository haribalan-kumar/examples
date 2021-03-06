gfx read node NonlinearPoisson.part0.exnode
gfx read element NonlinearPoisson.part0.exelem generate

gfx create window 1
gfx modify window 1 view interest_point 0.25,0.255,0.0 eye_point 0.25,0.25,2.0 up_vector 0.0,1.0,0.0

gfx define faces egroup "Region 2"

gfx modify spectrum default clear overwrite_colour;
gfx modify spectrum default linear reverse range -1.4 1.4 extend_above extend_below rainbow colour_range 0 1 component 1
gfx modify spectrum default linear reverse range -1.4 1.4 extend_above extend_below banded number_of_bands 20 band_ratio 0.06 component 1

gfx modify g_element "Region 2" node_points glyph sphere general size "0.01*0.01*0.01" centre 0,0,0 material default selected_material default_selected
gfx modify g_element "Region 2" lines select_on material default selected_material default_selected
gfx modify g_element "Region 2" surfaces select_on material default data general spectrum default selected_material default_selected render_shaded
