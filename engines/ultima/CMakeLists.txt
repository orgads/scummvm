add_engine(ultima
	nuvie/actors/actor.cpp nuvie/actors/actor.h
	nuvie/actors/actor_manager.cpp nuvie/actors/actor_manager.h
	nuvie/actors/md_actor.cpp nuvie/actors/md_actor.h
	nuvie/actors/se_actor.cpp nuvie/actors/se_actor.h
	nuvie/actors/u6_actor.cpp nuvie/actors/u6_actor.h
	nuvie/actors/u6_actor_types.h
	nuvie/actors/u6_work_types.h
	nuvie/actors/wou_actor.cpp nuvie/actors/wou_actor.h
	nuvie/conf/config_node.h
	nuvie/conf/configuration.cpp nuvie/conf/configuration.h
	nuvie/conf/misc.cpp nuvie/conf/misc.h
	nuvie/core/anim_manager.cpp nuvie/core/anim_manager.h
	nuvie/core/book.cpp nuvie/core/book.h
	nuvie/core/converse.cpp nuvie/core/converse.h
	nuvie/core/converse_interpret.cpp nuvie/core/converse_interpret.h
	nuvie/core/converse_speech.cpp nuvie/core/converse_speech.h
	nuvie/core/cursor.cpp nuvie/core/cursor.h
	nuvie/core/debug.cpp
	nuvie/core/debugger.cpp nuvie/core/debugger.h
	nuvie/core/effect.cpp nuvie/core/effect.h
	nuvie/core/effect_manager.cpp nuvie/core/effect_manager.h
	nuvie/core/egg_manager.cpp nuvie/core/egg_manager.h
	nuvie/core/events.cpp nuvie/core/events.h
	nuvie/core/game.cpp nuvie/core/game.h
	nuvie/core/game_clock.cpp nuvie/core/game_clock.h
	nuvie/core/look.cpp nuvie/core/look.h
	nuvie/core/magic.cpp nuvie/core/magic.h
	nuvie/core/map.cpp nuvie/core/map.h
	nuvie/core/nuvie_defs.cpp nuvie/core/nuvie_defs.h
	nuvie/core/obj.cpp nuvie/core/obj.h
	nuvie/core/obj_manager.cpp nuvie/core/obj_manager.h
	nuvie/core/party.cpp nuvie/core/party.h
	nuvie/core/player.cpp nuvie/core/player.h
	nuvie/core/tile_manager.cpp nuvie/core/tile_manager.h
	nuvie/core/timed_event.cpp nuvie/core/timed_event.h
	nuvie/core/u6_objects.h
	nuvie/core/weather.cpp nuvie/core/weather.h
	nuvie/files/nuvie_bmp_file.cpp nuvie/files/nuvie_bmp_file.h
	nuvie/files/nuvie_file_list.cpp nuvie/files/nuvie_file_list.h
	nuvie/files/nuvie_io.cpp nuvie/files/nuvie_io.h
	nuvie/files/nuvie_io_file.cpp nuvie/files/nuvie_io_file.h
	nuvie/files/tmx_map.cpp nuvie/files/tmx_map.h
	nuvie/files/u6_bmp.cpp nuvie/files/u6_bmp.h
	nuvie/files/u6_lib_n.cpp nuvie/files/u6_lib_n.h
	nuvie/files/u6_lzw.cpp nuvie/files/u6_lzw.h
	nuvie/files/u6_shape.cpp nuvie/files/u6_shape.h
	nuvie/files/utils.cpp nuvie/files/utils.h
	nuvie/fonts/bmp_font.cpp nuvie/fonts/bmp_font.h
	nuvie/fonts/conv_font.cpp nuvie/fonts/conv_font.h
	nuvie/fonts/font.cpp nuvie/fonts/font.h
	nuvie/fonts/font_manager.cpp nuvie/fonts/font_manager.h
	nuvie/fonts/u6_font.cpp nuvie/fonts/u6_font.h
	nuvie/fonts/wou_font.cpp nuvie/fonts/wou_font.h
	nuvie/gui/widgets/background.cpp nuvie/gui/widgets/background.h
	nuvie/gui/widgets/command_bar.cpp nuvie/gui/widgets/command_bar.h
	nuvie/gui/widgets/command_bar_new_ui.cpp nuvie/gui/widgets/command_bar_new_ui.h
	nuvie/gui/widgets/console.cpp nuvie/gui/widgets/console.h
	nuvie/gui/widgets/converse_gump.cpp nuvie/gui/widgets/converse_gump.h
	nuvie/gui/widgets/converse_gump_wou.cpp nuvie/gui/widgets/converse_gump_wou.h
	nuvie/gui/widgets/fps_counter.cpp nuvie/gui/widgets/fps_counter.h
	nuvie/gui/widgets/gui_widget.cpp nuvie/gui/widgets/gui_widget.h
	nuvie/gui/widgets/map_window.cpp nuvie/gui/widgets/map_window.h
	nuvie/gui/widgets/msg_scroll.cpp nuvie/gui/widgets/msg_scroll.h
	nuvie/gui/widgets/msg_scroll_new_ui.cpp nuvie/gui/widgets/msg_scroll_new_ui.h
	nuvie/gui/gui.cpp nuvie/gui/gui.h
	nuvie/gui/gui_area.cpp nuvie/gui/gui_area.h
	nuvie/gui/gui_button.cpp nuvie/gui/gui_button.h
	nuvie/gui/gui_callback.h
	nuvie/gui/gui_console.cpp nuvie/gui/gui_console.h
	nuvie/gui/gui_dialog.cpp nuvie/gui/gui_dialog.h
	nuvie/gui/gui_drag_area.h
	nuvie/gui/gui_drag_manager.cpp nuvie/gui/gui_drag_manager.h
	nuvie/gui/gui_font.cpp nuvie/gui/gui_font.h
	nuvie/gui/gui_load_image.cpp nuvie/gui/gui_load_image.h
	nuvie/gui/gui_scroll_bar.cpp nuvie/gui/gui_scroll_bar.h
	nuvie/gui/gui_scroller.cpp nuvie/gui/gui_scroller.h
	nuvie/gui/gui_status.h
	nuvie/gui/gui_text.cpp nuvie/gui/gui_text.h
	nuvie/gui/gui_text_input.cpp nuvie/gui/gui_text_input.h
	nuvie/gui/gui_text_toggle_button.cpp nuvie/gui/gui_text_toggle_button.h
	nuvie/gui/gui_types.h
	nuvie/gui/gui_yes_no_dialog.cpp nuvie/gui/gui_yes_no_dialog.h
	nuvie/gui/the_font.h
	nuvie/keybinding/key_actions.cpp nuvie/keybinding/key_actions.h
	nuvie/keybinding/keys.cpp nuvie/keybinding/keys.h
	nuvie/keybinding/keys_enum.h
	nuvie/menus/audio_dialog.cpp nuvie/menus/audio_dialog.h
	nuvie/menus/cheats_dialog.cpp nuvie/menus/cheats_dialog.h
	nuvie/menus/game_menu_dialog.cpp nuvie/menus/game_menu_dialog.h
	nuvie/menus/gameplay_dialog.cpp nuvie/menus/gameplay_dialog.h
	nuvie/menus/input_dialog.cpp nuvie/menus/input_dialog.h
	nuvie/menus/video_dialog.cpp nuvie/menus/video_dialog.h
	nuvie/misc/actor_list.h
	nuvie/misc/call_back.h
	nuvie/misc/iavl_tree.cpp nuvie/misc/iavl_tree.h
	nuvie/misc/map_entity.h
	nuvie/misc/sdl_compat.cpp nuvie/misc/sdl_compat.h
	nuvie/misc/u6_line_walker.cpp nuvie/misc/u6_line_walker.h
	nuvie/misc/u6_list.cpp
	nuvie/misc/u6_llist.h
	nuvie/misc/u6_misc.cpp nuvie/misc/u6_misc.h
	nuvie/pathfinder/actor_path_finder.cpp nuvie/pathfinder/actor_path_finder.h
	nuvie/pathfinder/astar_path.cpp nuvie/pathfinder/astar_path.h
	nuvie/pathfinder/combat_path_finder.cpp nuvie/pathfinder/combat_path_finder.h
	nuvie/pathfinder/dir_finder.cpp nuvie/pathfinder/dir_finder.h
	nuvie/pathfinder/party_path_finder.cpp nuvie/pathfinder/party_path_finder.h
	nuvie/pathfinder/path.cpp nuvie/pathfinder/path.h
	nuvie/pathfinder/path_finder.cpp nuvie/pathfinder/path_finder.h
	nuvie/pathfinder/sched_path_finder.cpp nuvie/pathfinder/sched_path_finder.h
	nuvie/pathfinder/seek_path.cpp nuvie/pathfinder/seek_path.h
	nuvie/pathfinder/u6_astar_path.cpp nuvie/pathfinder/u6_astar_path.h
	nuvie/portraits/portrait.cpp nuvie/portraits/portrait.h
	nuvie/portraits/portrait_md.cpp nuvie/portraits/portrait_md.h
	nuvie/portraits/portrait_se.cpp nuvie/portraits/portrait_se.h
	nuvie/portraits/portrait_u6.cpp nuvie/portraits/portrait_u6.h
	nuvie/save/obj_list.h
	nuvie/save/save_game.cpp nuvie/save/save_game.h
	nuvie/screen/dither.cpp nuvie/screen/dither.h
	nuvie/screen/game_palette.cpp nuvie/screen/game_palette.h
	nuvie/screen/scale.cpp nuvie/screen/scale.h
	nuvie/screen/screen.cpp nuvie/screen/screen.h
	nuvie/screen/surface.cpp nuvie/screen/surface.h
	nuvie/script/script.cpp nuvie/script/script.h
	nuvie/script/script_actor.cpp nuvie/script/script_actor.h
	nuvie/script/script_cutscene.cpp nuvie/script/script_cutscene.h
	nuvie/sound/adplug/adplug_player.cpp nuvie/sound/adplug/adplug_player.h
	nuvie/sound/adplug/emu_opl.cpp nuvie/sound/adplug/emu_opl.h
	nuvie/sound/adplug/fm_opl.cpp nuvie/sound/adplug/fm_opl.h
	nuvie/sound/adplug/mid.cpp nuvie/sound/adplug/mid.h
	nuvie/sound/adplug/opl.h
	nuvie/sound/adplug/opl_class.cpp nuvie/sound/adplug/opl_class.h
	nuvie/sound/adplug/silent_opl.h
	nuvie/sound/adplug/u6m.cpp nuvie/sound/adplug/u6m.h
	nuvie/sound/decoder/adlib_sfx_stream.cpp nuvie/sound/decoder/adlib_sfx_stream.h
	nuvie/sound/decoder/fm_towns_decoder_stream.cpp nuvie/sound/decoder/fm_towns_decoder_stream.h
	nuvie/sound/decoder/pc_speaker.cpp nuvie/sound/decoder/pc_speaker.h
	nuvie/sound/decoder/pc_speaker_stream.cpp nuvie/sound/decoder/pc_speaker_stream.h
	nuvie/sound/decoder/random_collection_audio_stream.cpp nuvie/sound/decoder/random_collection_audio_stream.h
	nuvie/sound/decoder/u6_adplug_decoder_stream.cpp nuvie/sound/decoder/u6_adplug_decoder_stream.h
	nuvie/sound/adlib_sfx_manager.cpp nuvie/sound/adlib_sfx_manager.h
	nuvie/sound/custom_sfx_manager.cpp nuvie/sound/custom_sfx_manager.h
	nuvie/sound/origin_fx_adib_driver.cpp nuvie/sound/origin_fx_adib_driver.h
	nuvie/sound/pc_speaker_sfx_manager.cpp nuvie/sound/pc_speaker_sfx_manager.h
	nuvie/sound/sfx.h
	nuvie/sound/sfx_manager.h
	nuvie/sound/song.cpp nuvie/sound/song.h
	nuvie/sound/song_adplug.cpp nuvie/sound/song_adplug.h
	nuvie/sound/sound.h
	nuvie/sound/sound_manager.cpp nuvie/sound/sound_manager.h
	nuvie/sound/towns_sfx_manager.cpp nuvie/sound/towns_sfx_manager.h
	nuvie/usecode/u6_object_types.h
	nuvie/usecode/u6_usecode.cpp nuvie/usecode/u6_usecode.h
	nuvie/usecode/usecode.cpp nuvie/usecode/usecode.h
	nuvie/views/actor_view.cpp nuvie/views/actor_view.h
	nuvie/views/container_view_gump.cpp nuvie/views/container_view_gump.h
	nuvie/views/container_widget.cpp nuvie/views/container_widget.h
	nuvie/views/container_widget_gump.cpp nuvie/views/container_widget_gump.h
	nuvie/views/doll_view_gump.cpp nuvie/views/doll_view_gump.h
	nuvie/views/doll_widget.cpp nuvie/views/doll_widget.h
	nuvie/views/draggable_view.cpp nuvie/views/draggable_view.h
	nuvie/views/inventory_font.h
	nuvie/views/inventory_message.h
	nuvie/views/inventory_view.cpp nuvie/views/inventory_view.h
	nuvie/views/inventory_widget.cpp nuvie/views/inventory_widget.h
	nuvie/views/map_editor_view.cpp nuvie/views/map_editor_view.h
	nuvie/views/md_sky_strip_widget.cpp nuvie/views/md_sky_strip_widget.h
	nuvie/views/party_view.cpp nuvie/views/party_view.h
	nuvie/views/portrait_view.cpp nuvie/views/portrait_view.h
	nuvie/views/portrait_view_gump.cpp nuvie/views/portrait_view_gump.h
	nuvie/views/scroll_view_gump.cpp nuvie/views/scroll_view_gump.h
	nuvie/views/scroll_widget_gump.cpp nuvie/views/scroll_widget_gump.h
	nuvie/views/sign_view_gump.cpp nuvie/views/sign_view_gump.h
	nuvie/views/spell_view.cpp nuvie/views/spell_view.h
	nuvie/views/spell_view_gump.cpp nuvie/views/spell_view_gump.h
	nuvie/views/sun_moon_ribbon.cpp nuvie/views/sun_moon_ribbon.h
	nuvie/views/sun_moon_strip_widget.cpp nuvie/views/sun_moon_strip_widget.h
	nuvie/views/vew.cpp
	nuvie/views/view.h
	nuvie/views/view_manager.cpp nuvie/views/view_manager.h
	nuvie/meta_engine.cpp nuvie/meta_engine.h
	nuvie/nuvie.cpp nuvie/nuvie.h
	shared/actions/action.cpp shared/actions/action.h
	shared/actions/huh.cpp shared/actions/huh.h
	shared/actions/pass.cpp shared/actions/pass.h
	shared/conf/conf_serializer.h
	shared/conf/xml_node.cpp shared/conf/xml_node.h
	shared/conf/xml_tree.cpp shared/conf/xml_tree.h
	shared/core/base_object.cpp shared/core/base_object.h
	shared/core/character.cpp shared/core/character.h
	shared/core/file.cpp shared/core/file.h
	shared/core/game_state.h
	shared/core/lzw.cpp shared/core/lzw.h
	shared/core/map.cpp shared/core/map.h
	shared/core/message_target.cpp shared/core/message_target.h
	shared/core/mouse_cursor.cpp shared/core/mouse_cursor.h
	shared/core/named_item.cpp shared/core/named_item.h
	shared/core/party.cpp shared/core/party.h
	shared/core/rect.h
	shared/core/str.cpp shared/core/str.h
	shared/core/tree_item.cpp shared/core/tree_item.h
	shared/core/utils.cpp shared/core/utils.h
	shared/core/widgets.cpp shared/core/widgets.h
	shared/early/font_resources.cpp shared/early/font_resources.h
	shared/early/game.cpp shared/early/game.h
	shared/early/game_base.cpp shared/early/game_base.h
	shared/early/ultima_early.cpp shared/early/ultima_early.h
	shared/engine/data_archive.cpp shared/engine/data_archive.h
	shared/engine/debugger.cpp shared/engine/debugger.h
	shared/engine/events.cpp shared/engine/events.h
	shared/engine/input_handler.cpp shared/engine/input_handler.h
	shared/engine/input_translator.cpp shared/engine/input_translator.h
	shared/engine/messages.cpp shared/engine/messages.h
	shared/engine/resources.cpp shared/engine/resources.h
	shared/engine/ultima.cpp shared/engine/ultima.h
	shared/gfx/bitmap.cpp shared/gfx/bitmap.h
	shared/gfx/character_input.cpp shared/gfx/character_input.h
	shared/gfx/dungeon_surface.cpp shared/gfx/dungeon_surface.h
	shared/gfx/font.cpp shared/gfx/font.h
	shared/gfx/info.cpp shared/gfx/info.h
	shared/gfx/popup.cpp shared/gfx/popup.h
	shared/gfx/screen.cpp shared/gfx/screen.h
	shared/gfx/sprites.cpp shared/gfx/sprites.h
	shared/gfx/text_cursor.cpp shared/gfx/text_cursor.h
	shared/gfx/text_input.cpp shared/gfx/text_input.h
	shared/gfx/viewport_dungeon.cpp shared/gfx/viewport_dungeon.h
	shared/gfx/viewport_map.cpp shared/gfx/viewport_map.h
	shared/gfx/visual_container.cpp shared/gfx/visual_container.h
	shared/gfx/visual_item.cpp shared/gfx/visual_item.h
	shared/gfx/visual_surface.cpp shared/gfx/visual_surface.h
	shared/maps/creature.cpp shared/maps/creature.h
	shared/maps/dungeon_creature.h
	shared/maps/dungeon_widget.h
	shared/maps/map.cpp shared/maps/map.h
	shared/maps/map_base.cpp shared/maps/map_base.h
	shared/maps/map_tile.cpp shared/maps/map_tile.h
	shared/maps/map_widget.cpp shared/maps/map_widget.h
	shared/std/containers.h
	shared/std/string.cpp shared/std/string.h

	ultima0/core/resources.cpp ultima0/core/resources.h
	ultima0/game.cpp ultima0/game.h
	ultima0/resources.cpp ultima0/resources.h
	ultima1/actions/action.cpp ultima1/actions/action.h
	ultima1/actions/attack.cpp ultima1/actions/attack.h
	ultima1/actions/cast.h
	ultima1/actions/map_action.h
	ultima1/actions/move.cpp ultima1/actions/move.h
	ultima1/actions/quit.cpp ultima1/actions/quit.h
	ultima1/actions/ready.cpp ultima1/actions/ready.h
	ultima1/actions/stats.cpp ultima1/actions/stats.h
	ultima1/core/debugger.cpp ultima1/core/debugger.h
	ultima1/core/game_state.h
	ultima1/core/messages.h
	ultima1/core/party.cpp ultima1/core/party.h
	ultima1/core/quests.cpp ultima1/core/quests.h
	ultima1/core/resources.cpp ultima1/core/resources.h
	ultima1/core/widget_player.h
	ultima1/maps/map.cpp ultima1/maps/map.h
	ultima1/maps/map_base.cpp ultima1/maps/map_base.h
	ultima1/maps/map_city_castle.cpp ultima1/maps/map_city_castle.h
	ultima1/maps/map_dungeon.cpp ultima1/maps/map_dungeon.h
	ultima1/maps/map_overworld.cpp ultima1/maps/map_overworld.h
	ultima1/maps/map_tile.cpp ultima1/maps/map_tile.h
	ultima1/spells/blink.cpp ultima1/spells/blink.h
	ultima1/spells/create.cpp ultima1/spells/create.h
	ultima1/spells/destroy.cpp ultima1/spells/destroy.h
	ultima1/spells/kill_magic_missile.cpp ultima1/spells/kill_magic_missile.h
	ultima1/spells/ladder_down.cpp ultima1/spells/ladder_down.h
	ultima1/spells/ladder_up.cpp ultima1/spells/ladder_up.h
	ultima1/spells/open_unlock.cpp ultima1/spells/open_unlock.h
	ultima1/spells/prayer.cpp ultima1/spells/prayer.h
	ultima1/spells/spell.cpp ultima1/spells/spell.h
	ultima1/spells/steal.cpp ultima1/spells/steal.h
	ultima1/u1dialogs/armoury.cpp ultima1/u1dialogs/armoury.h
	ultima1/u1dialogs/buy_sell_dialog.cpp ultima1/u1dialogs/buy_sell_dialog.h
	ultima1/u1dialogs/combat.cpp ultima1/u1dialogs/combat.h
	ultima1/u1dialogs/dialog.cpp ultima1/u1dialogs/dialog.h
	ultima1/u1dialogs/drop.cpp ultima1/u1dialogs/drop.h
	ultima1/u1dialogs/full_screen_dialog.cpp ultima1/u1dialogs/full_screen_dialog.h
	ultima1/u1dialogs/grocery.cpp ultima1/u1dialogs/grocery.h
	ultima1/u1dialogs/king.cpp ultima1/u1dialogs/king.h
	ultima1/u1dialogs/magic.cpp ultima1/u1dialogs/magic.h
	ultima1/u1dialogs/ready.cpp ultima1/u1dialogs/ready.h
	ultima1/u1dialogs/stats.cpp ultima1/u1dialogs/stats.h
	ultima1/u1dialogs/tavern.cpp ultima1/u1dialogs/tavern.h
	ultima1/u1dialogs/transports.cpp ultima1/u1dialogs/transports.h
	ultima1/u1dialogs/weaponry.cpp ultima1/u1dialogs/weaponry.h
	ultima1/u1gfx/drawing_support.cpp ultima1/u1gfx/drawing_support.h
	ultima1/u1gfx/info.cpp ultima1/u1gfx/info.h
	ultima1/u1gfx/sprites.cpp ultima1/u1gfx/sprites.h
	ultima1/u1gfx/status.cpp ultima1/u1gfx/status.h
	ultima1/u1gfx/text_cursor.cpp ultima1/u1gfx/text_cursor.h
	ultima1/u1gfx/view_char_gen.cpp ultima1/u1gfx/view_char_gen.h
	ultima1/u1gfx/view_game.cpp ultima1/u1gfx/view_game.h
	ultima1/u1gfx/view_title.cpp ultima1/u1gfx/view_title.h
	ultima1/u1gfx/viewport_dungeon.cpp ultima1/u1gfx/viewport_dungeon.h
	ultima1/u1gfx/viewport_map.cpp ultima1/u1gfx/viewport_map.h
	ultima1/u6gfx/game_view.cpp ultima1/u6gfx/game_view.h
	ultima1/widgets/attack_effect.cpp ultima1/widgets/attack_effect.h
	ultima1/widgets/bard.cpp ultima1/widgets/bard.h
	ultima1/widgets/dungeon_chest.cpp ultima1/widgets/dungeon_chest.h
	ultima1/widgets/dungeon_coffin.cpp ultima1/widgets/dungeon_coffin.h
	ultima1/widgets/dungeon_item.cpp ultima1/widgets/dungeon_item.h
	ultima1/widgets/dungeon_monster.cpp ultima1/widgets/dungeon_monster.h
	ultima1/widgets/dungeon_player.cpp ultima1/widgets/dungeon_player.h
	ultima1/widgets/dungeon_widget.cpp ultima1/widgets/dungeon_widget.h
	ultima1/widgets/guard.cpp ultima1/widgets/guard.h
	ultima1/widgets/king.cpp ultima1/widgets/king.h
	ultima1/widgets/merchant.cpp ultima1/widgets/merchant.h
	ultima1/widgets/merchant_armor.h
	ultima1/widgets/merchant_armour.cpp ultima1/widgets/merchant_armour.h
	ultima1/widgets/merchant_grocer.cpp ultima1/widgets/merchant_grocer.h
	ultima1/widgets/merchant_magic.cpp ultima1/widgets/merchant_magic.h
	ultima1/widgets/merchant_tavern.cpp ultima1/widgets/merchant_tavern.h
	ultima1/widgets/merchant_transport.cpp ultima1/widgets/merchant_transport.h
	ultima1/widgets/merchant_weapons.cpp ultima1/widgets/merchant_weapons.h
	ultima1/widgets/overworld_monster.cpp ultima1/widgets/overworld_monster.h
	ultima1/widgets/overworld_widget.cpp ultima1/widgets/overworld_widget.h
	ultima1/widgets/person.cpp ultima1/widgets/person.h
	ultima1/widgets/princess.cpp ultima1/widgets/princess.h
	ultima1/widgets/transport.cpp ultima1/widgets/transport.h
	ultima1/widgets/urban_player.cpp ultima1/widgets/urban_player.h
	ultima1/widgets/urban_widget.cpp ultima1/widgets/urban_widget.h
	ultima1/widgets/wench.cpp ultima1/widgets/wench.h
	ultima1/game.cpp ultima1/game.h
	ultima4/controllers/alpha_action_controller.cpp ultima4/controllers/alpha_action_controller.h
	ultima4/controllers/camp_controller.cpp ultima4/controllers/camp_controller.h
	ultima4/controllers/combat_controller.cpp ultima4/controllers/combat_controller.h
	ultima4/controllers/controller.cpp ultima4/controllers/controller.h
	ultima4/controllers/game_controller.cpp ultima4/controllers/game_controller.h
	ultima4/controllers/inn_controller.cpp ultima4/controllers/inn_controller.h
	ultima4/controllers/intro_controller.cpp ultima4/controllers/intro_controller.h
	ultima4/controllers/key_handler_controller.cpp ultima4/controllers/key_handler_controller.h
	ultima4/controllers/menu_controller.cpp ultima4/controllers/menu_controller.h
	ultima4/controllers/read_choice_controller.cpp ultima4/controllers/read_choice_controller.h
	ultima4/controllers/read_dir_controller.cpp ultima4/controllers/read_dir_controller.h
	ultima4/controllers/read_int_controller.cpp ultima4/controllers/read_int_controller.h
	ultima4/controllers/read_player_controller.cpp ultima4/controllers/read_player_controller.h
	ultima4/controllers/read_string_controller.cpp ultima4/controllers/read_string_controller.h
	ultima4/controllers/reagents_menu_controller.cpp ultima4/controllers/reagents_menu_controller.h
	ultima4/controllers/wait_controller.cpp ultima4/controllers/wait_controller.h
	ultima4/controllers/ztats_controller.cpp ultima4/controllers/ztats_controller.h
	ultima4/conversation/conversation.cpp ultima4/conversation/conversation.h
	ultima4/conversation/dialogueloader.cpp ultima4/conversation/dialogueloader.h
	ultima4/conversation/dialogueloader_hw.cpp ultima4/conversation/dialogueloader_hw.h
	ultima4/conversation/dialogueloader_lb.cpp ultima4/conversation/dialogueloader_lb.h
	ultima4/conversation/dialogueloader_tlk.cpp ultima4/conversation/dialogueloader_tlk.h
	ultima4/core/lzw/hash.cpp ultima4/core/lzw/hash.h
	ultima4/core/lzw/lzw.cpp ultima4/core/lzw/lzw.h
	ultima4/core/lzw/u4decode.cpp ultima4/core/lzw/u4decode.h
	ultima4/core/config.cpp ultima4/core/config.h
	ultima4/core/coords.h
	ultima4/core/debugger.cpp ultima4/core/debugger.h
	ultima4/core/debugger_actions.cpp ultima4/core/debugger_actions.h
	ultima4/core/observable.h
	ultima4/core/observer.h
	ultima4/core/settings.cpp ultima4/core/settings.h
	ultima4/core/types.h
	ultima4/core/utils.cpp ultima4/core/utils.h
	ultima4/events/event_handler.cpp ultima4/events/event_handler.h
	ultima4/events/timed_event_mgr.cpp ultima4/events/timed_event_mgr.h
	ultima4/filesys/rle.cpp ultima4/filesys/rle.h
	ultima4/filesys/savegame.cpp ultima4/filesys/savegame.h
	ultima4/filesys/u4file.cpp ultima4/filesys/u4file.h
	ultima4/game/armor.cpp ultima4/game/armor.h
	ultima4/game/aura.cpp ultima4/game/aura.h
	ultima4/game/codex.cpp ultima4/game/codex.h
	ultima4/game/context.cpp ultima4/game/context.h
	ultima4/game/creature.cpp ultima4/game/creature.h
	ultima4/game/death.cpp ultima4/game/death.h
	ultima4/game/game.cpp ultima4/game/game.h
	ultima4/game/item.cpp ultima4/game/item.h
	ultima4/game/moongate.cpp ultima4/game/moongate.h
	ultima4/game/names.cpp ultima4/game/names.h
	ultima4/game/object.cpp ultima4/game/object.h
	ultima4/game/person.cpp ultima4/game/person.h
	ultima4/game/player.cpp ultima4/game/player.h
	ultima4/game/portal.cpp ultima4/game/portal.h
	ultima4/game/script.cpp ultima4/game/script.h
	ultima4/game/spell.cpp ultima4/game/spell.h
	ultima4/game/weapon.cpp ultima4/game/weapon.h
	ultima4/gfx/image.cpp ultima4/gfx/image.h
	ultima4/gfx/imageloader.cpp ultima4/gfx/imageloader.h
	ultima4/gfx/imageloader_fmtowns.cpp ultima4/gfx/imageloader_fmtowns.h
	ultima4/gfx/imageloader_png.cpp ultima4/gfx/imageloader_png.h
	ultima4/gfx/imageloader_u4.cpp ultima4/gfx/imageloader_u4.h
	ultima4/gfx/imagemgr.cpp ultima4/gfx/imagemgr.h
	ultima4/gfx/scale.cpp ultima4/gfx/scale.h
	ultima4/gfx/screen.cpp ultima4/gfx/screen.h
	ultima4/gfx/textcolor.h
	ultima4/map/annotation.cpp ultima4/map/annotation.h
	ultima4/map/area.h
	ultima4/map/city.cpp ultima4/map/city.h
	ultima4/map/direction.cpp ultima4/map/direction.h
	ultima4/map/dungeon.cpp ultima4/map/dungeon.h
	ultima4/map/location.cpp ultima4/map/location.h
	ultima4/map/map.cpp ultima4/map/map.h
	ultima4/map/map_tile.cpp ultima4/map/map_tile.h
	ultima4/map/maploader.cpp ultima4/map/maploader.h
	ultima4/map/mapmgr.cpp ultima4/map/mapmgr.h
	ultima4/map/movement.cpp ultima4/map/movement.h
	ultima4/map/shrine.cpp ultima4/map/shrine.h
	ultima4/map/tile.cpp ultima4/map/tile.h
	ultima4/map/tileanim.cpp ultima4/map/tileanim.h
	ultima4/map/tilemap.cpp ultima4/map/tilemap.h
	ultima4/map/tileset.cpp ultima4/map/tileset.h
	ultima4/map/xml_map.h
	ultima4/sound/music.cpp ultima4/sound/music.h
	ultima4/sound/sound.cpp ultima4/sound/sound.h
	ultima4/views/dungeonview.cpp ultima4/views/dungeonview.h
	ultima4/views/imageview.cpp ultima4/views/imageview.h
	ultima4/views/menu.cpp ultima4/views/menu.h
	ultima4/views/menuitem.cpp ultima4/views/menuitem.h
	ultima4/views/stats.cpp ultima4/views/stats.h
	ultima4/views/textview.cpp ultima4/views/textview.h
	ultima4/views/tileview.cpp ultima4/views/tileview.h
	ultima4/views/view.cpp ultima4/views/view.h
	ultima4/meta_engine.cpp ultima4/meta_engine.h
	ultima4/ultima4.cpp ultima4/ultima4.h
	ultima8/audio/audio_channel.cpp ultima8/audio/audio_channel.h
	ultima8/audio/audio_mixer.cpp ultima8/audio/audio_mixer.h
	ultima8/audio/audio_process.cpp ultima8/audio/audio_process.h
	ultima8/audio/audio_sample.cpp ultima8/audio/audio_sample.h
	ultima8/audio/cru_music_process.cpp ultima8/audio/cru_music_process.h
	ultima8/audio/midi_player.cpp ultima8/audio/midi_player.h
	ultima8/audio/music_flex.cpp ultima8/audio/music_flex.h
	ultima8/audio/music_process.cpp ultima8/audio/music_process.h
	ultima8/audio/raw_audio_sample.cpp ultima8/audio/raw_audio_sample.h
	ultima8/audio/sonarc_audio_sample.cpp ultima8/audio/sonarc_audio_sample.h
	ultima8/audio/sound_flex.cpp ultima8/audio/sound_flex.h
	ultima8/audio/speech_flex.cpp ultima8/audio/speech_flex.h
	ultima8/audio/u8_music_process.cpp ultima8/audio/u8_music_process.h
	ultima8/conf/config_file_manager.cpp ultima8/conf/config_file_manager.h
	ultima8/convert/crusader/convert_shape_crusader.cpp ultima8/convert/crusader/convert_shape_crusader.h
	ultima8/convert/crusader/convert_usecode_crusader.h
	ultima8/convert/crusader/convert_usecode_regret.h
	ultima8/convert/u8/convert_shape_u8.cpp ultima8/convert/u8/convert_shape_u8.h
	ultima8/convert/u8/convert_usecode_u8.h
	ultima8/convert/convert_shape.cpp ultima8/convert/convert_shape.h
	ultima8/convert/convert_usecode.h
	ultima8/filesys/archive.cpp ultima8/filesys/archive.h
	ultima8/filesys/archive_file.cpp ultima8/filesys/archive_file.h
	ultima8/filesys/file_system.cpp ultima8/filesys/file_system.h
	ultima8/filesys/flex_file.cpp ultima8/filesys/flex_file.h
	ultima8/filesys/named_archive_file.h
	ultima8/filesys/raw_archive.cpp ultima8/filesys/raw_archive.h
	ultima8/filesys/savegame.cpp ultima8/filesys/savegame.h
	ultima8/filesys/u8_save_file.cpp ultima8/filesys/u8_save_file.h
	ultima8/games/cru_game.cpp ultima8/games/cru_game.h
	ultima8/games/game.cpp ultima8/games/game.h
	ultima8/games/game_data.cpp ultima8/games/game_data.h
	ultima8/games/game_info.cpp ultima8/games/game_info.h
	ultima8/games/start_crusader_process.cpp ultima8/games/start_crusader_process.h
	ultima8/games/start_u8_process.cpp ultima8/games/start_u8_process.h
	ultima8/games/treasure_loader.cpp ultima8/games/treasure_loader.h
	ultima8/games/u8_game.cpp ultima8/games/u8_game.h
	ultima8/graphics/fonts/font.cpp ultima8/graphics/fonts/font.h
	ultima8/graphics/fonts/font_manager.cpp ultima8/graphics/fonts/font_manager.h
	ultima8/graphics/fonts/font_shape_archive.cpp ultima8/graphics/fonts/font_shape_archive.h
	ultima8/graphics/fonts/jp_font.cpp ultima8/graphics/fonts/jp_font.h
	ultima8/graphics/fonts/jp_rendered_text.cpp ultima8/graphics/fonts/jp_rendered_text.h
	ultima8/graphics/fonts/rendered_text.cpp ultima8/graphics/fonts/rendered_text.h
	ultima8/graphics/fonts/shape_font.cpp ultima8/graphics/fonts/shape_font.h
	ultima8/graphics/fonts/shape_rendered_text.cpp ultima8/graphics/fonts/shape_rendered_text.h
	ultima8/graphics/fonts/tt_font.cpp ultima8/graphics/fonts/tt_font.h
	ultima8/graphics/fonts/ttf_rendered_text.cpp ultima8/graphics/fonts/ttf_rendered_text.h
	ultima8/graphics/anim_dat.cpp ultima8/graphics/anim_dat.h
	ultima8/graphics/avi_player.cpp ultima8/graphics/avi_player.h
	ultima8/graphics/base_soft_render_surface.cpp ultima8/graphics/base_soft_render_surface.h
	ultima8/graphics/cycle_process.cpp ultima8/graphics/cycle_process.h
	ultima8/graphics/fade_to_modal_process.cpp ultima8/graphics/fade_to_modal_process.h
	ultima8/graphics/frame_id.cpp ultima8/graphics/frame_id.h
	ultima8/graphics/gump_shape_archive.cpp ultima8/graphics/gump_shape_archive.h
	ultima8/graphics/inverter_process.cpp ultima8/graphics/inverter_process.h
	ultima8/graphics/main_shape_archive.cpp ultima8/graphics/main_shape_archive.h
	ultima8/graphics/movie_player.h
	ultima8/graphics/palette.cpp ultima8/graphics/palette.h
	ultima8/graphics/palette_fader_process.cpp ultima8/graphics/palette_fader_process.h
	ultima8/graphics/palette_manager.cpp ultima8/graphics/palette_manager.h
	ultima8/graphics/raw_shape_frame.cpp ultima8/graphics/raw_shape_frame.h
	ultima8/graphics/render_surface.cpp ultima8/graphics/render_surface.h
	ultima8/graphics/shape.cpp ultima8/graphics/shape.h
	ultima8/graphics/shape_archive.cpp ultima8/graphics/shape_archive.h
	ultima8/graphics/shape_frame.cpp ultima8/graphics/shape_frame.h
	ultima8/graphics/shape_info.cpp ultima8/graphics/shape_info.h
	ultima8/graphics/skf_player.cpp ultima8/graphics/skf_player.h
	ultima8/graphics/soft_render_surface.cpp ultima8/graphics/soft_render_surface.h
	ultima8/graphics/texture.h
	ultima8/graphics/type_flags.cpp ultima8/graphics/type_flags.h
	ultima8/graphics/wpn_ovlay_dat.cpp ultima8/graphics/wpn_ovlay_dat.h
	ultima8/graphics/xform_blend.cpp ultima8/graphics/xform_blend.h
	ultima8/gumps/widgets/button_widget.cpp ultima8/gumps/widgets/button_widget.h
	ultima8/gumps/widgets/edit_widget.cpp ultima8/gumps/widgets/edit_widget.h
	ultima8/gumps/widgets/sliding_widget.cpp ultima8/gumps/widgets/sliding_widget.h
	ultima8/gumps/widgets/text_widget.cpp ultima8/gumps/widgets/text_widget.h
	ultima8/gumps/ask_gump.cpp ultima8/gumps/ask_gump.h
	ultima8/gumps/bark_gump.cpp ultima8/gumps/bark_gump.h
	ultima8/gumps/book_gump.cpp ultima8/gumps/book_gump.h
	ultima8/gumps/computer_gump.cpp ultima8/gumps/computer_gump.h
	ultima8/gumps/container_gump.cpp ultima8/gumps/container_gump.h
	ultima8/gumps/credits_gump.cpp ultima8/gumps/credits_gump.h
	ultima8/gumps/cru_ammo_gump.cpp ultima8/gumps/cru_ammo_gump.h
	ultima8/gumps/cru_credits_gump.cpp ultima8/gumps/cru_credits_gump.h
	ultima8/gumps/cru_demo_gump.cpp ultima8/gumps/cru_demo_gump.h
	ultima8/gumps/cru_energy_gump.cpp ultima8/gumps/cru_energy_gump.h
	ultima8/gumps/cru_health_gump.cpp ultima8/gumps/cru_health_gump.h
	ultima8/gumps/cru_inventory_gump.cpp ultima8/gumps/cru_inventory_gump.h
	ultima8/gumps/cru_menu_gump.cpp ultima8/gumps/cru_menu_gump.h
	ultima8/gumps/cru_pickup_area_gump.cpp ultima8/gumps/cru_pickup_area_gump.h
	ultima8/gumps/cru_pickup_gump.cpp ultima8/gumps/cru_pickup_gump.h
	ultima8/gumps/cru_stat_gump.cpp ultima8/gumps/cru_stat_gump.h
	ultima8/gumps/cru_status_gump.cpp ultima8/gumps/cru_status_gump.h
	ultima8/gumps/cru_weapon_gump.cpp ultima8/gumps/cru_weapon_gump.h
	ultima8/gumps/desktop_gump.cpp ultima8/gumps/desktop_gump.h
	ultima8/gumps/difficulty_gump.cpp ultima8/gumps/difficulty_gump.h
	ultima8/gumps/fast_area_vis_gump.cpp ultima8/gumps/fast_area_vis_gump.h
	ultima8/gumps/game_map_gump.cpp ultima8/gumps/game_map_gump.h
	ultima8/gumps/gump.cpp ultima8/gumps/gump.h
	ultima8/gumps/gump_notify_process.cpp ultima8/gumps/gump_notify_process.h
	ultima8/gumps/inverter_gump.cpp ultima8/gumps/inverter_gump.h
	ultima8/gumps/item_relative_gump.cpp ultima8/gumps/item_relative_gump.h
	ultima8/gumps/keypad_gump.cpp ultima8/gumps/keypad_gump.h
	ultima8/gumps/main_menu_process.cpp ultima8/gumps/main_menu_process.h
	ultima8/gumps/menu_gump.cpp ultima8/gumps/menu_gump.h
	ultima8/gumps/message_box_gump.cpp ultima8/gumps/message_box_gump.h
	ultima8/gumps/mini_stats_gump.cpp ultima8/gumps/mini_stats_gump.h
	ultima8/gumps/minimap_gump.cpp ultima8/gumps/minimap_gump.h
	ultima8/gumps/modal_gump.cpp ultima8/gumps/modal_gump.h
	ultima8/gumps/movie_gump.cpp ultima8/gumps/movie_gump.h
	ultima8/gumps/paged_gump.cpp ultima8/gumps/paged_gump.h
	ultima8/gumps/paperdoll_gump.cpp ultima8/gumps/paperdoll_gump.h
	ultima8/gumps/quit_gump.cpp ultima8/gumps/quit_gump.h
	ultima8/gumps/readable_gump.cpp ultima8/gumps/readable_gump.h
	ultima8/gumps/resizable_gump.cpp ultima8/gumps/resizable_gump.h
	ultima8/gumps/scroll_gump.cpp ultima8/gumps/scroll_gump.h
	ultima8/gumps/shape_viewer_gump.cpp ultima8/gumps/shape_viewer_gump.h
	ultima8/gumps/slider_gump.cpp ultima8/gumps/slider_gump.h
	ultima8/gumps/target_gump.cpp ultima8/gumps/target_gump.h
	ultima8/gumps/translucent_gump.cpp ultima8/gumps/translucent_gump.h
	ultima8/gumps/u8_save_gump.cpp ultima8/gumps/u8_save_gump.h
	ultima8/gumps/weasel_dat.cpp ultima8/gumps/weasel_dat.h
	ultima8/gumps/weasel_gump.cpp ultima8/gumps/weasel_gump.h
	ultima8/kernel/delay_process.cpp ultima8/kernel/delay_process.h
	ultima8/kernel/kernel.cpp ultima8/kernel/kernel.h
	ultima8/kernel/mouse.cpp ultima8/kernel/mouse.h
	ultima8/kernel/object.cpp ultima8/kernel/object.h
	ultima8/kernel/object_manager.cpp ultima8/kernel/object_manager.h
	ultima8/kernel/process.cpp ultima8/kernel/process.h
	ultima8/misc/box.h
	ultima8/misc/classtype.h
	ultima8/misc/common_types.h
	ultima8/misc/debugger.cpp ultima8/misc/debugger.h
	ultima8/misc/direction.h
	ultima8/misc/direction_util.h
	ultima8/misc/encoding.cpp ultima8/misc/encoding.h
	ultima8/misc/id_man.cpp ultima8/misc/id_man.h
	ultima8/misc/istring.h
	ultima8/misc/pent_include.h
	ultima8/misc/point3.h
	ultima8/misc/rect.h
	ultima8/misc/stream_util.h
	ultima8/misc/util.cpp ultima8/misc/util.h
	ultima8/usecode/bit_set.cpp ultima8/usecode/bit_set.h
	ultima8/usecode/byte_set.cpp ultima8/usecode/byte_set.h
	ultima8/usecode/global_storage.h
	ultima8/usecode/intrinsics.h
	ultima8/usecode/regret_intrinsics.h
	ultima8/usecode/remorse_intrinsics.h
	ultima8/usecode/u8_intrinsics.h
	ultima8/usecode/uc_list.cpp ultima8/usecode/uc_list.h
	ultima8/usecode/uc_machine.cpp ultima8/usecode/uc_machine.h
	ultima8/usecode/uc_process.cpp ultima8/usecode/uc_process.h
	ultima8/usecode/uc_stack.cpp ultima8/usecode/uc_stack.h
	ultima8/usecode/usecode.cpp ultima8/usecode/usecode.h
	ultima8/usecode/usecode_flex.cpp ultima8/usecode/usecode_flex.h
	ultima8/world/actors/actor.cpp ultima8/world/actors/actor.h
	ultima8/world/actors/actor_anim.h
	ultima8/world/actors/actor_anim_process.cpp ultima8/world/actors/actor_anim_process.h
	ultima8/world/actors/actor_bark_notify_process.cpp ultima8/world/actors/actor_bark_notify_process.h
	ultima8/world/actors/ambush_process.cpp ultima8/world/actors/ambush_process.h
	ultima8/world/actors/anim_action.cpp ultima8/world/actors/anim_action.h
	ultima8/world/actors/animation.cpp ultima8/world/actors/animation.h
	ultima8/world/actors/animation_tracker.cpp ultima8/world/actors/animation_tracker.h
	ultima8/world/actors/attack_process.cpp ultima8/world/actors/attack_process.h
	ultima8/world/actors/auto_firer_process.cpp ultima8/world/actors/auto_firer_process.h
	ultima8/world/actors/avatar_death_process.cpp ultima8/world/actors/avatar_death_process.h
	ultima8/world/actors/avatar_gravity_process.cpp ultima8/world/actors/avatar_gravity_process.h
	ultima8/world/actors/avatar_mover_process.cpp ultima8/world/actors/avatar_mover_process.h
	ultima8/world/actors/battery_charger_process.cpp ultima8/world/actors/battery_charger_process.h
	ultima8/world/actors/clear_feign_death_process.cpp ultima8/world/actors/clear_feign_death_process.h
	ultima8/world/actors/combat_dat.cpp ultima8/world/actors/combat_dat.h
	ultima8/world/actors/combat_process.cpp ultima8/world/actors/combat_process.h
	ultima8/world/actors/cru_avatar_mover_process.cpp ultima8/world/actors/cru_avatar_mover_process.h
	ultima8/world/actors/cru_healer_process.cpp ultima8/world/actors/cru_healer_process.h
	ultima8/world/actors/cru_pathfinder_process.cpp ultima8/world/actors/cru_pathfinder_process.h
	ultima8/world/actors/grant_peace_process.cpp ultima8/world/actors/grant_peace_process.h
	ultima8/world/actors/guard_process.cpp ultima8/world/actors/guard_process.h
	ultima8/world/actors/heal_process.cpp ultima8/world/actors/heal_process.h
	ultima8/world/actors/loiter_process.cpp ultima8/world/actors/loiter_process.h
	ultima8/world/actors/main_actor.cpp ultima8/world/actors/main_actor.h
	ultima8/world/actors/monster_info.h
	ultima8/world/actors/npc_dat.cpp ultima8/world/actors/npc_dat.h
	ultima8/world/actors/pace_process.cpp ultima8/world/actors/pace_process.h
	ultima8/world/actors/pathfinder.cpp ultima8/world/actors/pathfinder.h
	ultima8/world/actors/pathfinder_process.cpp ultima8/world/actors/pathfinder_process.h
	ultima8/world/actors/quick_avatar_mover_process.cpp ultima8/world/actors/quick_avatar_mover_process.h
	ultima8/world/actors/resurrection_process.cpp ultima8/world/actors/resurrection_process.h
	ultima8/world/actors/rolling_thunder_process.cpp ultima8/world/actors/rolling_thunder_process.h
	ultima8/world/actors/scheduler_process.cpp ultima8/world/actors/scheduler_process.h
	ultima8/world/actors/surrender_process.cpp ultima8/world/actors/surrender_process.h
	ultima8/world/actors/targeted_anim_process.cpp ultima8/world/actors/targeted_anim_process.h
	ultima8/world/actors/teleport_to_egg_process.cpp ultima8/world/actors/teleport_to_egg_process.h
	ultima8/world/actors/treasure_info.h
	ultima8/world/actors/u8_avatar_mover_process.cpp ultima8/world/actors/u8_avatar_mover_process.h
	ultima8/world/actors/weapon_overlay.h
	ultima8/world/armour_info.h
	ultima8/world/bobo_boomer_process.cpp ultima8/world/bobo_boomer_process.h
	ultima8/world/camera_process.cpp ultima8/world/camera_process.h
	ultima8/world/container.cpp ultima8/world/container.h
	ultima8/world/coord_utils.h
	ultima8/world/create_item_process.cpp ultima8/world/create_item_process.h
	ultima8/world/crosshair_process.cpp ultima8/world/crosshair_process.h
	ultima8/world/current_map.cpp ultima8/world/current_map.h
	ultima8/world/damage_info.cpp ultima8/world/damage_info.h
	ultima8/world/destroy_item_process.cpp ultima8/world/destroy_item_process.h
	ultima8/world/egg.cpp ultima8/world/egg.h
	ultima8/world/egg_hatcher_process.cpp ultima8/world/egg_hatcher_process.h
	ultima8/world/fire_type.cpp ultima8/world/fire_type.h
	ultima8/world/fire_type_table.cpp ultima8/world/fire_type_table.h
	ultima8/world/fireball_process.cpp ultima8/world/fireball_process.h
	ultima8/world/get_object.cpp ultima8/world/get_object.h
	ultima8/world/glob_egg.cpp ultima8/world/glob_egg.h
	ultima8/world/gravity_process.cpp ultima8/world/gravity_process.h
	ultima8/world/item.cpp ultima8/world/item.h
	ultima8/world/item_factory.cpp ultima8/world/item_factory.h
	ultima8/world/item_selection_process.cpp ultima8/world/item_selection_process.h
	ultima8/world/item_sorter.cpp ultima8/world/item_sorter.h
	ultima8/world/loop_script.h
	ultima8/world/map.cpp ultima8/world/map.h
	ultima8/world/map_glob.cpp ultima8/world/map_glob.h
	ultima8/world/missile_tracker.cpp ultima8/world/missile_tracker.h
	ultima8/world/monster_egg.cpp ultima8/world/monster_egg.h
	ultima8/world/snap_process.cpp ultima8/world/snap_process.h
	ultima8/world/sort_item.h
	ultima8/world/split_item_process.cpp ultima8/world/split_item_process.h
	ultima8/world/sprite_process.cpp ultima8/world/sprite_process.h
	ultima8/world/super_sprite_process.cpp ultima8/world/super_sprite_process.h
	ultima8/world/target_reticle_process.cpp ultima8/world/target_reticle_process.h
	ultima8/world/teleport_egg.cpp ultima8/world/teleport_egg.h
	ultima8/world/weapon_info.h
	ultima8/world/world.cpp ultima8/world/world.h
	ultima8/world/world_point.h
	ultima8/meta_engine.cpp ultima8/meta_engine.h
	ultima8/ultima8.cpp ultima8/ultima8.h
	detection.h
	detection_tables.h
	metaengine.cpp metaengine.h
	module.mk
)
