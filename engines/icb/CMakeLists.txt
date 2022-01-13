add_engine(icb
	common/datapacker.cpp common/datapacker.h
	common/pc_props.h
	common/ptr_util.cpp common/ptr_util.h
	common/px_2drealline.cpp common/px_2drealline.h
	common/px_2drealpoint.h
	common/px_3drealpoint.h
	common/px_anims.h
	common/px_array.h
	common/px_bitmap.h
	common/px_bitmap_pc.h
	common/px_bones.cpp common/px_bones.h
	common/px_camera.h
	common/px_camera_cube.h
	common/px_capri_maths.cpp common/px_capri_maths.h
	common/px_capri_maths_pc.cpp common/px_capri_maths_pc.h
	common/px_clu_api.cpp common/px_clu_api.h
	common/px_common.h
	common/px_definitions.h
	common/px_features.h
	common/px_floor_map.h
	common/px_game_object.h
	common/px_globalvariables.cpp common/px_globalvariables.h
	common/px_lights.h
	common/px_linkeddatafile.cpp common/px_linkeddatafile.h
	common/px_list.h
	common/px_mapfile.h
	common/px_prop_anims.h
	common/px_rcutypes.h
	common/px_route_barriers.h
	common/px_scriptengine.cpp common/px_scriptengine.h
	common/px_sfx_description.h
	common/px_sound_constants.h
	common/px_staticlayers.h
	common/px_string.cpp common/px_string.h
	common/px_types.h
	common/px_walkarea_integer.h
	common/revtex_api.h
	gfx/gfxstub.cpp gfx/gfxstub.h
	gfx/gfxstub_dutch.cpp gfx/gfxstub_dutch.h
	gfx/gfxstub_rev.cpp
	gfx/gfxstub_rev_dutch.h
	gfx/psx_anims.h
	gfx/psx_camera.cpp gfx/psx_camera.h
	gfx/psx_clut.h
	gfx/psx_light.h
	gfx/psx_ot.h
	gfx/psx_pcdefines.h
	gfx/psx_pcgpu.cpp gfx/psx_pcgpu.h
	gfx/psx_pchmd.h
	gfx/psx_poly.h
	gfx/psx_props.h
	gfx/psx_pxactor.h
	gfx/psx_scrn.h
	gfx/psx_tman.cpp gfx/psx_tman.h
	gfx/rab_api.cpp gfx/rab_api.h
	gfx/rap_api.h
	gfx/rlp_api.h
	sound/direct_sound.cpp sound/direct_sound.h
	sound/fx_manager.cpp sound/fx_manager.h
	sound/music_manager.cpp sound/music_manager.h
	sound/sound_common.cpp sound/sound_common.h
	sound/speech_manager.cpp sound/speech_manager.h
	actor.cpp actor.h
	actor_fx_pc.cpp
	actor_pc.cpp actor_pc.h
	actor_view_pc.cpp actor_view_pc.h
	animation.cpp
	animation_mega_set.cpp animation_mega_set.h
	async_generic.cpp
	barriers.cpp barriers.h
	bone.cpp bone.h
	breath.cpp breath.h
	camera.cpp
	chi.cpp
	cluster_manager_pc.cpp cluster_manager_pc.h
	configfile.cpp configfile.h
	console_pc.cpp
	custom_logics.cpp custom_logics.h
	debug.cpp debug.h
	debug_pc.cpp debug_pc.h
	direct_input.cpp direct_input.h
	drawpoly_pc.cpp drawpoly_pc.h
	event_list.cpp event_list.h
	event_manager.cpp event_manager.h
	event_timer.h
	floors.cpp floors.h
	fn_animation.cpp
	fn_event_functions.cpp
	fn_fx.cpp
	fn_fx_pc.cpp
	fn_icon_functions.cpp
	fn_interact.cpp
	fn_movie_pc.cpp
	fn_remora_functions.cpp
	fn_routines.cpp fn_routines.h
	fn_sound.cpp
	fn_sting_pc.cpp
	footstep.cpp
	function.cpp
	game_script.cpp game_script.h
	game_volume.cpp game_volume.h
	gameover.h
	general_interaction.cpp
	general_npc_animation.cpp
	global_objects.cpp global_objects.h
	global_objects_pc.cpp global_objects_pc.h
	global_objects_psx.cpp global_objects_psx.h
	global_switches.cpp global_switches.h
	global_vars.cpp global_vars.h
	graphic_prims.cpp graphic_prims.h
	graphic_prims_pc.cpp
	health_bar_pc.cpp
	icb.cpp icb.h
	icon_list.cpp icon_list.h
	icon_list_manager.cpp icon_list_manager.h
	icon_menu.cpp icon_menu.h
	icon_menu_pc.cpp icon_menu_pc.h
	jpeg_decode.cpp jpeg_decode.h
	keyboard.cpp keyboard.h
	light.h
	light_pc.cpp light_pc.h
	line_of_sight.cpp line_of_sight.h
	loadscrn.h
	loadscrn_pc.cpp
	logic.cpp
	main_menu.h
	main_menu_pc.cpp
	map_marker.cpp map_marker.h
	map_marker_pc.cpp
	mega_interaction.cpp
	metaengine.cpp
	mission.cpp mission.h
	mission_functions.cpp mission_functions.h
	module.mk
	mouse.cpp mouse.h
	mouse_pc.cpp
	movie_pc.cpp movie_pc.h
	non_ad_module.cpp non_ad_module.h
	object_structs.h
	options_manager_pc.cpp options_manager_pc.h
	p4.cpp p4.h
	p4_generic.h
	p4_generic_pc.h
	p4_pc.cpp
	player.cpp player.h
	player_interaction.cpp
	player_pc.cpp
	prim_route_builder.cpp prim_route_builder.h
	protocol.cpp protocol.h
	remora.cpp remora.h
	remora_pc.cpp remora_pc.h
	remora_sprite.cpp remora_sprite.h
	remora_sprite_pc.cpp
	res_man.cpp res_man.h
	res_man_pc.cpp res_man_pc.h
	route_manager.cpp route_manager.h
	session.cpp session.h
	set.cpp set.h
	set_pc.cpp set_pc.h
	shade.h
	shade_pc.cpp shade_pc.h
	shadow.h
	shadow_pc.cpp shadow_pc.h
	shake.cpp shake.h
	softskin_pc.cpp softskin_pc.h
	sound.cpp sound.h
	sound_logic.cpp sound_logic.h
	sound_logic_entry.cpp sound_logic_entry.h
	sound_lowlevel.h
	sound_lowlevel_pc.cpp
	speech.cpp speech.h
	speech_pc.cpp
	stage_draw.h
	stage_poly.cpp
	stage_view.h
	stagedraw_pc_poly.cpp
	string_vest.cpp string_vest.h
	surface_manager.cpp surface_manager.h
	text.h
	text_pc.cpp
	text_sprites.cpp text_sprites.h
	text_sprites_pc.cpp
	timer_func.cpp timer_func.h
	tracer.cpp tracer.h
	zsupport.cpp zsupport.h
)
