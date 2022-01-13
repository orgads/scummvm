add_engine(wintermute
	ad/ad_actor.cpp ad/ad_actor.h
	ad/ad_actor_3dx.cpp ad/ad_actor_3dx.h
	ad/ad_attach_3dx.cpp ad/ad_attach_3dx.h
	ad/ad_block.cpp ad/ad_block.h
	ad/ad_entity.cpp ad/ad_entity.h
	ad/ad_game.cpp ad/ad_game.h
	ad/ad_generic.cpp ad/ad_generic.h
	ad/ad_geom_ext.cpp ad/ad_geom_ext.h
	ad/ad_geom_ext_node.cpp ad/ad_geom_ext_node.h
	ad/ad_inventory.cpp ad/ad_inventory.h
	ad/ad_inventory_box.cpp ad/ad_inventory_box.h
	ad/ad_item.cpp ad/ad_item.h
	ad/ad_layer.cpp ad/ad_layer.h
	ad/ad_node_state.cpp ad/ad_node_state.h
	ad/ad_object.cpp ad/ad_object.h
	ad/ad_object_3d.cpp ad/ad_object_3d.h
	ad/ad_path.cpp ad/ad_path.h
	ad/ad_path3d.cpp ad/ad_path3d.h
	ad/ad_path_point.cpp ad/ad_path_point.h
	ad/ad_path_point3d.cpp ad/ad_path_point3d.h
	ad/ad_region.cpp ad/ad_region.h
	ad/ad_response.cpp ad/ad_response.h
	ad/ad_response_box.cpp ad/ad_response_box.h
	ad/ad_response_context.cpp ad/ad_response_context.h
	ad/ad_rot_level.cpp ad/ad_rot_level.h
	ad/ad_scale_level.cpp ad/ad_scale_level.h
	ad/ad_scene.cpp ad/ad_scene.h
	ad/ad_scene_geometry.cpp ad/ad_scene_geometry.h
	ad/ad_scene_node.cpp ad/ad_scene_node.h
	ad/ad_scene_state.cpp ad/ad_scene_state.h
	ad/ad_sentence.cpp ad/ad_sentence.h
	ad/ad_sprite_set.cpp ad/ad_sprite_set.h
	ad/ad_talk_def.cpp ad/ad_talk_def.h
	ad/ad_talk_holder.cpp ad/ad_talk_holder.h
	ad/ad_talk_node.cpp ad/ad_talk_node.h
	ad/ad_types.h
	ad/ad_walkplane.cpp ad/ad_walkplane.h
	ad/ad_waypoint_group.cpp ad/ad_waypoint_group.h
	ad/ad_waypoint_group3d.cpp ad/ad_waypoint_group3d.h
	base/file/base_disk_file.cpp base/file/base_disk_file.h
	base/file/base_file.cpp base/file/base_file.h
	base/file/base_file_entry.cpp base/file/base_file_entry.h
	base/file/base_package.cpp base/file/base_package.h
	base/file/base_save_thumb_file.cpp base/file/base_save_thumb_file.h
	base/file/base_savefile_manager_file.cpp base/file/base_savefile_manager_file.h
	base/file/dcpackage.h
	base/font/base_font.cpp base/font/base_font.h
	base/font/base_font_bitmap.cpp base/font/base_font_bitmap.h
	base/font/base_font_storage.cpp base/font/base_font_storage.h
	base/font/base_font_truetype.cpp base/font/base_font_truetype.h
	base/gfx/3ds/camera3d.cpp base/gfx/3ds/camera3d.h
	base/gfx/3ds/light3d.cpp base/gfx/3ds/light3d.h
	base/gfx/3ds/loader3ds.cpp base/gfx/3ds/loader3ds.h
	base/gfx/3ds/mesh3ds.cpp base/gfx/3ds/mesh3ds.h
	base/gfx/opengl/base_render_opengl3d.cpp base/gfx/opengl/base_render_opengl3d.h
	base/gfx/opengl/base_render_opengl3d_shader.cpp base/gfx/opengl/base_render_opengl3d_shader.h
	base/gfx/opengl/base_surface_opengl3d.cpp base/gfx/opengl/base_surface_opengl3d.h
	base/gfx/opengl/mesh3ds_opengl.cpp base/gfx/opengl/mesh3ds_opengl.h
	base/gfx/opengl/mesh3ds_opengl_shader.cpp base/gfx/opengl/mesh3ds_opengl_shader.h
	base/gfx/opengl/meshx_opengl.cpp base/gfx/opengl/meshx_opengl.h
	base/gfx/opengl/meshx_opengl_shader.cpp base/gfx/opengl/meshx_opengl_shader.h
	base/gfx/opengl/shadow_volume_opengl.cpp base/gfx/opengl/shadow_volume_opengl.h
	base/gfx/opengl/shadow_volume_opengl_shader.cpp base/gfx/opengl/shadow_volume_opengl_shader.h
	base/gfx/osystem/base_render_osystem.cpp base/gfx/osystem/base_render_osystem.h
	base/gfx/osystem/base_surface_osystem.cpp base/gfx/osystem/base_surface_osystem.h
	base/gfx/osystem/render_ticket.cpp base/gfx/osystem/render_ticket.h
	base/gfx/x/active_animation.cpp base/gfx/x/active_animation.h
	base/gfx/x/animation.cpp base/gfx/x/animation.h
	base/gfx/x/animation_channel.cpp base/gfx/x/animation_channel.h
	base/gfx/x/animation_set.cpp base/gfx/x/animation_set.h
	base/gfx/x/frame_node.cpp base/gfx/x/frame_node.h
	base/gfx/x/loader_x.cpp base/gfx/x/loader_x.h
	base/gfx/x/material.cpp base/gfx/x/material.h
	base/gfx/x/meshx.cpp base/gfx/x/meshx.h
	base/gfx/x/modelx.cpp base/gfx/x/modelx.h
	base/gfx/base_image.cpp base/gfx/base_image.h
	base/gfx/base_renderer.cpp base/gfx/base_renderer.h
	base/gfx/base_renderer3d.cpp base/gfx/base_renderer3d.h
	base/gfx/base_surface.cpp base/gfx/base_surface.h
	base/gfx/shadow_volume.cpp base/gfx/shadow_volume.h
	base/particles/part_emitter.cpp base/particles/part_emitter.h
	base/particles/part_force.cpp base/particles/part_force.h
	base/particles/part_particle.cpp base/particles/part_particle.h
	base/scriptables/debuggable/debuggable_script.cpp base/scriptables/debuggable/debuggable_script.h
	base/scriptables/debuggable/debuggable_script_engine.cpp base/scriptables/debuggable/debuggable_script_engine.h
	base/scriptables/dcscript.h
	base/scriptables/script.cpp base/scriptables/script.h
	base/scriptables/script_engine.cpp base/scriptables/script_engine.h
	base/scriptables/script_ext_array.cpp base/scriptables/script_ext_array.h
	base/scriptables/script_ext_date.cpp base/scriptables/script_ext_date.h
	base/scriptables/script_ext_directory.cpp base/scriptables/script_ext_directory.h
	base/scriptables/script_ext_file.cpp base/scriptables/script_ext_file.h
	base/scriptables/script_ext_math.cpp base/scriptables/script_ext_math.h
	base/scriptables/script_ext_mem_buffer.cpp base/scriptables/script_ext_mem_buffer.h
	base/scriptables/script_ext_object.cpp base/scriptables/script_ext_object.h
	base/scriptables/script_ext_string.cpp base/scriptables/script_ext_string.h
	base/scriptables/script_opcodes.h
	base/scriptables/script_stack.cpp base/scriptables/script_stack.h
	base/scriptables/script_value.cpp base/scriptables/script_value.h
	base/sound/base_sound.cpp base/sound/base_sound.h
	base/sound/base_sound_buffer.cpp base/sound/base_sound_buffer.h
	base/sound/base_sound_manager.cpp base/sound/base_sound_manager.h
	base/base.cpp base/base.h
	base/base_active_rect.cpp base/base_active_rect.h
	base/base_animation_transition_time.cpp base/base_animation_transition_time.h
	base/base_dynamic_buffer.cpp base/base_dynamic_buffer.h
	base/base_engine.cpp base/base_engine.h
	base/base_fader.cpp base/base_fader.h
	base/base_file_manager.cpp base/base_file_manager.h
	base/base_frame.cpp base/base_frame.h
	base/base_game.cpp base/base_game.h
	base/base_game_custom_actions.h
	base/base_game_music.cpp base/base_game_music.h
	base/base_game_settings.cpp base/base_game_settings.h
	base/base_keyboard_state.cpp base/base_keyboard_state.h
	base/base_named_object.cpp base/base_named_object.h
	base/base_object.cpp base/base_object.h
	base/base_parser.cpp base/base_parser.h
	base/base_persistence_manager.cpp base/base_persistence_manager.h
	base/base_point.cpp base/base_point.h
	base/base_quick_msg.cpp base/base_quick_msg.h
	base/base_region.cpp base/base_region.h
	base/base_script_holder.cpp base/base_script_holder.h
	base/base_scriptable.cpp base/base_scriptable.h
	base/base_sprite.cpp base/base_sprite.h
	base/base_string_table.cpp base/base_string_table.h
	base/base_sub_frame.cpp base/base_sub_frame.h
	base/base_surface_storage.cpp base/base_surface_storage.h
	base/base_transition_manager.cpp base/base_transition_manager.h
	base/base_viewport.cpp base/base_viewport.h
	base/save_thumb_helper.cpp base/save_thumb_helper.h
	base/saveload.cpp base/saveload.h
	base/timer.cpp base/timer.h
	debugger/listing_providers/basic_source_listing_provider.cpp debugger/listing_providers/basic_source_listing_provider.h
	debugger/listing_providers/blank_listing.cpp debugger/listing_providers/blank_listing.h
	debugger/listing_providers/blank_listing_provider.cpp debugger/listing_providers/blank_listing_provider.h
	debugger/listing_providers/cached_source_listing_provider.cpp debugger/listing_providers/cached_source_listing_provider.h
	debugger/listing_providers/source_listing.cpp debugger/listing_providers/source_listing.h
	debugger/listing_providers/source_listing_provider.h
	debugger/breakpoint.cpp debugger/breakpoint.h
	debugger/debugger_controller.cpp debugger/debugger_controller.h
	debugger/error.cpp debugger/error.h
	debugger/listing.cpp debugger/listing.h
	debugger/listing_provider.h
	debugger/script_monitor.cpp debugger/script_monitor.h
	debugger/watch.cpp debugger/watch.h
	debugger/watch_instance.cpp debugger/watch_instance.h
	ext/dll_dlltest.cpp
	ext/dll_geturl.cpp
	ext/dll_httpconnect.cpp
	ext/dll_img.cpp
	ext/dll_installutil.cpp
	ext/dll_kernel32.cpp
	ext/dll_shell32.cpp
	ext/dll_tools.cpp
	ext/externals.h
	ext/plugins.h
	ext/scene_achievements.cpp
	ext/scene_achievements_tables.h
	ext/scene_hooks.h
	ext/wme_3fstatistics.cpp ext/wme_3fstatistics.h
	ext/wme_commandlinehelper.cpp ext/wme_commandlinehelper.h
	ext/wme_galaxy.cpp ext/wme_galaxy.h
	ext/wme_steam.cpp ext/wme_steam.h
	math/floatpoint.h
	math/math_util.cpp math/math_util.h
	math/matrix4.cpp math/matrix4.h
	math/rect32.h
	math/vector2.cpp math/vector2.h
	system/sys_class.cpp system/sys_class.h
	system/sys_class_registry.cpp system/sys_class_registry.h
	system/sys_instance.cpp system/sys_instance.h
	ui/ui_button.cpp ui/ui_button.h
	ui/ui_edit.cpp ui/ui_edit.h
	ui/ui_entity.cpp ui/ui_entity.h
	ui/ui_object.cpp ui/ui_object.h
	ui/ui_text.cpp ui/ui_text.h
	ui/ui_tiled_image.cpp ui/ui_tiled_image.h
	ui/ui_window.cpp ui/ui_window.h
	utils/crc.cpp utils/crc.h
	utils/path_util.cpp utils/path_util.h
	utils/string_util.cpp utils/string_util.h
	utils/utils.cpp utils/utils.h
	video/subtitle_card.cpp video/subtitle_card.h
	video/video_player.cpp video/video_player.h
	video/video_subtitler.cpp video/video_subtitler.h
	video/video_theora_player.cpp video/video_theora_player.h
	achievements_tables.h
	coll_templ.h
	dcgf.h
	dctypes.h
	debugger.cpp debugger.h
	detection.h
	detection_tables.h
	keymapper_tables.h
	metaengine.cpp
	module.mk
	persistent.cpp persistent.h
	platform_osystem.cpp platform_osystem.h
	wintermute.cpp wintermute.h
	wintypes.h
)
