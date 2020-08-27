--[[click with mouse over lua by mrpeachy - thanks to barrybarrykelly for the xdotool method and gmonti for finding the deb files for the xdotool
in conkyrc, in addition to regular settings:

own_window_title clicky
lua_load ~/lua/clicky.lua
lua_draw_hook_pre main
TEXT

3/13/12
]]
require 'cairo'

click_start = 1 -- this starts the clickfunction
buttons = {} -- this table ini9tially holds the values from the buttons

function conky_main()
    if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,
                   conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates = tonumber(conky_parse('${updates}'))
    if updates > 5 then
        -- #################################################################################################
        localx, localy, localnowx, localnowy = clickfunction() -- this line activates the clickfunction and sets the click coordinates
        -- #################################################################################################
        -- SET DEFAULTS ##########################################################
        -- set defaults do not localise these defaults if you use a seperate display script
        default_font = "mono" -- font must be in quotes
        default_font_size = 10
        default_color = 0xffffff -- white
        default_alpha = 1 -- fully opaque
        default_image_width = 50
        default_image_height = 50
        -- #################################################################################################
        -- button setup - this section for an on/off button 
        local button_name = "cpu"
        local blx = 100.5 -- bottom left x coordinate of click area, the .5 makes the 1 pixel box line sharp
        local bly = 100.5 -- bottom left x coordinate of click area
        local height = 20 -- height of click area
        local width = 30 -- width of click area

        -- setup cpu section position, when setting up cpu function everything is relative to these points
        local cpu_blx = blx + width + 2
        local cpu_bly = 100.5
        local overlap = width
        -- ##############################################################
        -- calculate if click was inside box and set actions#############
        -- best to keep the button calculations seperate to the actions##
        if localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
            buttons[tostring(button_name)] ~= 1 then
            buttons[tostring(button_name)] = 1
        elseif localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
            buttons[tostring(button_name)] == 1 then
            buttons[tostring(button_name)] = 0
        elseif localx < blx and localx > blx + width and localy < bly and localy > bly - height and
            buttons[tostring(button_name)] ~= 1 then
            buttons[tostring(button_name)] = 0
        end
        -- end of calculations ##########################################

        -- mouseover
        if buttons["coresmo"] == 1 or localnowx >= blx and localnowx <= blx + width and localnowy <= bly and localnowy >=
            bly - height then
            if buttons[tostring(button_name)] ~= 1 then
                cpusection(cpu_blx, cpu_bly, overlap)
            end
        end

        if localnowx >= blx and localnowx <= blx + width and localnowy <= bly and localnowy >= bly - height then
            color = {0, 0, 0, 1}
            fill = 1
            buttondraw(blx, bly, height, width, color, fill)
        end

        -- ##############################################################
        -- button on off
        if buttons[tostring(button_name)] == 1 then
            color = {1, 0, 0, 1} -- if button is clicked on it will be drawn red
            fill = 0
            buttondraw(blx, bly, height, width, color, fill)
            cpusection(cpu_blx, cpu_bly, overlap)
        else
            color = {1, 1, 0, 1} -- if button is clicked on it will be drawn red
            fill = 0
            buttondraw(blx, bly, height, width, color, fill)
        end -- button on off
        out({
            x = 105,
            y = 95,
            txt = "CPU"
        })
        -- #########################################################################################################
    end -- if updates>5
    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil
end -- end main function

function cpusection(cpu_blx, cpu_bly, overlap)
    -- button setup - this section for an on/off button 
    local button_name = "cores"
    local blx = cpu_blx -- bottom left x coordinate of click area, the .5 makes the 1 pixel box line sharp
    
    local bly = cpu_bly -- bottom left x coordinate of click area
    
    local height = 20 -- height of click area
    local width = 60 -- width of click area
    -- setup cpu section position, when setting up cpu function everything is relative to these points
    local cores_blx = blx + width + 15
    local cores_bly = bly
    -- ##############################################################
    -- calculate if click was inside box and set actions#############
    -- best to keep the button calculations seperate to the actions##
    if localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
        buttons[tostring(button_name)] ~= 1 then
        buttons[tostring(button_name)] = 1
    elseif localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
        buttons[tostring(button_name)] == 1 then
        buttons[tostring(button_name)] = 0
    elseif localx < blx and localx > blx + width and localy < bly and localy > bly - height and
        buttons[tostring(button_name)] ~= 1 then
        buttons[tostring(button_name)] = 0
    end
    -- end of calculations ##########################################
    -- mouseover
    if buttons["processmo"] == 1 or localnowx >= blx - overlap and localnowx <= blx + width and localnowy <= bly and
        localnowy >= bly - height then
        buttons[tostring(button_name .. "mo")] = 1
        -- buttons["cpumo"]=1
        -- elseif localnowx<blx-overlap or localnowx>blx+width or localnowy>bly or localnowy<bly-height then
        -- buttons[tostring(button_name.."mo")]=0
    else
        buttons[tostring(button_name .. "mo")] = 0
    end -- mouseover

    if localnowx >= blx and localnowx <= blx + width and localnowy <= bly and localnowy >= bly - height then
        color = {0, 0, 0, 1}
        fill = 1
        buttondraw(blx, bly, height, width, color, fill)
        -- so that cpu isnt drawn twice
        if buttons[tostring(button_name)] ~= 1 then
            coressection(cores_blx, cores_bly)
        end
    end
    -- ##############################################################
    -- button on off
    if buttons[tostring(button_name)] == 1 then
        color = {1, 0, 0, 1} -- if button is clicked on it will be drawn red
        fill = 0
        buttondraw(blx, bly, height, width, color, fill)
        coressection(cores_blx, cores_bly)
    else
        color = {0, 1, 1, 1}
        fill = 0
        buttondraw(blx, bly, height, width, color, fill)
    end -- button on off
    out({
        x = blx + 5,
        y = bly - 5,
        txt = "CPU%:" .. conky_parse("${cpu}")
    })
    -- ##############################################################
    -- ##############################################################
    -- ##############################################################
    -- ##############################################################
    -- ##############################################################
    -- button controlling processes section
    -- button setup - this section for an on/off button 
    local button_name = "process"
    local blx = blx -- bottom left x coordinate of click area, the .5 makes the 1 pixel box line sharp
    
    local bly = bly + height + 2 -- bottom left x coordinate of click area
    local height = 20 -- height of click area
    local width = 60 -- width of click area
    -- setup cpu section position, when setting up cpu function everything is relative to these points
    local process_blx = blx + width + 15
    local process_bly = bly
    -- ##############################################################
    -- calculate if click was inside box and set actions#############
    -- best to keep the button calculations seperate to the actions##
    if localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
        buttons[tostring(button_name)] ~= 1 then
        buttons[tostring(button_name)] = 1
    elseif localx >= blx and localx <= blx + width and localy <= bly and localy >= bly - height and
        buttons[tostring(button_name)] == 1 then
        buttons[tostring(button_name)] = 0
    elseif localx < blx and localx > blx + width and localy < bly and localy > bly - height and
        buttons[tostring(button_name)] ~= 1 then
        buttons[tostring(button_name)] = 0
    end
    -- end of calculations ##########################################
    -- mouseover
    if localnowx >= blx and localnowx <= blx + width and localnowy <= bly and localnowy >= bly - height - height then
        buttons[tostring(button_name .. "mo")] = 1
    elseif localnowx < blx or localnowx > blx + width or localnowy > bly or localnowy < bly - height - height then
        buttons[tostring(button_name .. "mo")] = 0
    end -- mouseover

    if localnowx >= blx and localnowx <= blx + width and localnowy <= bly and localnowy >= bly - height then
        color = {0, 0, 0, 1}
        fill = 1
        buttondraw(blx, bly, height, width, color, fill)
        -- so that cpu isnt drawn twice
        if buttons[tostring(button_name)] ~= 1 then
            processsection(cores_blx, cores_bly)
        end
    end
    -- ##############################################################
    -- button on off
    if buttons[tostring(button_name)] == 1 then
        color = {1, 0, 0, 1} -- if button is clicked on it will be drawn red
        fill = 0
        buttondraw(blx, bly, height, width, color, fill)
        processsection(cores_blx, cores_bly)
    else
        color = {0, 1, 1, 1}
        fill = 0
        buttondraw(blx, bly, height, width, color, fill)
    end -- button on off
    out({
        x = blx + 5,
        y = bly - 5,
        txt = "PRO#:" .. conky_parse("${processes}")
    })
end -- cpu section

function coressection(blx, bly)
    out({
        x = blx,
        y = bly - 5,
        txt = "CPU1:" .. conky_parse("${cpu cpu1}") .. "%"
    })
    out({
        x = blx,
        y = bly + 15,
        txt = "CPU2:" .. conky_parse("${cpu cpu2}") .. "%"
    })
    out({
        x = blx,
        y = bly + 35,
        txt = "CPU3:" .. conky_parse("${cpu cpu3}") .. "%"
    })
    -- out({c=0x00ff00,x=255,y=155,txt="CPU:"..conky_parse("${cpu cpu4}").."%"})
end -- coressection

function processsection(blx, bly)
    out({
        x = blx + 100,
        y = bly - 5,
        txt = "PROC1:" .. conky_parse("${top name 1}")
    })
    out({
        x = blx + 100,
        y = bly + 15,
        txt = "PROC2:" .. conky_parse("${top name 2}")
    })
    out({
        x = blx + 100,
        y = bly + 35,
        txt = "PROC3:" .. conky_parse("${top name 3}")
    })
    -- out({c=0x00ff00,x=255,y=155,txt="CPU:"..conky_parse("${cpu cpu4}").."%"})
end -- coressection

-- button drawing function
function buttondraw(blx, bly, height, width, color, fill)
    cairo_set_line_width(cr, 1)
    cairo_set_source_rgba(cr, color[1], color[2], color[3], color[4])
    cairo_rectangle(cr, blx, bly, width, -height)
    if fill == 0 then
        cairo_stroke(cr)
    elseif fill == 1 then
        cairo_fill(cr)
    end
end -- of buttondraw function
function xout(txj) -- c,a,f,fs,x,y,txt,j ##################################################
    c = nil
    c = (txj.c or default_color)
    a = nil
    a = (txj.a or default_alpha)
    f = nil
    f = (txj.f or default_font)
    fs = nil
    fs = (txj.fs or default_font_size)
    x = nil
    x = (txj.x or 0)
    y = nil
    y = (txj.y or 0)
    txt = nil
    txt = (txj.txt or "set txt")
    j = nil
    j = (txj.j or "l")
    local function col(c, a)
        return ((c / 0x10000) % 0x100) / 255, ((c / 0x100) % 0x100) / 255, (c % 0x100) / 255, a
    end -- local function
    cairo_select_font_face(cr, f, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, fs)
    local text = string.gsub(txt, " ", "_")
    extents = cairo_text_extents_t:create()
    cairo_text_extents(cr, text, extents)
    local wx = extents.width
    cairo_set_source_rgba(cr, col(c, a))
    if j == "l" then
        cairo_move_to(cr, x, y)
        adx = wx
    elseif j == "c" then
        cairo_move_to(cr, x - (wx / 2), y)
        adx = wx / 2
    elseif j == "r" then
        cairo_move_to(cr, x - wx, y)
        adx = 0
    end
    cairo_show_text(cr, txt)
    cairo_stroke(cr)
    nextx = nil
    nextx = adx + x
    return nextx
end -- function xout ###################################################################
function out(tx) -- ####################################################################
    c = nil
    c = (tx.c or default_color)
    a = nil
    a = (tx.a or default_alpha)
    f = nil
    f = (tx.f or default_font)
    fs = nil
    fs = (tx.fs or default_font_size)
    x = nil
    x = (tx.x or 0)
    y = nil
    y = (tx.y or 0)
    txt = nil
    txt = (tx.txt or "set txt")
    local function col(c, a)
        return ((c / 0x10000) % 0x100) / 255, ((c / 0x100) % 0x100) / 255, (c % 0x100) / 255, a
    end -- local function
    cairo_select_font_face(cr, f, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size(cr, fs)
    cairo_set_source_rgba(cr, col(c, a))
    cairo_move_to(cr, x, y)
    cairo_show_text(cr, txt)
    cairo_stroke(cr)
end -- function out ###################################################################
function image(im) -- #################################################################
    x = nil
    x = (im.x or 0)
    y = nil
    y = (im.y or 0)
    w = nil
    w = (im.w or default_image_width)
    h = nil
    h = (im.h or default_image_height)
    file = nil
    file = tostring(im.file)
    if file == nil then
        print("set image file")
    end
    ---------------------------------------------
    local show = imlib_load_image(file)
    if show == nil then
        return
    end
    imlib_context_set_image(show)
    if tonumber(w) == 0 then
        width = imlib_image_get_width()
    else
        width = tonumber(w)
    end
    if tonumber(h) == 0 then
        height = imlib_image_get_height()
    else
        height = tonumber(h)
    end
    imlib_context_set_image(show)
    local scaled = imlib_create_cropped_scaled_image(0, 0, imlib_image_get_width(), imlib_image_get_height(), width,
                       height)
    imlib_free_image()
    imlib_context_set_image(scaled)
    imlib_render_image_on_drawable(x, y)
    imlib_free_image()
    show = nil
end -- function image ##################################################################
-- clickfunction, this runs xdotool and xwininfo and reads the coordinates of clicks
function clickfunction()
    -- start click logging and calculations ##########################################
    if click_start == 1 then
        xdot = conky_parse("${if_running xdotool}1${else}0${endif}")
        if tonumber(xdot) == 1 then
            os.execute("killall xdotool && echo 'xdo killed' &")
        end
        os.execute("xdotool search --name 'clicky' behave %@ mouse-click getmouselocation >> /tmp/xdo &")
        local f = io.popen("xwininfo -name 'clicky' | grep 'Absolute'")
        geometry = f:read("*a")
        f:close()
        local geometry = string.gsub(geometry, "[\n]", "")
        s, f, abstlx = string.find(geometry, "X%p%s*(%d*)")
        s, f, abstly = string.find(geometry, "Y%p%s*(%d*)")
        click_start = nil
    end -- if click_start=1 ######################################
    -- click calculations #################################
    local f = io.open("/tmp/xdo")
    click = f:read()
    f:close()
    if click ~= nil then
        local f = io.open("/tmp/xdo", "w")
        f:write("")
        f:close()
    end -- if click=nil
    if click == nil then
        click = "x:0 y:0 "
    end
    -- print (click)
    local s, f, mousex = string.find(click, "x%p(%d*)%s")
    local s, f, mousey = string.find(click, "y%p(%d*)%s")
    localx = tonumber(mousex) - abstlx
    localy = tonumber(mousey) - abstly
    -- get now location
    os.execute("xdotool getmouselocation > /tmp/xdonow ")
    local f = io.open("/tmp/xdonow")
    mousenow = f:read()
    f:close()
    local s, f, mousenowx = string.find(mousenow, "x%p(%d*)%s")
    local s, f, mousenowy = string.find(mousenow, "y%p(%d*)%s")
    localnowx = tonumber(mousenowx) - abstlx
    localnowy = tonumber(mousenowy) - abstly
    -- END CLICK CALCULATIONS #################################
    return localx, localy, localnowx, localnowy
end -- function
