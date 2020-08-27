-- This is a lua script for use in Conky.
require 'cairo'

function conky_main ()
    if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create (conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)

    local is = cairo_image_surface_create (conky_window.display,
                                            conky_window.drawable,
                                            conky_window.visual,
                                            conky_window.width,
                                            conky_window.height)

    local img = cairo_image_surface_create_from_png ('/home/blue/Pictures/Logos/docker.png')

    cr = cairo_create (cs)
    
    local w_img, h_img = cairo_image_surface_get_width (img), cairo_image_surface_get_height (img)
    local cr = cairo_create (cs)
    cairo_translate (cr, 0, 0)
    cairo_scale (cr, 0.2, 0.2)
    cairo_set_source_surface (cr, img, 0, 0)
    cairo_paint (cr)
    cairo_destroy(cr)
    cairo_surface_destroy (img)

    cr = nil
end

-- function conky_main ()
--     if conky_window == nil then
--         return
--     end
--     local cs = cairo_xlib_surface_create (conky_window.display,
--                                          conky_window.drawable,
--                                          conky_window.visual,
--                                          conky_window.width,
--                                          conky_window.height)
--     cr = cairo_create (cs)
--     local updates = tonumber (conky_parse ('${updates}'))
--     if updates > 5 then
--         print ("conky_main counted >5 updates to its window")
--     end
--     cairo_destroy (cr)
--     cairo_surface_destroy (cs)
--     cr = nil
-- end