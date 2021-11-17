PrintDebug("sourced mouse.lua")
system.mouseCommand = function(arg1, arg2, arg3) -- line 3
    if system.currentSet then
        system.currentSet:mouseCommand(arg1, arg2, arg3)
    end
end
system.mouseSpecial = function(arg1, arg2) -- line 8
    if system.currentSet then
        if system.currentSet.mouseSpecial then
            system.currentSet:mouseSpecial(arg1, arg2)
        end
    end
end
system.mouseWalk = function(arg1, arg2, arg3, arg4) -- line 15
    if system.currentSet then
        system.currentSet:mouseWalk(arg1, arg2, arg3 / 3, arg4)
    end
end
system.mouseUseInHand = function(arg1, arg2) -- line 20
    if system.currentSet and system.currentActor and system.currentActor.is_holding then
        system.currentSet:mouseWalk(arg1, arg2, 0, nil)
    end
end
system.dialogSelect = function(arg1, arg2) -- line 25
    if system.lastDialog then
        system.lastDialog:mouseSelect(arg1, arg2)
    end
end
system.mouseInventory = function(arg1, arg2) -- line 30
    if arg1 == "outside" then
        manny.is_holding = nil
        Inventory:close_me()
    else
        item = Inventory:get_item(arg1)
        if arg2 == 1 or arg2 == 3 then
            manny.is_holding = item
            Inventory:close_me()
        elseif arg2 == 2 then
            start_script(Sentence, "lookAt", item)
        end
    end
end
system.mouseNowalk = function(arg1) -- line 44
    if system.currentSet and system.currentSet.nowalk then
        system.currentSet:nowalk(arg1)
    end
end
system.climbTowards = function(arg1, arg2) -- line 49
    if arg2 > 0 then
        stop_script(climb_actor_down_to)
        single_start_script(climb_actor_up_to, system.currentActor, arg1)
    else
        stop_script(climb_actor_up_to)
        single_start_script(climb_actor_down_to, system.currentActor, arg1)
    end
end
system.linearMove = function(arg1, arg2, arg3) -- line 58
    if system.currentSet then
        if arg2 > 0 then
            stop_script(system.currentSet.linearMoveMinus)
            single_start_script(system.currentSet.linearMovePlus, system.currentSet, arg1, arg3)
        else
            stop_script(system.currentSet.linearMovePlus)
            single_start_script(system.currentSet.linearMoveMinus, system.currentSet, arg1, arg3)
        end
    end
end
Set.update_hotspots = function(arg1) -- line 69
    local local1, local2
    break_here()
    local1, local2 = next(arg1, nil)
    ActivateHotspot(-1, FALSE)
    while local1 do
        if type(local2) == "table" then
            if local2.touchable and local2.range > 0 then
                ActivateHotspot(local2.hotspot_id, TRUE)
            end
        end
        local1, local2 = next(arg1, local1)
    end
end
walk_and_do = function(arg1, arg2, arg3, arg4, arg5) -- line 83
    if cutSceneLevel > 0 then
        return
    end
    if system.currentActor.driveto then
        local local1, local2, local3
        local1 = arg2.use_pnt_x
        local2 = arg2.use_pnt_y
        local3 = arg2.use_pnt_z
        if local1 and not arg2.active_driving then
            system.currentActor:driveto(local1, local2, local3)
        end
    elseif not arg2.use_immediate then
        if arg4 == 2 then
            result = system.currentActor:runto_object(arg2, nil, 0)
        elseif arg4 == 1 then
            result = system.currentActor:walkto_object(arg2, nil, 0)
        end
    end
    if cutSceneLevel > 0 then
        return
    end
    if arg3 == 4 or arg3 == 5 then
        if not arg2.walkOut then
            arg1 = "lookAt"
            NotifyWalk(arg2.hotspot_id)
        end
    end
    if system.currentActor == manny or arg2.active_driving then
        Sentence(arg1, arg2, arg5)
    else
        WalkActorForward(system.currentActor.hActor)
    end
end
just_walk = function(arg1, arg2, arg3) -- line 117
    if cutSceneLevel > 0 then
        return
    end
    local local1 = 0
    if arg1 == 2 and system.currentActor.is_holding and system.currentActor.is_holding.use_immediate then
        local1 = arg2
    end
    while local1 < arg2 do
        local local2 = arg3[local1 * 3]
        local local3 = arg3[local1 * 3 + 1]
        local local4 = arg3[local1 * 3 + 2]
        if system.currentActor.driveto then
            system.currentActor:driveto(local2, local3, local4)
        else
            WalkActorTo(system.currentActor.hActor, local2, local3, local4, nil, nil, nil, 0)
        end
        system.currentActor:wait_for_actor()
        local1 = local1 + 1
    end
    if system.currentActor.driveto then
        WalkActorForward(system.currentActor.hActor)
    elseif arg1 == 2 and system.currentActor.is_holding then
        start_script(Sentence, "use", system.currentActor.is_holding, nil, TRUE)
    end
end
Set.mouseWalk = function(arg1, arg2, arg3, arg4, arg5) -- line 143
    if cutSceneLevel > 0 then
        return
    end
    system.currentActor.stop_idle = TRUE
    kill_soft_scripts()
    stop_script(Sentence)
    stop_script(walk_and_do)
    stop_script(just_walk)
    if arg3 == 0 then
        system.currentActor:set_run(FALSE)
    else
        system.currentActor:set_run(TRUE)
    end
    if system.currentActor.set_walk_backwards then
        system.currentActor:set_walk_backwards(FALSE)
    end
    start_script(just_walk, arg2, arg4, arg5)
end
Set.mouseCommand = function(arg1, arg2, arg3, arg4) -- line 162
    local local1, local2
    if cutSceneLevel > 0 then
        return
    end
    system.currentActor.stop_idle = TRUE
    local1, local2 = next(arg1, nil)
    while local1 do
        if type(local2) == "table" then
            if local2.hotspot_id == arg3 then
                kill_soft_scripts()
                stop_script(walk_and_do)
                stop_script(just_walk)
                stop_script(Sentence)
                if arg2 == 2 then
                    start_script(walk_and_do, "lookAt", local2, arg2, arg4)
                elseif arg2 == 1 or arg2 == 4 or arg2 == 5 then
                    if local2.walkOut and (not system.currentActor.is_holding or not system.currentActor.is_holding.use_on_door) then
                        start_script(walk_and_do, "walkOut", local2, arg2, arg4)
                    elseif system.currentActor.is_holding then
                        start_script(walk_and_do, "use", local2, arg2, arg4, system.currentActor.is_holding)
                    else
                        start_script(walk_and_do, "use", local2, arg2, arg4)
                    end
                elseif arg2 == 3 then
                    if system.currentActor.is_holding then
                        start_script(system.currentActor.is_holding.put_away, system.currentActor.is_holding)
                    else
                        start_script(walk_and_do, "pickUp", local2, arg2, arg4)
                    end
                end
            end
        end
        local1, local2 = next(arg1, local1)
    end
end
system.mouseOpt = function(arg1, arg2, arg3, arg4) -- line 198
    if arg1 == "op_main.set" then
        main_menu:choose_item(arg3)
    elseif arg1 == "op_help.set" then
        if arg3 == 0 then
            help_menu:cancel(TRUE)
            main_menu:run()
        elseif arg3 == 1 then
            help_menu.cur_page = help_menu.cur_page - 1
            if help_menu.cur_page < 1 then
                help_menu.cur_page = 3
            end
        elseif arg3 == 2 then
            help_menu.cur_page = help_menu.cur_page + 1
            if help_menu.cur_page > 3 then
                help_menu.cur_page = 1
            end
        end
    elseif arg1 == "op_opt.set" then
        inc = 5
        if arg3 == 13 then
            inc = 1
        end
        if arg2 == "oxlo" then
            settings_menu.gauges[arg3]:set_value(settings_menu.gauges[arg3].value - inc)
        elseif arg2 == "oxhi" then
            settings_menu.gauges[arg3]:set_value(settings_menu.gauges[arg3].value + inc)
        elseif arg2 == "oxchange" or arg2 == "oxselect" then
            settings_menu:choose_item(arg3)
        end
    elseif arg1 == "op_3d.set" then
        if arg3 > 0 then
            display_menu:choose_item(arg3)
        end
    elseif arg1 == "op_load.set" and not saveload_menu.edit_line.is_active then
        if arg2 == "oxup" then
            saveload_menu.menu.top_item = saveload_menu.menu.top_item - 3
            if saveload_menu.menu.top_item < 1 then
                saveload_menu.menu.top_item = 1
            end
        elseif arg2 == "oxdn" then
            saveload_menu.menu.top_item = saveload_menu.menu.top_item + 3
            if saveload_menu.menu.top_item + saveload_menu.menu.visible_items > saveload_menu.menu.num_items + 1 then
                saveload_menu.menu.top_item = saveload_menu.menu.num_items - saveload_menu.menu.visible_items + 1
            end
        end
        system.mouseHover(arg1, arg3)
        if arg2 == "oxselect" then
            saveload_menu:buttonHandler(13, 1, 1)
        elseif arg2 == "oxcancel" then
            saveload_menu:buttonHandler(27, 1, 1)
        end
    elseif arg1 == "op_query.set" and arg3 >= 0 and cur_query then
        system.mouseHover(arg1, arg3)
        single_start_script(cur_query.ok, cur_query)
    elseif arg1 == "op_dialog.set" then
        if arg2 == "oxup" then
            single_start_script(dialog_log.scroll_up, dialog_log)
        elseif arg2 == "oxdn" then
            single_start_script(dialog_log.scroll_down, dialog_log)
        elseif arg2 == "oxexit" then
            dialog_log:cancel(TRUE)
            main_menu:run()
        end
    elseif arg1 == "op_cut.set" then
        if arg2 == "oxup" then
            cutscene_menu.menu.top_item = cutscene_menu.menu.top_item - 3
            if cutscene_menu.menu.top_item < 1 then
                cutscene_menu.menu.top_item = 1
            end
        elseif arg2 == "oxdn" then
            cutscene_menu.menu.top_item = cutscene_menu.menu.top_item + 3
            if cutscene_menu.menu.top_item + cutscene_menu.menu.visible_items > cutscene_menu.menu.num_items + 1 then
                cutscene_menu.menu.top_item = cutscene_menu.menu.num_items - cutscene_menu.menu.visible_items + 1
            end
        end
        system.mouseHover(arg1, arg3)
        if arg2 == "oxselect" then
            cutscene_menu:buttonHandler(13, 1, 1)
        elseif arg2 == "exexit" then
            cutscene_menu:buttonHandler(27, 1, 1)
        end
    end
end
system.mouseHover = function(arg1, arg2) -- line 282
    if arg1 == "op_main.set" then
        main_menu.menu.cur_item = arg2
    elseif arg1 == "op_opt.set" then
        settings_menu.menu.cur_item = arg2
    elseif arg1 == "op_3d.set" and arg2 > 0 then
        display_menu.active_menu.cur_item = arg2
    elseif arg1 == "op_load.set" and arg2 > 0 and arg2 + saveload_menu.menu.top_item ~= saveload_menu.menu.num_items then
        if not saveload_menu.edit_line.is_active then
            saveload_menu.menu.cur_item = arg2 + saveload_menu.menu.top_item - 1
        end
    elseif arg1 == "op_query.set" and cur_query then
        cur_query.current_choice = arg2 - 1
    elseif arg1 == "op_cut.set" and arg2 > 0 and arg2 + cutscene_menu.menu.top_item ~= cutscene_menu.menu.num_items then
        cutscene_menu.menu.cur_item = arg2 + cutscene_menu.menu.top_item - 1
    end
end
suitInventoryButtonHandler2 = function(arg1, arg2, arg3) -- line 299
    if control_map.OVERRIDE[arg1] or control_map.INVENTORY[arg1] and arg2 then
        system.currentActor.is_holding = nil
        if manny.dying then
            start_script(dead_close_inventory, TRUE)
        else
            start_script(close_inventory, TRUE)
        end
    end
end
Inventory.setup_draw = function(arg1) -- line 309
    local local1
    local local2, local3
    if IsMoviePlaying() then
        StopMovie()
    else
        system.loopingMovie = nil
    end
    system.lastSet = system.currentSet
    LockSet(system.currentSet.setFile)
    if manny.costume_state == "suit" then
        local1 = suit_inv
    elseif manny.costume_state == "action" then
        local1 = action_inv
    elseif manny.costume_state == "cafe" then
        local1 = cafe_inv
    elseif manny.costume_state == "nautical" then
        local1 = nautical_inv
    elseif manny.costume_state == "siberian" or manny.costume_state == "thunder" then
        if manny.fancy then
            local1 = charlie_inv
        else
            local1 = siberian_inv
        end
    elseif manny.costume_state == "reaper" then
        local1 = death_inv
    end
    local2, local3 = next(Inventory.unordered_inventory_table, nil)
    RegisterInventory("reset")
    while local2 do
        RegisterInventory(local2.name, local2:get_inv())
        local2, local3 = next(Inventory.unordered_inventory_table, local2)
    end
end
Inventory.get_item = function(arg1, arg2) -- line 343
    local2, local3 = next(Inventory.unordered_inventory_table, nil)
    while local2 do
        if local2.name == arg2 then
            return local2
        end
        local2, local3 = next(Inventory.unordered_inventory_table, local2)
    end
    return nil
end
Inventory.userPaintHandler = function(arg1) -- line 353
    CleanBuffer()
    Display()
end
Inventory.unload_inventory = function(arg1) -- line 357
    PrintDebug("leaving inventory")
    if system.loopingMovie and type(system.loopingMovie) == "table" then
        play_movie_looping(system.loopingMovie.name, system.loopingMovie.x, system.loopingMovie.y)
    end
    if system.currentSet == sh or system.currentSet == zw then
        sh:set_up_flowers()
    end
end
Inventory.close_me = function(arg1) -- line 366
    if manny.dying then
        start_script(dead_close_inventory)
    else
        start_script(close_inventory)
    end
end
Object.rename = function(arg1, arg2) -- line 373
    arg1.name = arg2
    arg1.string_name = trim_header(arg2)
    RenameHotspot(arg1.hotspot_id, arg2)
end
Object.get_inv = function(arg1) -- line 378
    if arg1.inv_name then
        return arg1.inv_name
    else
        return arg1.string_name
    end
end
Actor.runto_object = function(arg1, arg2, arg3, arg4) -- line 385
    local local1, local2, local3, local4, local5, local6, local7
    local local8, local9
    arg1:set_run(TRUE)
    if arg1.set_walk_backwards then
        arg1:set_walk_backwards(FALSE)
    end
    if arg2.parent == Ladder then
        if arg3 then
            local9 = arg2.base.out_pnt_z
            local8 = arg2.top.out_pnt_z
        else
            local9 = arg2.base.use_pnt_z
            local8 = arg2.top.use_pnt_z
        end
        local1 = arg1:getpos()
        if abs(local9 - local1.z) < abs(local8 - local1.z) then
            arg2 = arg2.base
        else
            arg2 = arg2.top
        end
    end
    local2 = arg2.use_pnt_x
    local3 = arg2.use_pnt_y
    local4 = arg2.use_pnt_z
    local5 = arg2.use_rot_x
    local6 = arg2.use_rot_y
    local7 = arg2.use_rot_z
    if local2 then
        PrintDebug("Run " .. arg1.name .. " to " .. arg2.name .. "\t" .. local2 .. "\t" .. local3 .. "\t" .. local4 .. "\n")
        if arg1 == system.currentActor then
            stop_movement_scripts()
        end
        SetActorConstrain(arg1.hActor, FALSE)
        arg1:runto(local2, local3, local4, local5, local6, local7, arg4)
        while arg1:is_moving() or arg1:is_turning() do
            break_here()
        end
        if arg1 == system.currentActor and MarioControl then
            WalkVector.x = 0
            WalkVector.y = 0
            WalkVector.z = 0
            single_start_script(WalkManny)
        end
        local1 = object_proximity(arg2, arg3)
        if local1 <= MAX_PROX then
            PrintDebug("made it to the use/out point of " .. arg2.name .. "!\n")
            return TRUE
        else
            PrintDebug("Didn't make it to the use/out point of " .. arg2.name .. "!\n")
            return FALSE
        end
    else
        PrintDebug("Object has no use/out point!\n")
    end
end
Actor.set_walk_chore = function(arg1, arg2, arg3, arg4) -- line 441
    arg1.walk_chore = arg2
    if not arg3 then
        arg3 = arg1.base_costume
    end
    SetActorWalkChore(arg1.hActor, arg2, arg3, arg4)
end
Actor.setpos = function(arg1, arg2, arg3, arg4, arg5) -- line 448
    if type(arg2) == "table" then
        arg1:moveto(arg2.x, arg2.y, arg2.z, arg5)
    else
        arg1:moveto(arg2, arg3, arg4, arg5)
    end
end
Actor.moveto = function(arg1, arg2, arg3, arg4, arg5) -- line 455
    if type(arg2) == "table" then
        PutActorAt(arg1.hActor, arg2.use_pnt_x, arg2.use_pnt_y, arg2.use_pnt_z, arg5)
    else
        PutActorAt(arg1.hActor, arg2, arg3, arg4, arg5)
    end
end
Actor.driveto = nil
Actor.teleport_out_of_hot_box = function() -- line 463
end
Dialog.mouseSelect = function(arg1, arg2, arg3) -- line 465
    arg1.selected_line = arg2
    arg1:update_colors()
    if arg3 == 1 and arg2 > 0 and arg2 < arg1.next_line then
        start_script(arg1.execute_line, arg1, arg1.selected_line)
    end
end
climb_actor_down_to = function(arg1, arg2) -- line 472
    local local1
    while arg1:getpos().z > arg2 and cutSceneLevel <= 0 do
        if not find_script(arg1.climb_down) then
            local1 = start_script(arg1.climb_down, arg1)
            wait_for_script(local1)
        else
            break_here()
        end
    end
end
climb_actor_up_to = function(arg1, arg2) -- line 483
    local local1
    while arg1:getpos().z < arg2 and cutSceneLevel <= 0 do
        if not find_script(arg1.climb_up) then
            local1 = start_script(arg1.climb_up, arg1)
            wait_for_script(local1)
        else
            break_here()
        end
    end
end
curbman = function() -- line 494
end
input_boot_parameter = function() -- line 496
    local local1
    local1 = InputDialog("Boot Parameter", "Enter jump number:")
    start_script(jump_script2, local1)
end
jump_script2 = function(arg1) -- line 501
    if arg1 == "cs1" then
        ga.work_order:get()
        co.computer.set_to_sign = TRUE
    elseif arg1 == "rf" then
        fe.basket.pickUp()
    elseif arg1 == "al" then
        reaped_meche = TRUE
        al:switch_to_set()
        al:enter()
    elseif arg1 == "bd" then
        bd.extinguisher:get()
        bd.entered_bd = TRUE
        bd:switch_to_set()
    elseif arg1 == "si" then
        si.naranja_out = TRUE
        si:switch_to_set()
        manny:put_in_set(si)
    elseif arg1 == "gh2" then
        glottis.ripped_heart = TRUE
        glottis.heartless = FALSE
        mod_solved = TRUE
        sg:switch_to_set()
        start_script(sg.replace_heart, sg)
    elseif arg1 == "tr" then
        glottis.ripped_heart = TRUE
        glottis.heartless = FALSE
        sg:switch_to_set()
        start_script(tr.drive_in, tr)
    elseif arg1 == "na" then
        nav_solved = TRUE
        na:switch_to_set()
    elseif arg1 == "vd" then
        vd.door_busted = TRUE
        meche.locked_up = TRUE
        vd.door_open = TRUE
        vd:switch_to_set()
    elseif arg1 == "me" then
        me:switch_to_set()
        me:setup_part2()
    elseif arg1 == "ly" then
        fi.gun:get()
        manny.fancy = TRUE
        ly:switch_to_set()
        ly.brennis_obj:use()
    elseif arg1 == "zw" then
        manny.been_in_at = TRUE
        zw:switch_to_set()
        start_script(cut_scene.albinizod)
    elseif arg1 == "sh" then
        bowlsley_in_hiding = TRUE
        th.grinder.has_bone = TRUE
        th.grinder:get()
        sh:switch_to_set()
    else
        jump_script(arg1)
    end
end
START_CUT_SCENE = function(arg1) -- line 559
    PrintDebug("start_cut_scene")
    InteractMode(1)
    if cutSceneLevel == 0 then
        cameraman_disabled = TRUE
    end
    cutSceneLevel = cutSceneLevel + 1
    stop_movement_scripts()
    if arg1 == "no head" then
        enable_head_control(FALSE)
    end
end
END_CUT_SCENE = function() -- line 571
    if cutSceneLevel > 0 then
        PrintDebug("end_cut_scene")
        cutSceneLevel = cutSceneLevel - 1
        if cutSceneLevel == 0 then
            InteractMode(0)
            cutSceneLevel = 0
            cameraman_disabled = FALSE
            set_override(nil)
            ResetMarioControls()
            single_start_script(WalkManny)
            time_to_look = TRUE
            start_script(check_for_movement_keys)
        end
    end
end
trim_header = function(arg1) -- line 587
    local local1, local2, local3
    if not arg1 then
        return "", ""
    end
    if strsub(arg1, 1, 1) == "/" then
        local3 = strfind(arg1, "/", 2, TRUE)
        if local3 then
            local1 = strsub(arg1, local3 + 1)
            local2 = strsub(arg1, 1, local3)
        else
            local1 = strsub(arg1, 10, strlen(arg1))
            local2 = strsub(arg1, 1, 9)
        end
        arg1 = local1
    end
    return arg1, local2
end
ac.linearMovePlus = function(arg1, arg2, arg3) -- line 605
    stop_script(ac.crawl_forward)
    while manny:getpos().x < arg2 and cutSceneLevel <= 0 do
        if find_script(ac.crawl_backward) == nil then
            start_script(ac.crawl_backward)
        else
            break_here()
        end
    end
end
ac.linearMoveMinus = function(arg1, arg2, arg3) -- line 615
    stop_script(ac.crawl_backward)
    while manny:getpos().x > arg2 and cutSceneLevel <= 0 do
        if find_script(ac.crawl_forward) == nil then
            start_script(ac.crawl_forward)
        else
            break_here()
        end
    end
end
al.dummy_door = Object:create(al, "/altxa00/dummydoor", 0, 100, 0, { range = 0.100000001 })
al.dummy_door:make_untouchable()
al.ga_door_obj:rename("/altxa01/big door")
at.mouseSpecial = function(arg1, arg2, arg3) -- line 628
    if arg2 == "sxcat" and arg3 > 0 then
        start_script(at.ledge.use)
    end
end
at.linearMovePlus = function(arg1, arg2, arg3) -- line 633
    if arg3 == 2 and manny.is_holding then
        start_script(Sentence, "use", manny.is_holding)
    else
        stop_script(at.drive_forward)
        while glottis:getpos().y < arg2 and cutSceneLevel <= 0 do
            if find_script(at.drive_backward) == nil then
                start_script(at.drive_backward)
            else
                break_here()
            end
        end
        if find_script(at.drive_backward) then
            stop_script(at.drive_backward)
        end
        glottis:freeze()
    end
end
at.linearMoveMinus = function(arg1, arg2, arg3) -- line 651
    if arg3 == 2 and manny.is_holding then
        start_script(Sentence, "use", manny.is_holding)
    else
        stop_script(at.drive_backward)
        while glottis:getpos().y > arg2 and cutSceneLevel <= 0 and not glottis:find_sector_name("close_enough") do
            if find_script(at.drive_forward) == nil then
                start_script(at.drive_forward)
            else
                break_here()
            end
        end
        if find_script(at.drive_forward) then
            stop_script(at.drive_forward)
        end
        glottis:freeze()
    end
end
at.ledge.use_immediate = TRUE
bd.extinguisher.use_immediate = TRUE
start_ext = function() -- line 671
    inventory_disabled = TRUE
    START_CUT_SCENE()
    manny:set_run(FALSE)
    inventory_save_handler = system.buttonHandler
    system.buttonHandler = fireExtinguisherHandler
    manny:stop_chore(manny.hold_chore, "ma.cos")
    manny:stop_chore(ma_hold, "ma.cos")
    manny:push_costume("ma_use_extin.cos")
    manny:play_chore(1, "ma_use_extin.cos")
    manny:wait_for_chore(1, "ma_use_extin.cos")
    END_CUT_SCENE()
    local1 = bd.extinguisher.fire_extinguisher()
    if local1 then
        bd.beavers.sprayed = bd.beavers.sprayed + 1
        if bd.beavers.sprayed == 1 then
            manny:say_line("/bdma021/")
        elseif bd.beavers.sprayed == 2 then
            manny:say_line("/bdma022/")
        elseif bd.beavers.sprayed == 3 then
            manny:say_line("/bdma023/")
        elseif bd.beavers.sprayed == 4 then
            manny:say_line("/bdma024/")
        elseif bd.beavers.sprayed == 5 then
            manny:say_line("/bdma025/")
        elseif bd.beavers.sprayed == 6 then
            manny:say_line("/bdma026/")
        else
            manny:say_line("/bdma027/")
        end
    end
    manny:pop_costume()
    manny:play_chore_looping(manny.hold_chore, "ma.cos")
    manny:play_chore_looping(ma_hold, "ma.cos")
    inventory_disabled = FALSE
end
bd.extinguisher.use = function(arg1) -- line 707
    local local1
    local local2
    local local3
    if system.currentSet == bd then
        if bd.firing_extinguisher then
            bd.firing_extinguisher = FALSE
        else
            bd.firing_extinguisher = TRUE
            if not find_script(start_ext) then
                start_script(start_ext)
            end
        end
    else
        bd.extinguisher:default_response()
    end
end
bv.bone_wagon:rename("/bvtxa00/bonewagon")
bv.padlock:rename("/bvtx043/padlock")
bv.padlock_obj:rename("/bvtxa01/padlock")
bv.gate:rename("/bvtx053/gate")
bv.bd_door:rename("/bvtxa02/door")
cf.mouseSpecial = function(arg1, arg2, arg3) -- line 729
    if arg3 > 0 and cutSceneLevel <= 0 then
        if arg2 == "sxcancel" then
            single_start_script(cf.close_panel)
        elseif arg2 == "sxmagnet" then
            if arg3 == 2 then
                single_start_script(cf.panel.lookAt, cf.panel)
            else
                single_start_script(cf.toggle_magnet)
            end
        end
    end
end
cf.panel:rename("/cftxa00/panel")
cf.panelcu:rename("/cftxa01/panel")
cf.drawer:rename("/cftxa02/drawer")
cf.lounge:rename("/cftxa03/lounge")
cn.charlie_obj:rename("/cntxa06/charlie")
cn.printer:rename("/cntxa05/printer")
cn.ticket:rename("/cntxa04/stub")
cn.bogen_obj:rename("/cntxa00/bogen")
cn.gamblers:rename("/cntxa01/gamblers")
cn.croupier_obj:rename("/cntxa02/croupier")
cn.pass:rename("/cntxa03/pass")
co.computer.mouseSelect = function(arg1, arg2, arg3) -- line 753
    if arg2 > 0 and co.computer.selection ~= arg2 - 1 then
        start_sfx("cpuBeep2.WAV")
    end
    if arg2 == 0 then
        co.computer.selection = 0
    else
        co.computer.selection = arg2 - 1
    end
    if arg3 == 0 then
        start_script(co.computer.draw_choices, co.computer)
    end
    if arg3 == 1 and arg2 > 0 then
        SwitchControlMode(0)
        start_script(co.computer.make_selection, co.computer)
    elseif arg3 == 2 and arg2 > 0 then
        start_script(co.computer.select_response, co.computer)
    end
end
cy.offbelt = Object:create(cy, "/cytxa00/offbelt", 100, 0, 0, { range = 0.100000001 })
cy.offbelt.use_pnt_x = 0.0754809976
cy.offbelt.use_pnt_y = 3.71420002
cy.offbelt.use_pnt_z = 0.115829997
cy.offbelt.use = function(arg1) -- line 776
    start_script(cy.jump_off_conveyor, cy)
end
dd.terry_obj:rename("/ddtxa00/terry")
de.forkdrive = Object:create(de, "/detxb00/forklift", 0, 100, 0, { range = 0.100000001 })
de.forkdrive.active_driving = TRUE
de.forkdrive.use = function(arg1) -- line 782
    PrintDebug("im being used")
    if manny.is_driving then
        start_script(de.forklift_actor.dismount, de.forklift_actor)
    else
        start_script(de.forklift_actor.mount, de.forklift_actor)
    end
end
de.forkdrive.lookAt = function(arg1) -- line 790
    manny:say_line("/wcma007/")
end
de.forkdrive.pickUp = function(arg1) -- line 793
    manny:say_line("/wcma008/")
end
dp.anchor:rename("/dptxa00/anchor")
ei.mouseSpecial = function(arg1, arg2, arg3) -- line 797
    if cutSceneLevel <= 0 and arg3 > 0 then
        if arg2 == "sxleft" then
            single_start_script(ei.drive_ship, ei, "starboard")
        elseif arg2 == "sxright" then
            single_start_script(ei.drive_ship, ei, "port")
        elseif arg2 == "sxfwd" then
            single_start_script(ei.drive_ship, ei, "forward")
        elseif arg2 == "sxbwd" then
            single_start_script(ei.drive_ship, ei, "reverse")
        elseif arg2 == "sxcancel" then
            single_start_script(ei.drop_controls, ei)
        end
    end
end
ei.dp_button:rename("/eitxa00/button")
ei.op_button:rename("/eitxa01/button")
ei.intruments:rename("/eitxa02/instruments")
ei.left_control:rename("/eitxa03/lever")
ei.right_control:rename("/eitxa04/lever")
ei.engine:rename("/eitxa05/engine")
ei.spot:rename("/eitxa06/spot")
ei.glottis_obj:rename("/eitxa07/Glottis")
ei.op_door:rename("/eitxa07/door")
ei.il_door:rename("/eitxa08/hatch")
ew.crane_actor.is_left = function(arg1) -- line 822
    return arg1.cur_point >= ew.crane_points.num_points - 1
end
ew.crane_actor.is_right = function(arg1) -- line 825
    return arg1.cur_point == 0
end
ew.crane_actor.move_left = function(arg1) -- line 828
    local local1 = 0
    stop_script(arg1.move_right)
    if not sound_playing("crane.imu") then
        start_sfx("crane.imu")
    else
        fade_sfx("crane.imu", 500, arg1.volume)
    end
    while get_generic_control_state("TURN_LEFT") or find_script(ew.crane_actor.move_to_left) and local1 < ew.crane_points.num_points do
        local1 = arg1.cur_point + 1
        if local1 < ew.crane_points.num_points then
            arg1:move_to_point(local1)
        end
    end
    if sound_playing("crane.imu") then
        fade_sfx("crane.imu", 500, 0)
    end
end
ew.crane_actor.move_right = function(arg1) -- line 846
    local local1 = 0
    stop_script(arg1.move_left)
    if not sound_playing("crane.imu") then
        start_sfx("crane.imu")
    else
        fade_sfx("crane.imu", 500, arg1.volume)
    end
    while get_generic_control_state("TURN_RIGHT") or find_script(ew.crane_actor.move_to_right) and local1 >= 0 do
        local1 = arg1.cur_point - 1
        if local1 >= 0 then
            arg1:move_to_point(local1)
        end
    end
    if sound_playing("crane.imu") then
        fade_sfx("crane.imu", 500, 0)
    end
end
ew.crane_actor.move_to_right = function(arg1, arg2) -- line 864
    if ew.crane_down and not arg1:is_right() then
        single_start_script(ew.raise_crane, ew)
        wait_for_script(ew.raise_crane)
        cutSceneLevel = 0
    end
    while not arg1:is_right() do
        if find_script(ew.crane_actor.move_right) == nil then
            start_script(ew.crane_actor.move_right, ew.crane_actor)
        else
            break_here()
        end
    end
    single_start_script(ew.crane_actor.do_action, arg1, arg2)
end
ew.crane_actor.do_action = function(arg1, arg2) -- line 879
    if arg2 == 1 then
        ew:exit_crane()
    elseif arg2 == 2 then
        ew:raise_crane()
    elseif arg2 == 3 then
        ew:lower_crane()
    end
end
ew.crane_actor.move_to_left = function(arg1, arg2) -- line 888
    if ew.crane_down and not arg1:is_left() then
        single_start_script(ew.raise_crane, ew)
        wait_for_script(ew.raise_crane)
        cutSceneLevel = 0
        InteractMode(0)
    end
    while not arg1:is_left() do
        if find_script(ew.crane_actor.move_left) == nil then
            start_script(ew.crane_actor.move_left, ew.crane_actor)
        else
            break_here()
        end
    end
    single_start_script(ew.crane_actor.do_action, arg1, arg2)
end
ew.mouseSpecial = function(arg1, arg2, arg3) -- line 904
    if cutSceneLevel <= 0 and arg3 > 0 then
        action = 1
        if arg2 == "sxrup" or arg2 == "sxlup" then
            action = 2
        elseif arg2 == "sxrdn" or arg2 == "sxldn" then
            action = 3
        end
        if arg2 == "sxright" or arg2 == "sxrup" or arg2 == "sxrdn" then
            stop_script(ew.crane_actor.move_to_right)
            stop_script(ew.crane_actor.move_right)
            single_start_script(ew.crane_actor.move_to_left, ew.crane_actor, action)
        elseif arg2 == "sxleft" or arg2 == "sxlup" or arg2 == "sxldn" then
            stop_script(ew.crane_actor.move_to_left)
            stop_script(ew.crane_actor.move_left)
            single_start_script(ew.crane_actor.move_to_right, ew.crane_actor, action)
        end
    end
end
gs.ga_door.comeOut = function(arg1) -- line 923
end
hl.raoul_obj:rename("/hltxa00/Raoul")
il.corpse1:rename("/iltxa00/body")
il.corpse2:rename("/iltxa01/body")
il.corpse3:rename("/iltxa02/bodies")
il.corpse4:rename("/iltxa03/bodies")
il.ladder:rename("/iltxa05/ladder")
il.lz_door:rename("/iltxa04/hatch")
ly.mouseSpecial = function(arg1, arg2, arg3) -- line 932
    if arg3 > 0 then
        if arg2 == "dxup" then
            br2:go_up()
        elseif arg2 == "dxdown" then
            br2:go_down()
        end
    end
end
lz.port_pipe:rename("/lztxa00/vent")
lz.starboard_pipe1:rename("/lztxa01/vent")
lz.starboard_pipe2:rename("/lztxa02/vent")
lz.cleat1:rename("/lztxa03/cleat")
lz.cleat2:rename("/lztxa04/cleat")
lz.il_door:rename("/lztxa05/door")
me.ticket:rename("/metxa21/Double-N ticket")
me.door_flowers:rename("/metxa22/flowers")
me.darts:rename("/metxa23/darts")
me.salvador_obj:rename("/metxa20/Salvador's head")
me.salvador2 = Object:create(me, "/metxa30/Salvador's head", 16.7999992, -19.8999996, -7.85500002, { range = 0.899999976 })
me.salvador2.use_pnt_x = 16.7999992
me.salvador2.use_pnt_y = -19.8999996
me.salvador2.use_pnt_z = -7.85500002
me.salvador2:make_untouchable()
me.salvador2.lookAt = function(arg1) -- line 956
    me.salvador_obj:lookAt()
end
me.salvador2.use = function(arg1) -- line 959
    me.salvador_obj:pickUp()
end
me.salvador_obj.use_immediate = TRUE
me.ticket.inv_name = "tix"
mf.nowalk = function(arg1, arg2) -- line 964
    single_start_script(mf.flail_around)
end
mf.wound.use_immediate = TRUE
mf.wound:make_touchable()
na.bone_drive = Object:create(na, "/natxb00/Bone Wagon", 0, 100, 0, { range = 0.100000001 })
na.bone_drive.active_driving = TRUE
na.bone_drive.use_immediate = TRUE
na.bone_drive.use = function(arg1) -- line 972
    if manny.is_driving then
        single_start_script(sg.leave_BW, sg)
    else
        na.bone_wagon:use()
    end
end
na.bone_drive.pickUp = function(arg1) -- line 979
    na.bone_wagon:pickUp()
end
na.bone_drive.lookAt = function(arg1) -- line 982
    na.bone_wagon:lookAt()
end
nq.meche_obj:rename("/nqtxa10/Meche")
nq.inv_name = "lsa_photo"
op.anchor:rename("/optxa00/anchor")
op.ei_door:rename("/optxa01/door")
pf.mouseSpecial = function(arg1, arg2, arg3) -- line 990
    if arg3 > 0 then
        start_script(pf.return_to_set, pf)
    end
end
ri.photo.inv_name = "celso_photo"
sg.bone_drive = Object:create(sg, "/sgtxb00/Bone Wagon", 0, 100, 0, { range = 0.100000001 })
sg.bone_drive.use_immediate = TRUE
sg.bone_drive.active_driving = TRUE
sg.bone_drive.use = function(arg1) -- line 999
    if manny.is_driving then
        single_start_script(sg.leave_BW, sg)
    else
        sg.bone_wagon:use()
    end
end
sg.bone_drive.pickUp = function(arg1) -- line 1006
    sg.bone_wagon:pickUp()
end
sg.bone_drive.lookAt = function(arg1) -- line 1009
    sg.bone_wagon:lookAt()
end
sh.glottis_obj:rename("/shtxa01/glottis")
sh.flower_trail_obj:rename("/shtxa02/master flower trail")
sh.te_ladder:rename("/shtx010/ladder")
sh.remote.use_immediate = TRUE
si.photofinish.use_immediate = TRUE
sl.key.inv_name = "old_key"
sl.key.use_on_door = TRUE
st.rp_door.out_rot_y = 0
su.moving_chepito_obj.use_pnt_x = 0.251300007
su.moving_chepito_obj.use_pnt_y = -4.1566
su.moving_chepito_obj.use_pnt_z = 0
su.mouseSpecial = function(arg1, arg2, arg3) -- line 1025
    if arg3 > 0 then
        if arg2 == "/dxlantern" then
            Dialog:clear()
            Dialog:finish()
            SwitchControlMode(2)
            start_script(su.grab_lantern)
        elseif arg2 == "/dxglottis" then
            start_script(su.give_chepito_to_glottis)
        end
    end
end
su.stop_chepito = function(arg1) -- line 1037
    if proximity(manny, chepito) < 3 then
        START_CUT_SCENE("no head")
        SwitchControlMode(10)
        local local1
        local1 = chepito:getpos()
        manny:say_line("/suma141/")
        stop_script(su.chepito_orbit)
        chepito:stop_walk()
        chepito:walkto(0.699999988, -4, 0)
        chepito:wait_for_actor()
        local1 = chepito:getpos()
        while TurnActorTo(manny.hActor, local1.x, local1.y, local1.z) do
        end
        END_CUT_SCENE()
        Dialog:run("cp1", "dlg_chepito.lua")
    else
        manny:say_line("/suma141/")
        wait_for_message()
        manny:say_line("/suma142/")
    end
end
tg.note.inv_name = "gk_note"
tp.mouseSpecial = function(arg1, arg2, arg3) -- line 1060
    if cutSceneLevel <= 0 and arg3 > 0 then
        if arg2 == "sxldn" or arg2 == "sxlup" then
            tp.current_button = tp.WEEK
            mannys_hands:moveto(-0.00100000005, 0.00200000009, 0)
        elseif arg2 == "sxmdn" or arg2 == "sxmup" then
            tp.current_button = tp.DAY
            mannys_hands:moveto(-0.0149999997, 0.00200000009, 0)
        elseif arg2 == "sxrdn" or arg2 == "sxrup" then
            tp.current_button = tp.RACE
            mannys_hands:moveto(-0.0289999992, 0.00200000009, 0)
        elseif arg2 == "sxprint" then
            tp.current_button = tp.PRINT
            mannys_hands:moveto(-0.0149999997, -0.0199999996, 0)
        elseif arg2 == "sxcancel" then
            single_start_script(tp.close_printer)
        end
        if arg2 == "sxlup" or arg2 == "sxmup" or arg2 == "sxrup" then
            single_start_script(tp.push_up)
        elseif arg2 == "sxldn" or arg2 == "sxmdn" or arg2 == "sxrdn" or arg2 == "sxprint" then
            single_start_script(tp.push_down)
        end
    end
end
tr.mouseSpecial = function(arg1, arg2, arg3) -- line 1084
    if arg2 == "sxcancel" and arg3 > 0 then
        start_script(tr.drop_wheelbarrow)
    end
end
tr.linearMovePlus = function(arg1, arg2, arg3) -- line 1089
    stop_script(tr.pull_barrow)
    while manny:getpos().x < arg2 and cutSceneLevel <= 0 and not manny:find_sector_name("wb_push_lim") do
        if find_script(tr.push_barrow) == nil then
            start_script(tr.push_barrow)
        else
            break_here()
        end
    end
end
tr.linearMoveMinus = function(arg1, arg2, arg3) -- line 1099
    stop_script(tr.push_barrow)
    while manny:getpos().x > arg2 and cutSceneLevel <= 0 and not manny:find_sector_name("wb_pull_lim") do
        if find_script(tr.pull_barrow) == nil then
            start_script(tr.pull_barrow)
        else
            break_here()
        end
    end
    tr.linearMovePlus(arg1, arg2, arg3)
end
move_right = function() -- line 1110
    if manny:find_sector_name("wb_push_lim") then
        start_script(tr.wheelbarrow.out_of_bounds, tr.wheelbarrow)
    else
        stop_script(tr.pull_barrow)
        if find_script(tr.push_barrow) == nil then
            start_script(tr.push_barrow)
        end
    end
end
move_left = function() -- line 1120
    if manny:find_sector_name("wb_pull_lim") then
        start_script(tr.wheelbarrow.out_of_bounds, tr.wheelbarrow)
    else
        stop_script(tr.push_barrow)
        if find_script(tr.pull_barrow) == nil then
            start_script(tr.pull_barrow)
        end
    end
end
ts.tx_door.walkOut = function(arg1) -- line 1130
    tx:come_out_door(tx.ts_door)
end
tu.extinguisher:rename("/tutx018/fire extinguisher")
tu.red_tube_os = Object:create(tu, "/tutxc01/red tube", 0.647489011, -0.162466004, 0.360000014, { range = 9.99999994e-09 })
tu.red_tube_os.use_pnt_x = 1.15021002
tu.red_tube_os.use_pnt_y = -0.162992999
tu.red_tube_os.use_pnt_z = 0
tu.red_tube_os.use_rot_x = 0
tu.red_tube_os.use_rot_y = 4.28539991
tu.red_tube_os.use_rot_z = 0
tu.red_tube_os.lookAt = function(arg1) -- line 1141
    tu.red_tube:lookAt()
end
tu.red_tube_os.use = function(arg1) -- line 1144
    system.default_response("reach")
end
vd.mouseSpecial = function(arg1, arg2, arg3) -- line 1147
    if cutSceneLevel <= 0 then
        if arg2 == "sxleft" then
            single_start_script(vd.turn_clockwise)
        elseif arg2 == "sxright" then
            single_start_script(vd.turn_counterclockwise)
        elseif arg2 == "sxcancel" then
            single_start_script(vd.back_off, vd)
        end
    end
end
vi.broadaxe:rename("/vitxa04/axe")
vo.dummy_axe = Object:create(vo, "/votxb00/broadaxe", 0, 100, 0, { range = 0 })
vo.dummy_axe.use_immediate = TRUE
vo.dummy_axe.use = function(arg1) -- line 1161
    single_start_script(vo.drop_axe, vo)
end
wc.forkdrive = Object:create(wc, "/wctxb00/forklift", 0, 100, 0, { range = 0.100000001 })
wc.forkdrive.active_driving = TRUE
wc.forkdrive.use = function(arg1) -- line 1166
    if manny.is_driving then
        start_script(de.forklift_actor.dismount, de.forklift_actor)
    else
        start_script(de.forklift_actor.mount, de.forklift_actor)
    end
end
wc.forkdrive.lookAt = function(arg1) -- line 1173
    manny:say_line("/wcma007/")
end
wc.forkdrive.pickUp = function(arg1) -- line 1176
    manny:say_line("/wcma008/")
end
