add_engine(ags
	engine/ac/dynobj/all_dynamic_classes.h
	engine/ac/dynobj/all_script_classes.h
	engine/ac/dynobj/cc_ags_dynamic_object.cpp engine/ac/dynobj/cc_ags_dynamic_object.h
	engine/ac/dynobj/cc_audio_channel.cpp engine/ac/dynobj/cc_audio_channel.h
	engine/ac/dynobj/cc_audio_clip.cpp engine/ac/dynobj/cc_audio_clip.h
	engine/ac/dynobj/cc_character.cpp engine/ac/dynobj/cc_character.h
	engine/ac/dynobj/cc_dialog.cpp engine/ac/dynobj/cc_dialog.h
	engine/ac/dynobj/cc_dynamic_array.cpp engine/ac/dynobj/cc_dynamic_array.h
	engine/ac/dynobj/cc_dynamic_object.cpp engine/ac/dynobj/cc_dynamic_object.h
	engine/ac/dynobj/cc_dynamic_object_addr_and_manager.h
	engine/ac/dynobj/cc_gui.cpp engine/ac/dynobj/cc_gui.h
	engine/ac/dynobj/cc_gui_object.cpp engine/ac/dynobj/cc_gui_object.h
	engine/ac/dynobj/cc_hotspot.cpp engine/ac/dynobj/cc_hotspot.h
	engine/ac/dynobj/cc_inventory.cpp engine/ac/dynobj/cc_inventory.h
	engine/ac/dynobj/cc_object.cpp engine/ac/dynobj/cc_object.h
	engine/ac/dynobj/cc_region.cpp engine/ac/dynobj/cc_region.h
	engine/ac/dynobj/cc_serializer.cpp engine/ac/dynobj/cc_serializer.h
	engine/ac/dynobj/managed_object_pool.cpp engine/ac/dynobj/managed_object_pool.h
	engine/ac/dynobj/script_audio_channel.h
	engine/ac/dynobj/script_camera.cpp engine/ac/dynobj/script_camera.h
	engine/ac/dynobj/script_containers.h
	engine/ac/dynobj/script_date_time.cpp engine/ac/dynobj/script_date_time.h
	engine/ac/dynobj/script_dialog.h
	engine/ac/dynobj/script_dialog_options_rendering.cpp engine/ac/dynobj/script_dialog_options_rendering.h
	engine/ac/dynobj/script_dict.cpp engine/ac/dynobj/script_dict.h
	engine/ac/dynobj/script_drawing_surface.cpp engine/ac/dynobj/script_drawing_surface.h
	engine/ac/dynobj/script_dynamic_sprite.cpp engine/ac/dynobj/script_dynamic_sprite.h
	engine/ac/dynobj/script_file.cpp engine/ac/dynobj/script_file.h
	engine/ac/dynobj/script_gui.h
	engine/ac/dynobj/script_hotspot.h
	engine/ac/dynobj/script_inv_item.h
	engine/ac/dynobj/script_mouse.h
	engine/ac/dynobj/script_object.h
	engine/ac/dynobj/script_overlay.cpp engine/ac/dynobj/script_overlay.h
	engine/ac/dynobj/script_region.h
	engine/ac/dynobj/script_set.cpp engine/ac/dynobj/script_set.h
	engine/ac/dynobj/script_string.cpp engine/ac/dynobj/script_string.h
	engine/ac/dynobj/script_system.h
	engine/ac/dynobj/script_user_object.cpp engine/ac/dynobj/script_user_object.h
	engine/ac/dynobj/script_view_frame.cpp engine/ac/dynobj/script_view_frame.h
	engine/ac/dynobj/script_viewport.cpp engine/ac/dynobj/script_viewport.h
	engine/ac/statobj/ags_static_object.cpp engine/ac/statobj/ags_static_object.h
	engine/ac/statobj/static_array.cpp engine/ac/statobj/static_array.h
	engine/ac/statobj/static_object.h
	engine/ac/asset_helper.h
	engine/ac/audio_channel.cpp engine/ac/audio_channel.h
	engine/ac/audio_clip.cpp engine/ac/audio_clip.h
	engine/ac/button.cpp engine/ac/button.h
	engine/ac/cd_audio.cpp engine/ac/cd_audio.h
	engine/ac/character.cpp engine/ac/character.h
	engine/ac/character_cache.h
	engine/ac/character_extras.cpp engine/ac/character_extras.h
	engine/ac/character_info_engine.cpp
	engine/ac/date_time.cpp engine/ac/date_time.h
	engine/ac/dialog.cpp engine/ac/dialog.h
	engine/ac/dialog_options_rendering.cpp engine/ac/dialog_options_rendering.h
	engine/ac/display.cpp engine/ac/display.h
	engine/ac/draw.cpp engine/ac/draw.h
	engine/ac/draw_software.cpp engine/ac/draw_software.h
	engine/ac/drawing_surface.cpp engine/ac/drawing_surface.h
	engine/ac/dynamic_sprite.cpp engine/ac/dynamic_sprite.h
	engine/ac/event.cpp engine/ac/event.h
	engine/ac/file.cpp engine/ac/file.h
	engine/ac/game.cpp engine/ac/game.h
	engine/ac/game_setup.cpp engine/ac/game_setup.h
	engine/ac/game_state.cpp engine/ac/game_state.h
	engine/ac/global_api.cpp
	engine/ac/global_audio.cpp engine/ac/global_audio.h
	engine/ac/global_button.cpp engine/ac/global_button.h
	engine/ac/global_character.cpp engine/ac/global_character.h
	engine/ac/global_date_time.cpp engine/ac/global_date_time.h
	engine/ac/global_debug.cpp engine/ac/global_debug.h
	engine/ac/global_dialog.cpp engine/ac/global_dialog.h
	engine/ac/global_display.cpp engine/ac/global_display.h
	engine/ac/global_drawing_surface.cpp engine/ac/global_drawing_surface.h
	engine/ac/global_dynamic_sprite.cpp engine/ac/global_dynamic_sprite.h
	engine/ac/global_file.cpp engine/ac/global_file.h
	engine/ac/global_game.cpp engine/ac/global_game.h
	engine/ac/global_gui.cpp engine/ac/global_gui.h
	engine/ac/global_hotspot.cpp engine/ac/global_hotspot.h
	engine/ac/global_inv_window.cpp engine/ac/global_inv_window.h
	engine/ac/global_inventory_item.cpp engine/ac/global_inventory_item.h
	engine/ac/global_label.cpp engine/ac/global_label.h
	engine/ac/global_listbox.cpp engine/ac/global_listbox.h
	engine/ac/global_mouse.cpp engine/ac/global_mouse.h
	engine/ac/global_object.cpp engine/ac/global_object.h
	engine/ac/global_overlay.cpp engine/ac/global_overlay.h
	engine/ac/global_palette.cpp engine/ac/global_palette.h
	engine/ac/global_parser.cpp engine/ac/global_parser.h
	engine/ac/global_record.cpp engine/ac/global_record.h
	engine/ac/global_region.cpp engine/ac/global_region.h
	engine/ac/global_room.cpp engine/ac/global_room.h
	engine/ac/global_screen.cpp engine/ac/global_screen.h
	engine/ac/global_slider.cpp engine/ac/global_slider.h
	engine/ac/global_string.cpp engine/ac/global_string.h
	engine/ac/global_textbox.cpp engine/ac/global_textbox.h
	engine/ac/global_timer.cpp engine/ac/global_timer.h
	engine/ac/global_translation.cpp engine/ac/global_translation.h
	engine/ac/global_video.cpp engine/ac/global_video.h
	engine/ac/global_view_frame.cpp engine/ac/global_view_frame.h
	engine/ac/global_viewport.cpp engine/ac/global_viewport.h
	engine/ac/global_walk_behind.cpp engine/ac/global_walk_behind.h
	engine/ac/global_walkable_area.cpp engine/ac/global_walkable_area.h
	engine/ac/gui.cpp engine/ac/gui.h
	engine/ac/gui_control.cpp engine/ac/gui_control.h
	engine/ac/gui_inv.cpp
	engine/ac/hotspot.cpp engine/ac/hotspot.h
	engine/ac/interface_button.cpp
	engine/ac/interface_element.cpp
	engine/ac/inv_window.cpp engine/ac/inv_window.h
	engine/ac/inventory_item.cpp engine/ac/inventory_item.h
	engine/ac/label.cpp engine/ac/label.h
	engine/ac/lip_sync.h
	engine/ac/listbox.cpp engine/ac/listbox.h
	engine/ac/math.cpp engine/ac/math.h
	engine/ac/mouse.cpp engine/ac/mouse.h
	engine/ac/move_list.cpp engine/ac/move_list.h
	engine/ac/object.cpp engine/ac/object.h
	engine/ac/object_cache.h
	engine/ac/overlay.cpp engine/ac/overlay.h
	engine/ac/parser.cpp engine/ac/parser.h
	engine/ac/path_helper.h
	engine/ac/properties.cpp engine/ac/properties.h
	engine/ac/region.cpp engine/ac/region.h
	engine/ac/rich_game_media.cpp engine/ac/rich_game_media.h
	engine/ac/room.cpp engine/ac/room.h
	engine/ac/room_object.cpp engine/ac/room_object.h
	engine/ac/room_status.cpp engine/ac/room_status.h
	engine/ac/route_finder.cpp engine/ac/route_finder.h
	engine/ac/route_finder_impl.cpp engine/ac/route_finder_impl.h
	engine/ac/route_finder_impl_legacy.cpp engine/ac/route_finder_impl_legacy.h
	engine/ac/route_finder_jps.cpp engine/ac/route_finder_jps.h
	engine/ac/runtime_defines.h
	engine/ac/screen.cpp engine/ac/screen.h
	engine/ac/screen_overlay.cpp engine/ac/screen_overlay.h
	engine/ac/script_containers.cpp
	engine/ac/slider.cpp engine/ac/slider.h
	engine/ac/speech.cpp engine/ac/speech.h
	engine/ac/sprite.cpp engine/ac/sprite.h
	engine/ac/sprite_cache_engine.cpp
	engine/ac/sprite_list_entry.h
	engine/ac/string.cpp engine/ac/string.h
	engine/ac/sys_events.cpp engine/ac/sys_events.h
	engine/ac/system.cpp engine/ac/system.h
	engine/ac/textbox.cpp engine/ac/textbox.h
	engine/ac/timer.cpp engine/ac/timer.h
	engine/ac/top_bar_settings.h
	engine/ac/translation.cpp engine/ac/translation.h
	engine/ac/view_frame.cpp engine/ac/view_frame.h
	engine/ac/viewport_script.cpp
	engine/ac/walk_behind.cpp engine/ac/walk_behind.h
	engine/ac/walkable_area.cpp engine/ac/walkable_area.h
	engine/debugging/ags_editor_debugger.h
	engine/debugging/console_output_target.cpp engine/debugging/console_output_target.h
	engine/debugging/debug.cpp
	engine/debugging/debug_log.h
	engine/debugging/debugger.h
	engine/debugging/dummy_ags_debugger.h
	engine/debugging/file_based_ags_debugger.cpp engine/debugging/file_based_ags_debugger.h
	engine/debugging/log_file.cpp engine/debugging/log_file.h
	engine/debugging/message_buffer.cpp engine/debugging/message_buffer.h
	engine/device/mouse_w32.cpp engine/device/mouse_w32.h
	engine/font/fonts_engine.cpp
	engine/game/game_init.cpp engine/game/game_init.h
	engine/game/savegame.cpp engine/game/savegame.h
	engine/game/savegame_components.cpp engine/game/savegame_components.h
	engine/game/savegame_internal.h
	engine/game/savegame_v321.cpp
	engine/game/viewport.cpp engine/game/viewport.h
	engine/gfx/ali_3d_scummvm.cpp engine/gfx/ali_3d_scummvm.h
	engine/gfx/blender.cpp engine/gfx/blender.h
	engine/gfx/color_engine.cpp
	engine/gfx/ddb.h
	engine/gfx/gfx_defines.h
	engine/gfx/gfx_driver_base.cpp engine/gfx/gfx_driver_base.h
	engine/gfx/gfx_driver_factory.cpp engine/gfx/gfx_driver_factory.h
	engine/gfx/gfx_driver_factory_base.h
	engine/gfx/gfx_mode_list.h
	engine/gfx/gfx_util.cpp engine/gfx/gfx_util.h
	engine/gfx/gfxfilter.h
	engine/gfx/gfxfilter_scaling.cpp engine/gfx/gfxfilter_scaling.h
	engine/gfx/gfxfilter_scummvm_renderer.cpp engine/gfx/gfxfilter_scummvm_renderer.h
	engine/gfx/graphics_driver.h
	engine/gui/animating_gui_button.cpp engine/gui/animating_gui_button.h
	engine/gui/csci_dialog.cpp engine/gui/csci_dialog.h
	engine/gui/gui_dialog.cpp engine/gui/gui_dialog.h
	engine/gui/gui_dialog_defines.h
	engine/gui/gui_dialog_internal_defs.h
	engine/gui/gui_engine.cpp
	engine/gui/my_controls.h
	engine/gui/my_label.cpp engine/gui/my_label.h
	engine/gui/my_listbox.cpp engine/gui/my_listbox.h
	engine/gui/my_push_button.cpp engine/gui/my_push_button.h
	engine/gui/my_textbox.cpp engine/gui/my_textbox.h
	engine/gui/new_control.cpp engine/gui/new_control.h
	engine/main/config.cpp engine/main/config.h
	engine/main/engine.cpp engine/main/engine.h
	engine/main/engine_setup.cpp engine/main/engine_setup.h
	engine/main/game_file.cpp engine/main/game_file.h
	engine/main/game_run.cpp engine/main/game_run.h
	engine/main/game_start.cpp engine/main/game_start.h
	engine/main/graphics_mode.cpp engine/main/graphics_mode.h
	engine/main/main.cpp engine/main/main.h
	engine/main/quit.cpp engine/main/quit.h
	engine/main/update.cpp engine/main/update.h
	engine/media/audio/ambient_sound.cpp engine/media/audio/ambient_sound.h
	engine/media/audio/audio.cpp engine/media/audio/audio.h
	engine/media/audio/audio_defines.h
	engine/media/audio/audio_system.h
	engine/media/audio/clip_my_midi.cpp engine/media/audio/clip_my_midi.h
	engine/media/audio/queued_audio_item.cpp engine/media/audio/queued_audio_item.h
	engine/media/audio/sound.cpp engine/media/audio/sound.h
	engine/media/audio/sound_clip.cpp engine/media/audio/sound_clip.h
	engine/media/video/video.cpp engine/media/video/video.h

	engine/platform/base/ags_platform_driver.cpp engine/platform/base/ags_platform_driver.h
	engine/platform/base/sys_main.cpp engine/platform/base/sys_main.h
	engine/platform/scummvm/scummvm_platform_driver.cpp

	engine/script/cc_instance.cpp engine/script/cc_instance.h
	engine/script/executing_script.cpp engine/script/executing_script.h
	engine/script/exports.cpp engine/script/exports.h
	engine/script/non_blocking_script_function.h
	engine/script/runtime_script_value.cpp engine/script/runtime_script_value.h
	engine/script/script.cpp engine/script/script.h
	engine/script/script_api.cpp engine/script/script_api.h
	engine/script/script_engine.cpp
	engine/script/script_runtime.cpp engine/script/script_runtime.h
	engine/script/system_imports.cpp engine/script/system_imports.h

	lib/aastr-0.1.1/aarot.cpp
	lib/aastr-0.1.1/aastr.cpp lib/aastr-0.1.1/aastr.h
	lib/aastr-0.1.1/aautil.cpp lib/aastr-0.1.1/aautil.h
	lib/alfont/alfont.cpp lib/alfont/alfont.h
	lib/allegro/aintern.h
	lib/allegro/alconfig.h
	lib/allegro/base.h
	lib/allegro/color.cpp lib/allegro/color.h
	lib/allegro/config.cpp lib/allegro/config.h
	lib/allegro/draw.cpp lib/allegro/draw.h
	lib/allegro/error.h
	lib/allegro/file.cpp lib/allegro/file.h
	lib/allegro/fixed.cpp lib/allegro/fixed.h
	lib/allegro/flood.cpp lib/allegro/flood.h
	lib/allegro/fmaths.h
	lib/allegro/gfx.cpp lib/allegro/gfx.h
	lib/allegro/graphics.cpp
	lib/allegro/math.cpp
	lib/allegro/rotate.cpp lib/allegro/rotate.h
	lib/allegro/surface.cpp lib/allegro/surface.h
	lib/allegro/system.cpp lib/allegro/system.h
	lib/allegro/unicode.cpp lib/allegro/unicode.h
	lib/std/algorithm.h
	lib/std/array.h
	lib/std/chrono.h
	lib/std/functional.h
	lib/std/initializer_list.h
	lib/std/limits.h
	lib/std/list.h
	lib/std/map.h
	lib/std/math.h
	lib/std/memory.h
	lib/std/mutex.h
	lib/std/queue.h
	lib/std/regex.h
	lib/std/set.h
	lib/std/std.cpp
	lib/std/thread.h
	lib/std/type_traits.h
	lib/std/unordered_set.h
	lib/std/utility.h
	lib/std/vector.h
	lib/std/xtr1common.h
	lib/std/xutility.h
	lib/system/datetime.cpp lib/system/datetime.h
	lib/allegro.h
	plugins/ags_agi/ags_agi.cpp plugins/ags_agi/ags_agi.h
	plugins/ags_blend/ags_blend.cpp plugins/ags_blend/ags_blend.h
	plugins/ags_clipboard/ags_clipboard.cpp plugins/ags_clipboard/ags_clipboard.h
	plugins/ags_controller/ags_controller.cpp plugins/ags_controller/ags_controller.h
	plugins/ags_creditz/ags_creditz.cpp plugins/ags_creditz/ags_creditz.h
	plugins/ags_creditz/ags_creditz1.cpp plugins/ags_creditz/ags_creditz1.h
	plugins/ags_creditz/ags_creditz2.cpp plugins/ags_creditz/ags_creditz2.h
	plugins/ags_creditz/drawing.cpp plugins/ags_creditz/drawing.h
	plugins/ags_fire/ags_fire.cpp plugins/ags_fire/ags_fire.h
	plugins/ags_flashlight/ags_flashlight.cpp plugins/ags_flashlight/ags_flashlight.h
	plugins/ags_flashlight/gfx.cpp
	plugins/ags_galaxy_steam/ags_galaxy_steam.cpp plugins/ags_galaxy_steam/ags_galaxy_steam.h
	plugins/ags_galaxy_steam/ags_wadjeteye_steam.cpp plugins/ags_galaxy_steam/ags_wadjeteye_steam.h
	plugins/ags_joy/ags_joy.cpp plugins/ags_joy/ags_joy.h
	plugins/ags_nickenstien_gfx/ags_nickenstien_gfx.cpp plugins/ags_nickenstien_gfx/ags_nickenstien_gfx.h
	plugins/ags_pal_render/ags_pal_render.cpp plugins/ags_pal_render/ags_pal_render.h
	plugins/ags_pal_render/pal_render.h
	plugins/ags_pal_render/raycast.cpp plugins/ags_pal_render/raycast.h
	plugins/ags_parallax/ags_parallax.cpp plugins/ags_parallax/ags_parallax.h
	plugins/ags_shell/ags_shell.cpp plugins/ags_shell/ags_shell.h
	plugins/ags_snow_rain/ags_snow_rain.cpp plugins/ags_snow_rain/ags_snow_rain.h
	plugins/ags_snow_rain/weather.cpp plugins/ags_snow_rain/weather.h
	plugins/ags_sock/ags_sock.cpp plugins/ags_sock/ags_sock.h
	plugins/ags_sprite_font/ags_sprite_font.cpp plugins/ags_sprite_font/ags_sprite_font.h
	plugins/ags_sprite_font/ags_sprite_font_clifftop.cpp plugins/ags_sprite_font/ags_sprite_font_clifftop.h
	plugins/ags_sprite_font/character_entry.cpp plugins/ags_sprite_font/character_entry.h
	plugins/ags_sprite_font/color.cpp plugins/ags_sprite_font/color.h
	plugins/ags_sprite_font/sprite_font.cpp plugins/ags_sprite_font/sprite_font.h
	plugins/ags_sprite_font/sprite_font_renderer.cpp plugins/ags_sprite_font/sprite_font_renderer.h
	plugins/ags_sprite_font/sprite_font_renderer_clifftop.cpp plugins/ags_sprite_font/sprite_font_renderer_clifftop.h
	plugins/ags_sprite_font/variable_width_font.cpp plugins/ags_sprite_font/variable_width_font.h
	plugins/ags_sprite_font/variable_width_sprite_font.cpp plugins/ags_sprite_font/variable_width_sprite_font.h
	plugins/ags_sprite_font/variable_width_sprite_font_clifftop.cpp plugins/ags_sprite_font/variable_width_sprite_font_clifftop.h
	plugins/ags_tcp_ip/ags_tcp_ip.cpp plugins/ags_tcp_ip/ags_tcp_ip.h
	plugins/ags_touch/ags_touch.cpp plugins/ags_touch/ags_touch.h
	plugins/ags_wadjet_util/ags_wadjet_util.cpp plugins/ags_wadjet_util/ags_wadjet_util.h
	plugins/ags_waves/ags_waves.cpp plugins/ags_waves/ags_waves.h
	plugins/ags_waves/data.cpp
	plugins/ags_waves/draw.cpp
	plugins/ags_waves/sound.cpp
	plugins/ags_waves/vars.h
	plugins/ags_waves/warper.cpp
	plugins/ags_waves/weather.cpp
	plugins/core/audio_channel.cpp plugins/core/audio_channel.h
	plugins/core/audio_clip.cpp plugins/core/audio_clip.h
	plugins/core/button.cpp plugins/core/button.h
	plugins/core/character.cpp plugins/core/character.h
	plugins/core/core.cpp plugins/core/core.h
	plugins/core/date_time.cpp plugins/core/date_time.h
	plugins/core/dialog.cpp plugins/core/dialog.h
	plugins/core/dialog_options_rendering_info.cpp plugins/core/dialog_options_rendering_info.h
	plugins/core/drawing_surface.cpp plugins/core/drawing_surface.h
	plugins/core/dynamic_sprite.cpp plugins/core/dynamic_sprite.h
	plugins/core/file.cpp plugins/core/file.h
	plugins/core/game.cpp plugins/core/game.h
	plugins/core/global_api.cpp plugins/core/global_api.h
	plugins/core/gui.cpp plugins/core/gui.h
	plugins/core/gui_control.cpp plugins/core/gui_control.h
	plugins/core/hotspot.cpp plugins/core/hotspot.h
	plugins/core/inv_window.cpp plugins/core/inv_window.h
	plugins/core/inventory_item.cpp plugins/core/inventory_item.h
	plugins/core/label.cpp plugins/core/label.h
	plugins/core/listbox.cpp plugins/core/listbox.h
	plugins/core/maths.cpp plugins/core/maths.h
	plugins/core/mouse.cpp plugins/core/mouse.h
	plugins/core/object.cpp plugins/core/object.h
	plugins/core/overlay.cpp plugins/core/overlay.h
	plugins/core/parser.cpp plugins/core/parser.h
	plugins/core/region.cpp plugins/core/region.h
	plugins/core/room.cpp plugins/core/room.h
	plugins/core/slider.cpp plugins/core/slider.h
	plugins/core/string.cpp plugins/core/string.h
	plugins/core/system.cpp plugins/core/system.h
	plugins/core/textbox.cpp plugins/core/textbox.h
	plugins/core/view_frame.cpp plugins/core/view_frame.h
	plugins/ags_plugin.cpp plugins/ags_plugin.h
	plugins/plugin_base.cpp plugins/plugin_base.h
	plugins/plugin_engine.h
	plugins/plugin_object_reader.cpp plugins/plugin_object_reader.h
	plugins/serializer.h
	shared/ac/dynobj/script_audio_clip.cpp shared/ac/dynobj/script_audio_clip.h
	shared/ac/audio_clip_type.cpp shared/ac/audio_clip_type.h
	shared/ac/character_info.cpp shared/ac/character_info.h
	shared/ac/common.cpp shared/ac/common.h
	shared/ac/common_defines.h
	shared/ac/dialog_topic.cpp shared/ac/dialog_topic.h
	shared/ac/game_setup_struct.cpp shared/ac/game_setup_struct.h
	shared/ac/game_setup_struct_base.cpp shared/ac/game_setup_struct_base.h
	shared/ac/game_struct_defines.h
	shared/ac/game_version.h
	shared/ac/interface_button.h
	shared/ac/interface_element.h
	shared/ac/inventory_item_info.cpp shared/ac/inventory_item_info.h
	shared/ac/keycode.cpp shared/ac/keycode.h
	shared/ac/mouse_cursor.cpp shared/ac/mouse_cursor.h
	shared/ac/old_game_setup_struct.h
	shared/ac/sprite_cache.cpp shared/ac/sprite_cache.h
	shared/ac/view.cpp shared/ac/view.h
	shared/ac/words_dictionary.cpp shared/ac/words_dictionary.h
	shared/core/asset.cpp shared/core/asset.h
	shared/core/asset_manager.cpp shared/core/asset_manager.h
	shared/core/def_version.h
	shared/core/platform.h
	shared/core/types.h
	shared/debugging/debug_manager.cpp shared/debugging/debug_manager.h
	shared/debugging/out.h
	shared/debugging/output_handler.h
	shared/font/ags_font_renderer.h
	shared/font/fonts.cpp shared/font/fonts.h
	shared/font/ttf_font_renderer.cpp shared/font/ttf_font_renderer.h
	shared/font/wfn_font.cpp shared/font/wfn_font.h
	shared/font/wfn_font_renderer.cpp shared/font/wfn_font_renderer.h
	shared/game/custom_properties.cpp shared/game/custom_properties.h
	shared/game/interactions.cpp shared/game/interactions.h
	shared/game/main_game_file.cpp shared/game/main_game_file.h
	shared/game/plugin_info.h
	shared/game/room_file.cpp shared/game/room_file.h
	shared/game/room_file_base.cpp
	shared/game/room_file_deprecated.cpp
	shared/game/room_struct.cpp shared/game/room_struct.h
	shared/game/room_version.h
	shared/game/tra_file.cpp shared/game/tra_file.h
	shared/gfx/allegro_bitmap.cpp shared/gfx/allegro_bitmap.h
	shared/gfx/bitmap.cpp shared/gfx/bitmap.h
	shared/gfx/gfx_def.h
	shared/gfx/image.cpp shared/gfx/image.h
	shared/gui/gui_button.cpp shared/gui/gui_button.h
	shared/gui/gui_defines.h
	shared/gui/gui_inv.cpp shared/gui/gui_inv.h
	shared/gui/gui_label.cpp shared/gui/gui_label.h
	shared/gui/gui_listbox.cpp shared/gui/gui_listbox.h
	shared/gui/gui_main.cpp shared/gui/gui_main.h
	shared/gui/gui_object.cpp shared/gui/gui_object.h
	shared/gui/gui_slider.cpp shared/gui/gui_slider.h
	shared/gui/gui_textbox.cpp shared/gui/gui_textbox.h
	shared/script/cc_error.cpp shared/script/cc_error.h
	shared/script/cc_options.cpp shared/script/cc_options.h
	shared/script/cc_script.cpp shared/script/cc_script.h
	shared/script/script_common.h
	shared/util/aligned_stream.cpp shared/util/aligned_stream.h
	shared/util/bbop.h
	shared/util/buffered_stream.cpp shared/util/buffered_stream.h
	shared/util/compress.cpp shared/util/compress.h
	shared/util/data_ext.cpp shared/util/data_ext.h
	shared/util/data_stream.cpp shared/util/data_stream.h
	shared/util/directory.cpp shared/util/directory.h
	shared/util/error.h
	shared/util/file.cpp shared/util/file.h
	shared/util/file_stream.cpp shared/util/file_stream.h
	shared/util/geometry.cpp shared/util/geometry.h
	shared/util/ini_file.cpp shared/util/ini_file.h
	shared/util/ini_util.cpp shared/util/ini_util.h
	shared/util/lzw.cpp shared/util/lzw.h
	shared/util/math.h
	shared/util/memory.h
	shared/util/memory_compat.h
	shared/util/memory_stream.cpp shared/util/memory_stream.h
	shared/util/multi_file_lib.cpp shared/util/multi_file_lib.h
	shared/util/path.cpp shared/util/path.h
	shared/util/proxy_stream.cpp shared/util/proxy_stream.h
	shared/util/scaling.h
	shared/util/stdio_compat.cpp shared/util/stdio_compat.h
	shared/util/stream.cpp shared/util/stream.h
	shared/util/string.cpp shared/util/string.h
	shared/util/string_compat.cpp shared/util/string_compat.h
	shared/util/string_types.h
	shared/util/string_utils.cpp shared/util/string_utils.h
	shared/util/text_reader.h
	shared/util/text_stream_reader.cpp shared/util/text_stream_reader.h
	shared/util/text_stream_writer.cpp shared/util/text_stream_writer.h
	shared/util/text_writer.h
	shared/util/version.cpp shared/util/version.h
	shared/util/wgt2_allg.cpp shared/util/wgt2_allg.h

	achievements_tables.h
	ags.cpp ags.h
	console.cpp console.h
	detection.h
	detection_tables.h
	dialogs.cpp
	events.cpp events.h
	game_scanner.cpp game_scanner.h
	globals.cpp globals.h
	metaengine.cpp metaengine.h
	module.mk
	music.cpp music.h
)
