add_engine(grim
	costume/anim_component.cpp costume/anim_component.h
	costume/bitmap_component.cpp costume/bitmap_component.h
	costume/chore.cpp costume/chore.h
	costume/colormap_component.cpp costume/colormap_component.h
	costume/component.cpp costume/component.h
	costume/head.cpp costume/head.h
	costume/keyframe_component.cpp costume/keyframe_component.h
	costume/lua_var_component.cpp costume/lua_var_component.h
	costume/main_model_component.cpp costume/main_model_component.h
	costume/material_component.cpp costume/material_component.h
	costume/mesh_component.cpp costume/mesh_component.h
	costume/model_component.cpp costume/model_component.h
	costume/sound_component.cpp costume/sound_component.h
	costume/sprite_component.cpp costume/sprite_component.h
	emi/costume/emianim_component.cpp emi/costume/emianim_component.h
	emi/costume/emichore.cpp emi/costume/emichore.h
	emi/costume/emihead.cpp emi/costume/emihead.h
	emi/costume/emiluacode_component.cpp emi/costume/emiluacode_component.h
	emi/costume/emiluavar_component.cpp emi/costume/emiluavar_component.h
	emi/costume/emimesh_component.cpp emi/costume/emimesh_component.h
	emi/costume/emiskel_component.cpp emi/costume/emiskel_component.h
	emi/costume/emisprite_component.cpp emi/costume/emisprite_component.h
	emi/costume/emitexi_component.cpp emi/costume/emitexi_component.h
	emi/sound/codecs/scx.cpp emi/sound/codecs/scx.h
	emi/sound/aifftrack.cpp emi/sound/aifftrack.h
	emi/sound/emisound.cpp emi/sound/emisound.h
	emi/sound/mp3track.cpp emi/sound/mp3track.h
	emi/sound/scxtrack.cpp emi/sound/scxtrack.h
	emi/sound/track.cpp emi/sound/track.h
	emi/sound/vimatrack.cpp emi/sound/vimatrack.h
	emi/animationemi.cpp emi/animationemi.h
	emi/costumeemi.cpp emi/costumeemi.h
	emi/emi.cpp emi/emi.h
	emi/emi_registry.cpp emi/emi_registry.h
	emi/layer.cpp emi/layer.h
	emi/lua_v2.cpp emi/lua_v2.h
	emi/lua_v2_actor.cpp
	emi/lua_v2_sound.cpp
	emi/modelemi.cpp emi/modelemi.h
	emi/poolsound.cpp emi/poolsound.h
	emi/skeleton.cpp emi/skeleton.h
	imuse/imuse.cpp imuse/imuse.h
	imuse/imuse_mcmp_mgr.cpp imuse/imuse_mcmp_mgr.h
	imuse/imuse_music.cpp
	imuse/imuse_script.cpp
	imuse/imuse_sndmgr.cpp imuse/imuse_sndmgr.h
	imuse/imuse_tables.cpp imuse/imuse_tables.h
	imuse/imuse_track.cpp imuse/imuse_track.h
	lua/lapi.cpp lua/lapi.h
	lua/lauxlib.cpp lua/lauxlib.h
	lua/lbuffer.cpp
	lua/lbuiltin.cpp lua/lbuiltin.h
	lua/ldo.cpp lua/ldo.h
	lua/lfunc.cpp lua/lfunc.h
	lua/lgc.cpp lua/lgc.h
	lua/liolib.cpp
	lua/llex.cpp lua/llex.h
	lua/lmathlib.cpp
	lua/lmem.cpp lua/lmem.h
	lua/lobject.cpp lua/lobject.h
	lua/lopcodes.h
	lua/lparser.h
	lua/lrestore.cpp
	lua/lsave.cpp
	lua/lstate.cpp lua/lstate.h
	lua/lstring.cpp lua/lstring.h
	lua/lstrlib.cpp
	lua/lstx.cpp lua/lstx.h
	lua/ltable.cpp lua/ltable.h
	lua/ltask.cpp lua/ltask.h
	lua/ltm.cpp lua/ltm.h
	lua/lua.h
	lua/luadebug.h
	lua/lualib.h
	lua/lundump.cpp lua/lundump.h
	lua/lvm.cpp lua/lvm.h
	lua/lzio.cpp lua/lzio.h
	movie/codecs/blocky16.cpp movie/codecs/blocky16.h
	movie/codecs/blocky8.cpp movie/codecs/blocky8.h
	movie/codecs/codec48.cpp movie/codecs/codec48.h
	movie/codecs/smush_decoder.cpp movie/codecs/smush_decoder.h
	movie/codecs/vima.cpp movie/codecs/vima.h
	movie/bink.cpp movie/bink.h
	movie/movie.cpp movie/movie.h
	movie/mpeg.cpp movie/mpeg.h
	movie/quicktime.cpp movie/quicktime.h
	movie/smush.cpp movie/smush.h
	remastered/commentary.cpp remastered/commentary.h
	remastered/hotspot.cpp remastered/hotspot.h
	remastered/lua_remastered.cpp remastered/lua_remastered.h
	remastered/overlay.cpp remastered/overlay.h
	update/lang_filter.cpp update/lang_filter.h
	update/mscab.cpp update/mscab.h
	update/packfile.cpp update/packfile.h
	update/update.cpp update/update.h
	actor.cpp actor.h
	animation.cpp animation.h
	bitmap.cpp bitmap.h
	color.cpp color.h
	colormap.cpp colormap.h
	costume.cpp costume.h
	debug.cpp debug.h
	debugger.cpp debugger.h
	detection.h
	font.cpp font.h
	gfx_base.cpp gfx_base.h
	gfx_opengl.cpp gfx_opengl.h
	gfx_opengl_shaders.cpp gfx_opengl_shaders.h
	gfx_tinygl.cpp gfx_tinygl.h
	grim.cpp grim.h
	grim_controls.cpp
	inputdialog.cpp inputdialog.h
	iris.cpp iris.h
	keyframe.cpp keyframe.h
	lab.cpp lab.h
	lipsync.cpp lipsync.h
	localize.cpp localize.h
	lua.cpp lua.h
	lua_v1.cpp lua_v1.h
	lua_v1_actor.cpp
	lua_v1_graphics.cpp
	lua_v1_set.cpp
	lua_v1_sound.cpp
	lua_v1_text.cpp
	material.cpp material.h
	md5check.cpp md5check.h
	md5checkdialog.cpp md5checkdialog.h
	metaengine.cpp
	model.cpp model.h
	module.mk
	object.cpp object.h
	objectstate.cpp objectstate.h
	patchr.cpp patchr.h
	pool.h
	primitives.cpp primitives.h
	registry.cpp registry.h
	resource.cpp resource.h
	savegame.cpp savegame.h
	sector.cpp sector.h
	set.cpp set.h
	sound.cpp sound.h
	sprite.cpp sprite.h
	textobject.cpp textobject.h
	textsplit.cpp textsplit.h
)
