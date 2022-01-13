cmake_minimum_required(VERSION 3.13)
project(ScummVM)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
find_package(PkgConfig QUIET)
include(CMakeParseArguments)

set(SCUMMVM_LIBS)
set(SCUMMVM_ENGINES)

macro(find_feature)
	set(_OPTIONS_ARGS)
	set(_ONE_VALUE_ARGS name findpackage_name include_dirs_var libraries_var)
	set(_MULTI_VALUE_ARGS pkgconfig_name libraries)
	cmake_parse_arguments(_feature "${_OPTIONS_ARGS}" "${_ONE_VALUE_ARGS}" "${_MULTI_VALUE_ARGS}" ${ARGN})

	if (_feature_pkgconfig_name AND PKG_CONFIG_FOUND)
		pkg_check_modules(${_feature_name} REQUIRED ${_feature_pkgconfig_name})
		include_directories(${${_feature_name}_INCLUDE_DIRS})
		list(APPEND SCUMMVM_LIBS ${${_feature_name}_LIBRARIES})
	endif()

	if (NOT ${_feature_name}_FOUND)
		if (_feature_findpackage_name)
			find_package(${_feature_findpackage_name} REQUIRED)
		endif()
		if (_feature_include_dirs_var)
			include_directories(${${_feature_include_dirs_var}} REQUIRED)
		endif()
		if (_feature_libraries_var)
			list(APPEND SCUMMVM_LIBS ${${_feature_libraries_var}})
		endif()
		if (_feature_libraries)
			list(APPEND SCUMMVM_LIBS ${_feature_libraries})
		endif()
	endif()
endmacro()

function(add_engine engine_name)
	string(TOUPPER ${engine_name} _engine_var)
	set(_enable_engine_var "ENABLE_${_engine_var}")
	if(NOT ${_enable_engine_var})
		return()
	endif()
	add_library(${engine_name} ${ARGN})

	# Generate definitions for the engine
	add_definitions(-D${_enable_engine_var})
	foreach(SUB_ENGINE IN LISTS SUB_ENGINES_${_engine_var})
		add_definitions(-DENABLE_${SUB_ENGINE})
	endforeach(SUB_ENGINE)
	file(APPEND "../plugins_table.h" "#if PLUGIN_ENABLED_STATIC(${_engine_var})\n")
	file(APPEND "../plugins_table.h" "LINK_PLUGIN(${_engine_var})\n")
	file(APPEND "../plugins_table.h" "#endif\n")

	# Enable C++11
	set_property(TARGET ${engine_name} PROPERTY CXX_STANDARD 11)
	set_property(TARGET ${engine_name} PROPERTY CXX_STANDARD_REQUIRED ON)

	# Link against the engine
	target_link_libraries(scummvm ${engine_name})
endfunction()

# Define the engines and subengines
set(ENGINES CGE GOB)

# Generate options for the engines
foreach(ENGINE IN LISTS ENGINES)
	option(ENABLE_${ENGINE} "Enable ${ENGINE}" ON)
endforeach(ENGINE)

include_directories(${ScummVM_SOURCE_DIR}/. ${ScummVM_SOURCE_DIR}/./engines $ENV{SCUMMVM_LIBS}/include .)

# Libraries and features

find_feature(name sdl pkgconfig_name sdl2 findpackage_name SDL2 include_dirs_var IGNORE libraries_var SDL2_LIBRARIES libraries IGNORE)
# Depending on how SDL2 was built, there can be either and imported target or flags variables
# Define the flags variables from the imported target if necessary
if (TARGET SDL2::SDL2)
	get_target_property(SDL2_INCLUDE_DIRS SDL2::SDL2 INTERFACE_INCLUDE_DIRECTORIES)
	get_target_property(SDL2_LIBRARIES SDL2::SDL2 LOCATION)
endif()
include_directories(${SDL2_INCLUDE_DIRS})

find_feature(name zlib pkgconfig_name zlib findpackage_name ZLIB include_dirs_var ZLIB_INCLUDE_DIRS libraries_var ZLIB_LIBRARIES libraries IGNORE)
add_definitions(-DUSE_ZLIB)
find_feature(name mad pkgconfig_name mad findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries mad)
add_definitions(-DUSE_MAD)
find_feature(name fribidi pkgconfig_name fribidi findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries fribidi)
add_definitions(-DUSE_FRIBIDI)
find_feature(name ogg pkgconfig_name ogg findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries ogg)
add_definitions(-DUSE_OGG)
find_feature(name vorbis pkgconfig_name vorbisfile vorbis findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries vorbisfile vorbis)
add_definitions(-DUSE_VORBIS)
find_feature(name flac pkgconfig_name flac findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries FLAC)
add_definitions(-DUSE_FLAC)
find_feature(name png pkgconfig_name libpng findpackage_name PNG include_dirs_var PNG_INCLUDE_DIRS libraries_var PNG_LIBRARIES libraries IGNORE)
add_definitions(-DUSE_PNG)
add_definitions(-DUSE_GIF)
find_feature(name faad pkgconfig_name faad2 findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries faad)
add_definitions(-DUSE_FAAD)
find_feature(name mpeg2 pkgconfig_name libmpeg2 findpackage_name MPEG2 include_dirs_var MPEG2_INCLUDE_DIRS libraries_var MPEG2_mpeg2_LIBRARY libraries IGNORE)
add_definitions(-DUSE_MPEG2)
find_feature(name theoradec pkgconfig_name theoradec findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries theoradec)
add_definitions(-DUSE_THEORADEC)
find_feature(name freetype2 pkgconfig_name freetype2 findpackage_name Freetype include_dirs_var FREETYPE_INCLUDE_DIRS libraries_var FREETYPE_LIBRARIES libraries IGNORE)
add_definitions(-DUSE_FREETYPE2)
find_feature(name jpeg pkgconfig_name libjpeg findpackage_name JPEG include_dirs_var JPEG_INCLUDE_DIRS libraries_var JPEG_LIBRARIES libraries IGNORE)
add_definitions(-DUSE_JPEG)
find_feature(name fluidsynth pkgconfig_name fluidsynth findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries fluidsynth)
add_definitions(-DUSE_FLUIDSYNTH)
find_feature(name libcurl pkgconfig_name libcurl findpackage_name CURL include_dirs_var CURL_INCLUDE_DIRS libraries_var CURL_LIBRARIES libraries IGNORE)
add_definitions(-DUSE_LIBCURL)
find_feature(name sdlnet pkgconfig_name SDL2_net findpackage_name IGNORE include_dirs_var IGNORE libraries_var IGNORE libraries SDL2_net)
add_definitions(-DUSE_SDL_NET)
add_definitions(-DUSE_BINK)
add_definitions(-DUSE_SCALERS)
add_definitions(-DUSE_HQ_SCALERS)
add_definitions(-DUSE_EDGE_SCALERS)
add_definitions(-DUSE_ASPECT)
add_definitions(-DUSE_RGB_COLOR)
add_definitions(-DUSE_HIGHRES)
add_definitions(-DUSE_MT32EMU)
add_definitions(-DUSE_LUA)
add_definitions(-DUSE_TINYGL)
find_feature(name opengl pkgconfig_name IGNORE findpackage_name OpenGL include_dirs_var OPENGL_INCLUDE_DIR libraries_var OPENGL_gl_LIBRARY libraries IGNORE)
add_definitions(-DUSE_OPENGL)
add_definitions(-DUSE_OPENGL_GAME)
add_definitions(-DUSE_OPENGL_SHADERS)
add_definitions(-DUSE_GLES2)
add_definitions(-DUSE_TASKBAR)
add_definitions(-DUSE_CLOUD)
add_definitions(-DUSE_TRANSLATION)
add_definitions(-DENABLE_VKEYBD)
add_definitions(-DENABLE_EVENTRECORDER)
add_definitions(-DUSE_SYSDIALOGS)
add_definitions(-DUSE_DETECTLANG)
add_definitions(-DUSE_TTS)
add_definitions(-DBUILTIN_RESOURCES)
add_definitions(-DDETECTION_FULL)
add_definitions(-DUSE_DETECTION_FEATURES_STATIC)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-long-long -Wno-multichar -Wno-unknown-pragmas -Wno-reorder -Wpointer-arith -Wcast-qual -Wcast-align -Wshadow -Wnon-virtual-dtor -Wwrite-strings -fno-exceptions -fcheck-new")
if (WIN32)
	add_definitions(-DWIN32)
else()
	add_definitions(-DPOSIX)
endif()
add_definitions(-DSDL_BACKEND)
add_definitions(-DUSE_SDL2)
add_definitions(-DDETECTION_STATIC)
# Generate "engines/plugins_table.h"
file(REMOVE "engines/plugins_table.h")
file(APPEND "engines/plugins_table.h" "/* This file is automatically generated by CMake */\n")

list(APPEND SCUMMVM_LIBS scummvm-detection)
add_library(scummvm-detection
	./engines/access/access.h
	./engines/access/animation.h
	./engines/access/asurface.h
	./engines/access/bubble_box.h
	./engines/access/char.h
	./engines/access/data.h
	./engines/access/debugger.h
	./engines/access/decompress.h
	./engines/access/detection.cpp ./engines/access/detection.h
	./engines/access/detection_tables.h
	./engines/access/events.h
	./engines/access/files.h
	./engines/access/font.h
	./engines/access/inventory.h
	./engines/access/module.mk
	./engines/access/player.h
	./engines/access/resources.h
	./engines/access/room.h
	./engines/access/screen.h
	./engines/access/scripts.h
	./engines/access/sound.h
	./engines/access/video.h
	./engines/adl/adl.h
	./engines/adl/adl_v2.h
	./engines/adl/adl_v3.h
	./engines/adl/adl_v4.h
	./engines/adl/adl_v5.h
	./engines/adl/console.h
	./engines/adl/detection.cpp ./engines/adl/detection.h
	./engines/adl/disk.cpp ./engines/adl/disk.h
	./engines/adl/disk_image_helpers.h
	./engines/adl/display.h
	./engines/adl/display_a2.h
	./engines/adl/graphics.h
	./engines/adl/module.mk
	./engines/adl/sound.h
	./engines/agi/agi.h
	./engines/agi/appleIIgs_timedelay_overwrite.h
	./engines/agi/console.h
	./engines/agi/detection.cpp ./engines/agi/detection.h
	./engines/agi/detection_tables.h
	./engines/agi/font.h
	./engines/agi/graphics.h
	./engines/agi/inv.h
	./engines/agi/keyboard.h
	./engines/agi/logic.h
	./engines/agi/lzw.h
	./engines/agi/menu.h
	./engines/agi/module.mk
	./engines/agi/mouse_cursor.h
	./engines/agi/opcodes.h
	./engines/agi/palette.h
	./engines/agi/picture.h
	./engines/agi/preagi.h
	./engines/agi/preagi_mickey.h
	./engines/agi/preagi_troll.h
	./engines/agi/preagi_winnie.h
	./engines/agi/sound.h
	./engines/agi/sound_2gs.h
	./engines/agi/sound_coco3.h
	./engines/agi/sound_midi.h
	./engines/agi/sound_pcjr.h
	./engines/agi/sound_sarien.h
	./engines/agi/sprite.h
	./engines/agi/systemui.h
	./engines/agi/text.h
	./engines/agi/view.h
	./engines/agi/wagparser.cpp ./engines/agi/wagparser.h
	./engines/agi/words.h
	./engines/agos/agos.h
	./engines/agos/animation.h
	./engines/agos/debug.h
	./engines/agos/debugger.h
	./engines/agos/detection.cpp ./engines/agos/detection.h
	./engines/agos/detection_tables.h
	./engines/agos/intern.h
	./engines/agos/intern_detection.h
	./engines/agos/midi.h
	./engines/agos/module.mk
	./engines/agos/obsolete.h
	./engines/agos/sound.h
	./engines/agos/vga.h
	./engines/ags/achievements_tables.h
	./engines/ags/ags.h
	./engines/ags/console.h
	./engines/ags/detection.cpp ./engines/ags/detection.h
	./engines/ags/detection_tables.h
	./engines/ags/events.h
	./engines/ags/game_scanner.h
	./engines/ags/globals.h
	./engines/ags/metaengine.h
	./engines/ags/module.mk
	./engines/ags/music.h
	./engines/asylum/asylum.h
	./engines/asylum/console.h
	./engines/asylum/detection.cpp
	./engines/asylum/detection_tables.h
	./engines/asylum/eventhandler.h
	./engines/asylum/module.mk
	./engines/asylum/respack.h
	./engines/asylum/shared.h
	./engines/asylum/staticres.h
	./engines/avalanche/animation.h
	./engines/avalanche/avalanche.h
	./engines/avalanche/avalot.h
	./engines/avalanche/background.h
	./engines/avalanche/clock.h
	./engines/avalanche/closing.h
	./engines/avalanche/console.h
	./engines/avalanche/detection.cpp ./engines/avalanche/detection.h
	./engines/avalanche/dialogs.h
	./engines/avalanche/dropdown.h
	./engines/avalanche/enums.h
	./engines/avalanche/ghostroom.h
	./engines/avalanche/graphics.h
	./engines/avalanche/help.h
	./engines/avalanche/highscore.h
	./engines/avalanche/mainmenu.h
	./engines/avalanche/module.mk
	./engines/avalanche/nim.h
	./engines/avalanche/parser.h
	./engines/avalanche/sequence.h
	./engines/avalanche/shootemup.h
	./engines/avalanche/sound.h
	./engines/avalanche/timer.h
	./engines/bbvs/bbvs.h
	./engines/bbvs/detection.cpp ./engines/bbvs/detection.h
	./engines/bbvs/dialogs.h
	./engines/bbvs/gamemodule.h
	./engines/bbvs/graphics.h
	./engines/bbvs/module.mk
	./engines/bbvs/sound.h
	./engines/bbvs/spritemodule.h
	./engines/bladerunner/actor.h
	./engines/bladerunner/actor_clues.h
	./engines/bladerunner/actor_combat.h
	./engines/bladerunner/actor_dialogue_queue.h
	./engines/bladerunner/actor_walk.h
	./engines/bladerunner/adpcm_decoder.h
	./engines/bladerunner/ambient_sounds.h
	./engines/bladerunner/archive.h
	./engines/bladerunner/aud_stream.h
	./engines/bladerunner/audio_cache.h
	./engines/bladerunner/audio_mixer.h
	./engines/bladerunner/audio_player.h
	./engines/bladerunner/audio_speech.h
	./engines/bladerunner/bladerunner.h
	./engines/bladerunner/boundingbox.h
	./engines/bladerunner/chapters.h
	./engines/bladerunner/color.h
	./engines/bladerunner/combat.h
	./engines/bladerunner/crimes_database.h
	./engines/bladerunner/debugger.h
	./engines/bladerunner/decompress_lcw.h
	./engines/bladerunner/decompress_lzo.h
	./engines/bladerunner/detection.cpp
	./engines/bladerunner/detection_tables.h
	./engines/bladerunner/dialogue_menu.h
	./engines/bladerunner/fog.h
	./engines/bladerunner/font.h
	./engines/bladerunner/framelimiter.h
	./engines/bladerunner/game_constants.h
	./engines/bladerunner/game_flags.h
	./engines/bladerunner/game_info.h
	./engines/bladerunner/image.h
	./engines/bladerunner/item.h
	./engines/bladerunner/item_pickup.h
	./engines/bladerunner/items.h
	./engines/bladerunner/light.h
	./engines/bladerunner/lights.h
	./engines/bladerunner/matrix.h
	./engines/bladerunner/module.mk
	./engines/bladerunner/mouse.h
	./engines/bladerunner/movement_track.h
	./engines/bladerunner/music.h
	./engines/bladerunner/obstacles.h
	./engines/bladerunner/outtake.h
	./engines/bladerunner/overlays.h
	./engines/bladerunner/rect_float.h
	./engines/bladerunner/regions.h
	./engines/bladerunner/savefile.h
	./engines/bladerunner/scene.h
	./engines/bladerunner/scene_objects.h
	./engines/bladerunner/screen_effects.h
	./engines/bladerunner/set.h
	./engines/bladerunner/set_effects.h
	./engines/bladerunner/settings.h
	./engines/bladerunner/shape.h
	./engines/bladerunner/slice_animations.h
	./engines/bladerunner/slice_renderer.h
	./engines/bladerunner/subtitles.h
	./engines/bladerunner/suspects_database.h
	./engines/bladerunner/text_resource.h
	./engines/bladerunner/time.h
	./engines/bladerunner/vector.h
	./engines/bladerunner/view.h
	./engines/bladerunner/vqa_decoder.h
	./engines/bladerunner/vqa_player.h
	./engines/bladerunner/waypoints.h
	./engines/bladerunner/zbuffer.h
	./engines/buried/agent_evaluation.h
	./engines/buried/aidata.h
	./engines/buried/animdata.h
	./engines/buried/avi_frames.h
	./engines/buried/biochip_right.h
	./engines/buried/biochip_view.h
	./engines/buried/bookdata.h
	./engines/buried/buried.h
	./engines/buried/complete.h
	./engines/buried/console.h
	./engines/buried/credits.h
	./engines/buried/death.h
	./engines/buried/detection.cpp
	./engines/buried/detection_tables.h
	./engines/buried/fbcdata.h
	./engines/buried/frame_window.h
	./engines/buried/gameui.h
	./engines/buried/global_flags.h
	./engines/buried/graphics.h
	./engines/buried/inndata.h
	./engines/buried/invdata.h
	./engines/buried/inventory_info.h
	./engines/buried/inventory_window.h
	./engines/buried/livetext.h
	./engines/buried/main_menu.h
	./engines/buried/message.h
	./engines/buried/module.mk
	./engines/buried/navarrow.h
	./engines/buried/navdata.h
	./engines/buried/overview.h
	./engines/buried/resources.h
	./engines/buried/scene_view.h
	./engines/buried/snddata.h
	./engines/buried/sound.h
	./engines/buried/sprtdata.h
	./engines/buried/title_sequence.h
	./engines/buried/video_window.h
	./engines/buried/window.h
	./engines/cge/bitmap.h
	./engines/cge/cge.h
	./engines/cge/cge_main.h
	./engines/cge/console.h
	./engines/cge/detection.cpp
	./engines/cge/events.h
	./engines/cge/fileio.h
	./engines/cge/game.h
	./engines/cge/general.h
	./engines/cge/module.mk
	./engines/cge/snail.h
	./engines/cge/sound.h
	./engines/cge/talk.h
	./engines/cge/text.h
	./engines/cge/vga13h.h
	./engines/cge/vmenu.h
	./engines/cge/walk.h
	./engines/cge2/bitmap.h
	./engines/cge2/cge2.h
	./engines/cge2/cge2_main.h
	./engines/cge2/console.h
	./engines/cge2/detection.cpp
	./engines/cge2/events.h
	./engines/cge2/fileio.cpp ./engines/cge2/fileio.h
	./engines/cge2/general.h
	./engines/cge2/hero.h
	./engines/cge2/map.h
	./engines/cge2/module.mk
	./engines/cge2/snail.h
	./engines/cge2/sound.h
	./engines/cge2/spare.h
	./engines/cge2/talk.h
	./engines/cge2/text.h
	./engines/cge2/vga13h.h
	./engines/cge2/vmenu.h
	./engines/chewy/chewy.h
	./engines/chewy/console.h
	./engines/chewy/cursor.h
	./engines/chewy/detection.cpp ./engines/chewy/detection.h
	./engines/chewy/events.h
	./engines/chewy/graphics.h
	./engines/chewy/module.mk
	./engines/chewy/resource.h
	./engines/chewy/scene.h
	./engines/chewy/sound.h
	./engines/chewy/text.h
	./engines/cine/anim.h
	./engines/cine/bg.h
	./engines/cine/bg_list.h
	./engines/cine/cine.h
	./engines/cine/console.h
	./engines/cine/detection.cpp ./engines/cine/detection.h
	./engines/cine/detection_tables.h
	./engines/cine/gfx.h
	./engines/cine/main_loop.h
	./engines/cine/module.mk
	./engines/cine/msg.h
	./engines/cine/object.h
	./engines/cine/pal.h
	./engines/cine/part.h
	./engines/cine/prc.h
	./engines/cine/rel.h
	./engines/cine/saveload.h
	./engines/cine/script.h
	./engines/cine/sound.h
	./engines/cine/texte.h
	./engines/cine/unpack.h
	./engines/cine/various.h
	./engines/composer/composer.h
	./engines/composer/console.h
	./engines/composer/detection.cpp ./engines/composer/detection.h
	./engines/composer/detection_tables.h
	./engines/composer/graphics.h
	./engines/composer/module.mk
	./engines/composer/resource.h
	./engines/cruise/actor.h
	./engines/cruise/background.h
	./engines/cruise/backgroundIncrust.h
	./engines/cruise/cell.h
	./engines/cruise/cruise.h
	./engines/cruise/cruise_main.h
	./engines/cruise/ctp.h
	./engines/cruise/dataLoader.h
	./engines/cruise/debugger.h
	./engines/cruise/detection.cpp ./engines/cruise/detection.h
	./engines/cruise/font.h
	./engines/cruise/function.h
	./engines/cruise/gfxModule.h
	./engines/cruise/linker.h
	./engines/cruise/mainDraw.h
	./engines/cruise/menu.h
	./engines/cruise/module.mk
	./engines/cruise/mouse.h
	./engines/cruise/object.h
	./engines/cruise/overlay.h
	./engines/cruise/perso.h
	./engines/cruise/polys.h
	./engines/cruise/saveload.h
	./engines/cruise/script.h
	./engines/cruise/sound.h
	./engines/cruise/stack.h
	./engines/cruise/staticres.h
	./engines/cruise/various.h
	./engines/cruise/vars.h
	./engines/cruise/volume.h
	./engines/cryo/cryo.h
	./engines/cryo/cryolib.h
	./engines/cryo/debugger.h
	./engines/cryo/defs.h
	./engines/cryo/detection.cpp
	./engines/cryo/eden.h
	./engines/cryo/eden_graphics.h
	./engines/cryo/module.mk
	./engines/cryo/platdefs.h
	./engines/cryo/sound.h
	./engines/cryomni3d/cryomni3d.h
	./engines/cryomni3d/datstream.h
	./engines/cryomni3d/detection.cpp ./engines/cryomni3d/detection.h
	./engines/cryomni3d/detection_tables.h
	./engines/cryomni3d/dialogs_manager.h
	./engines/cryomni3d/fixed_image.h
	./engines/cryomni3d/font_manager.h
	./engines/cryomni3d/module.mk
	./engines/cryomni3d/mouse_boxes.h
	./engines/cryomni3d/objects.h
	./engines/cryomni3d/omni3d.h
	./engines/cryomni3d/sprites.h
	./engines/cryomni3d/wam_parser.h
	./engines/director/archive.h
	./engines/director/cast.h
	./engines/director/castmember.h
	./engines/director/channel.h
	./engines/director/cursor.h
	./engines/director/detection.cpp ./engines/director/detection.h
	./engines/director/detection_paths.h
	./engines/director/detection_tables.h
	./engines/director/director.h
	./engines/director/frame.h
	./engines/director/graphics-data.h
	./engines/director/images.h
	./engines/director/module.mk
	./engines/director/movie.h
	./engines/director/score.h
	./engines/director/sound.h
	./engines/director/sprite.h
	./engines/director/stxt.h
	./engines/director/types.h
	./engines/director/util.h
	./engines/director/window.h
	./engines/dm/champion.h
	./engines/dm/console.h
	./engines/dm/detection.cpp ./engines/dm/detection.h
	./engines/dm/dialog.h
	./engines/dm/dm.h
	./engines/dm/dungeonman.h
	./engines/dm/eventman.h
	./engines/dm/gfx.h
	./engines/dm/group.h
	./engines/dm/inventory.h
	./engines/dm/loadsave.h
	./engines/dm/lzw.h
	./engines/dm/menus.h
	./engines/dm/module.mk
	./engines/dm/movesens.h
	./engines/dm/objectman.h
	./engines/dm/projexpl.h
	./engines/dm/sounds.h
	./engines/dm/text.h
	./engines/dm/timeline.h
	./engines/draci/animation.h
	./engines/draci/barchive.h
	./engines/draci/console.h
	./engines/draci/detection.cpp
	./engines/draci/draci.h
	./engines/draci/font.h
	./engines/draci/game.h
	./engines/draci/module.mk
	./engines/draci/mouse.h
	./engines/draci/music.h
	./engines/draci/saveload.h
	./engines/draci/screen.h
	./engines/draci/script.h
	./engines/draci/sound.h
	./engines/draci/sprite.h
	./engines/draci/surface.h
	./engines/draci/walking.h
	./engines/dragons/actor.h
	./engines/dragons/actorfiles.h
	./engines/dragons/actorresource.h
	./engines/dragons/background.h
	./engines/dragons/bag.h
	./engines/dragons/bigfile.h
	./engines/dragons/credits.h
	./engines/dragons/cursor.h
	./engines/dragons/cutscene.h
	./engines/dragons/detection.cpp ./engines/dragons/detection.h
	./engines/dragons/dragonflg.h
	./engines/dragons/dragonimg.h
	./engines/dragons/dragonini.h
	./engines/dragons/dragonobd.h
	./engines/dragons/dragonrms.h
	./engines/dragons/dragons.h
	./engines/dragons/dragonvar.h
	./engines/dragons/font.h
	./engines/dragons/inventory.h
	./engines/dragons/midimusicplayer.h
	./engines/dragons/minigame1.h
	./engines/dragons/minigame2.h
	./engines/dragons/minigame3.h
	./engines/dragons/minigame4.h
	./engines/dragons/minigame5.h
	./engines/dragons/module.mk
	./engines/dragons/scene.h
	./engines/dragons/screen.h
	./engines/dragons/scriptopcodes.h
	./engines/dragons/sequenceopcodes.h
	./engines/dragons/sound.h
	./engines/dragons/specialopcodes.h
	./engines/dragons/strplayer.h
	./engines/dragons/talk.h
	./engines/dragons/vabsound.h
	./engines/drascula/console.h
	./engines/drascula/detection.cpp ./engines/drascula/detection.h
	./engines/drascula/drascula.h
	./engines/drascula/module.mk
	./engines/dreamweb/console.h
	./engines/dreamweb/detection.cpp ./engines/dreamweb/detection.h
	./engines/dreamweb/detection_tables.h
	./engines/dreamweb/dreamweb.h
	./engines/dreamweb/module.mk
	./engines/dreamweb/sound.h
	./engines/dreamweb/structs.h
	./engines/glk/adrift/adrift.h
	./engines/glk/adrift/detection.cpp ./engines/glk/adrift/detection.h
	./engines/glk/adrift/detection_tables.h
	./engines/glk/adrift/os_glk.h
	./engines/glk/adrift/scare.h
	./engines/glk/adrift/scgamest.h
	./engines/glk/adrift/scprotos.h
	./engines/glk/adrift/serialization.h
	./engines/glk/adrift/sxprotos.h
	./engines/glk/advsys/advsys.h
	./engines/glk/advsys/definitions.h
	./engines/glk/advsys/detection.cpp ./engines/glk/advsys/detection.h
	./engines/glk/advsys/detection_tables.h
	./engines/glk/advsys/game.cpp ./engines/glk/advsys/game.h
	./engines/glk/advsys/glk_interface.h
	./engines/glk/advsys/vm.h
	./engines/glk/agt/agility.h
	./engines/glk/agt/agt.h
	./engines/glk/agt/config.h
	./engines/glk/agt/detection.cpp ./engines/glk/agt/detection.h
	./engines/glk/agt/detection_tables.h
	./engines/glk/agt/exec.h
	./engines/glk/agt/interp.h
	./engines/glk/alan2/acode.h
	./engines/glk/alan2/alan2.h
	./engines/glk/alan2/alan_version.h
	./engines/glk/alan2/args.h
	./engines/glk/alan2/debug.h
	./engines/glk/alan2/decode.h
	./engines/glk/alan2/detection.cpp ./engines/glk/alan2/detection.h
	./engines/glk/alan2/detection_tables.h
	./engines/glk/alan2/exe.h
	./engines/glk/alan2/glkio.h
	./engines/glk/alan2/inter.h
	./engines/glk/alan2/main.h
	./engines/glk/alan2/params.h
	./engines/glk/alan2/parse.h
	./engines/glk/alan2/reverse.h
	./engines/glk/alan2/rules.h
	./engines/glk/alan2/stack.h
	./engines/glk/alan2/sysdep.h
	./engines/glk/alan2/types.h
	./engines/glk/alan2/version.h
	./engines/glk/alan3/acode.h
	./engines/glk/alan3/act.h
	./engines/glk/alan3/actor.h
	./engines/glk/alan3/alan3.h
	./engines/glk/alan3/alan_version.h
	./engines/glk/alan3/alt_info.h
	./engines/glk/alan3/attribute.h
	./engines/glk/alan3/checkentry.h
	./engines/glk/alan3/class.h
	./engines/glk/alan3/compatibility.h
	./engines/glk/alan3/container.h
	./engines/glk/alan3/current.h
	./engines/glk/alan3/debug.h
	./engines/glk/alan3/decode.h
	./engines/glk/alan3/detection.cpp ./engines/glk/alan3/detection.h
	./engines/glk/alan3/detection_tables.h
	./engines/glk/alan3/dictionary.h
	./engines/glk/alan3/event.h
	./engines/glk/alan3/exe.h
	./engines/glk/alan3/fnmatch.h
	./engines/glk/alan3/glkio.h
	./engines/glk/alan3/instance.h
	./engines/glk/alan3/inter.h
	./engines/glk/alan3/lists.h
	./engines/glk/alan3/literal.h
	./engines/glk/alan3/location.h
	./engines/glk/alan3/main.h
	./engines/glk/alan3/memory.h
	./engines/glk/alan3/msg.h
	./engines/glk/alan3/options.h
	./engines/glk/alan3/output.h
	./engines/glk/alan3/parameter_position.h
	./engines/glk/alan3/params.h
	./engines/glk/alan3/parse.h
	./engines/glk/alan3/resources.h
	./engines/glk/alan3/reverse.h
	./engines/glk/alan3/rules.h
	./engines/glk/alan3/save.h
	./engines/glk/alan3/scan.h
	./engines/glk/alan3/score.h
	./engines/glk/alan3/set.h
	./engines/glk/alan3/stack.h
	./engines/glk/alan3/state.h
	./engines/glk/alan3/state_stack.h
	./engines/glk/alan3/syntax.h
	./engines/glk/alan3/sysdep.h
	./engines/glk/alan3/syserr.h
	./engines/glk/alan3/types.h
	./engines/glk/alan3/utils.h
	./engines/glk/alan3/version.h
	./engines/glk/alan3/word.h
	./engines/glk/archetype/archetype.h
	./engines/glk/archetype/array.h
	./engines/glk/archetype/crypt.h
	./engines/glk/archetype/detection.cpp ./engines/glk/archetype/detection.h
	./engines/glk/archetype/detection_tables.h
	./engines/glk/archetype/error.h
	./engines/glk/archetype/expression.h
	./engines/glk/archetype/game_stat.h
	./engines/glk/archetype/heap_sort.h
	./engines/glk/archetype/id_table.h
	./engines/glk/archetype/interpreter.h
	./engines/glk/archetype/keywords.h
	./engines/glk/archetype/linked_list.h
	./engines/glk/archetype/misc.h
	./engines/glk/archetype/parser.h
	./engines/glk/archetype/saveload.h
	./engines/glk/archetype/semantic.h
	./engines/glk/archetype/statement.h
	./engines/glk/archetype/string.h
	./engines/glk/archetype/sys_object.h
	./engines/glk/archetype/timestamp.h
	./engines/glk/archetype/token.h
	./engines/glk/comprehend/charset.h
	./engines/glk/comprehend/comprehend.h
	./engines/glk/comprehend/debugger.h
	./engines/glk/comprehend/debugger_dumper.h
	./engines/glk/comprehend/detection.cpp ./engines/glk/comprehend/detection.h
	./engines/glk/comprehend/detection_tables.h
	./engines/glk/comprehend/dictionary.h
	./engines/glk/comprehend/draw_surface.h
	./engines/glk/comprehend/file_buf.h
	./engines/glk/comprehend/game.h
	./engines/glk/comprehend/game_cc.h
	./engines/glk/comprehend/game_data.h
	./engines/glk/comprehend/game_oo.h
	./engines/glk/comprehend/game_opcodes.h
	./engines/glk/comprehend/game_tm.h
	./engines/glk/comprehend/game_tr1.h
	./engines/glk/comprehend/game_tr2.h
	./engines/glk/comprehend/pics.h
	./engines/glk/glulx/detection.cpp ./engines/glk/glulx/detection.h
	./engines/glk/glulx/detection_tables.h
	./engines/glk/glulx/float.h
	./engines/glk/glulx/glulx.h
	./engines/glk/glulx/glulx_types.h
	./engines/glk/hugo/detection.cpp ./engines/glk/hugo/detection.h
	./engines/glk/hugo/detection_tables.h
	./engines/glk/hugo/htokens.h
	./engines/glk/hugo/hugo.h
	./engines/glk/hugo/hugo_defines.h
	./engines/glk/hugo/hugo_types.h
	./engines/glk/hugo/resource_archive.h
	./engines/glk/hugo/stringfn.h
	./engines/glk/jacl/constants.h
	./engines/glk/jacl/csv.h
	./engines/glk/jacl/detection.cpp ./engines/glk/jacl/detection.h
	./engines/glk/jacl/detection_tables.h
	./engines/glk/jacl/jacl.h
	./engines/glk/jacl/language.h
	./engines/glk/jacl/prototypes.h
	./engines/glk/jacl/types.h
	./engines/glk/jacl/version.h
	./engines/glk/level9/detection.cpp ./engines/glk/level9/detection.h
	./engines/glk/level9/detection_tables.h
	./engines/glk/level9/level9.h
	./engines/glk/level9/level9_main.h
	./engines/glk/level9/os_glk.h
	./engines/glk/magnetic/detection.cpp ./engines/glk/magnetic/detection.h
	./engines/glk/magnetic/detection_tables.h
	./engines/glk/magnetic/magnetic.h
	./engines/glk/magnetic/magnetic_defs.h
	./engines/glk/magnetic/magnetic_types.h
	./engines/glk/quest/detection.cpp ./engines/glk/quest/detection.h
	./engines/glk/quest/detection_tables.h
	./engines/glk/quest/geas_file.h
	./engines/glk/quest/geas_glk.h
	./engines/glk/quest/geas_impl.h
	./engines/glk/quest/geas_runner.h
	./engines/glk/quest/geas_state.h
	./engines/glk/quest/geas_util.h
	./engines/glk/quest/limit_stack.h
	./engines/glk/quest/quest.h
	./engines/glk/quest/read_file.h
	./engines/glk/quest/reserved_words.h
	./engines/glk/quest/streams.h
	./engines/glk/quest/string.h
	./engines/glk/scott/detection.cpp ./engines/glk/scott/detection.h
	./engines/glk/scott/detection_tables.h
	./engines/glk/scott/scott.h
	./engines/glk/tads/detection.cpp ./engines/glk/tads/detection.h
	./engines/glk/tads/detection_tables.h
	./engines/glk/tads/os_banners.h
	./engines/glk/tads/os_buffer.h
	./engines/glk/tads/os_filetype.h
	./engines/glk/tads/os_frob_tads.h
	./engines/glk/tads/os_glk.h
	./engines/glk/tads/os_parse.h
	./engines/glk/tads/tads.h
	./engines/glk/zcode/bitmap_font.h
	./engines/glk/zcode/config.h
	./engines/glk/zcode/detection.cpp ./engines/glk/zcode/detection.h
	./engines/glk/zcode/detection_tables.h
	./engines/glk/zcode/frotz_types.h
	./engines/glk/zcode/glk_interface.h
	./engines/glk/zcode/mem.h
	./engines/glk/zcode/pics.h
	./engines/glk/zcode/pics_decoder.h
	./engines/glk/zcode/processor.h
	./engines/glk/zcode/quetzal.h
	./engines/glk/zcode/screen.h
	./engines/glk/zcode/sound_folder.h
	./engines/glk/zcode/windows.h
	./engines/glk/zcode/zcode.h
	./engines/glk/blorb.cpp ./engines/glk/blorb.h
	./engines/glk/conf.h
	./engines/glk/debugger.h
	./engines/glk/detection.cpp ./engines/glk/detection.h
	./engines/glk/events.h
	./engines/glk/fonts.h
	./engines/glk/game_description.h
	./engines/glk/glk.h
	./engines/glk/glk_api.h
	./engines/glk/glk_types.h
	./engines/glk/jumps.h
	./engines/glk/module.mk
	./engines/glk/pc_speaker.h
	./engines/glk/picture.h
	./engines/glk/quetzal.h
	./engines/glk/raw_decoder.h
	./engines/glk/screen.h
	./engines/glk/selection.h
	./engines/glk/sound.h
	./engines/glk/speech.h
	./engines/glk/streams.h
	./engines/glk/time.h
	./engines/glk/unicode.h
	./engines/glk/unicode_gen.h
	./engines/glk/utils.h
	./engines/glk/window_graphics.h
	./engines/glk/window_pair.h
	./engines/glk/window_text_buffer.h
	./engines/glk/window_text_grid.h
	./engines/glk/windows.h
	./engines/gnap/character.h
	./engines/gnap/datarchive.h
	./engines/gnap/debugger.h
	./engines/gnap/detection.cpp
	./engines/gnap/fontdata.h
	./engines/gnap/gamesys.h
	./engines/gnap/gnap.h
	./engines/gnap/module.mk
	./engines/gnap/music.h
	./engines/gnap/resource.h
	./engines/gnap/sound.h
	./engines/gob/detection/detection.cpp ./engines/gob/detection/detection.h
	./engines/gob/detection/tables.h
	./engines/gob/detection/tables_adi2.h
	./engines/gob/detection/tables_adi4.h
	./engines/gob/detection/tables_adibou.h
	./engines/gob/detection/tables_ajworld.h
	./engines/gob/detection/tables_bargon.h
	./engines/gob/detection/tables_crousti.h
	./engines/gob/detection/tables_dynasty.h
	./engines/gob/detection/tables_fallback.h
	./engines/gob/detection/tables_fascin.h
	./engines/gob/detection/tables_geisha.h
	./engines/gob/detection/tables_gob1.h
	./engines/gob/detection/tables_gob2.h
	./engines/gob/detection/tables_gob3.h
	./engines/gob/detection/tables_inca2.h
	./engines/gob/detection/tables_lit.h
	./engines/gob/detection/tables_littlered.h
	./engines/gob/detection/tables_onceupon.h
	./engines/gob/detection/tables_playtoons.h
	./engines/gob/detection/tables_urban.h
	./engines/gob/detection/tables_ween.h
	./engines/gob/detection/tables_woodruff.h
	./engines/gob/anifile.h
	./engines/gob/aniobject.h
	./engines/gob/backbuffer.h
	./engines/gob/cheater.h
	./engines/gob/cmpfile.h
	./engines/gob/console.h
	./engines/gob/databases.h
	./engines/gob/dataio.h
	./engines/gob/dbase.h
	./engines/gob/decfile.h
	./engines/gob/draw.h
	./engines/gob/expression.h
	./engines/gob/game.h
	./engines/gob/global.h
	./engines/gob/gob.h
	./engines/gob/goblin.h
	./engines/gob/hotspots.h
	./engines/gob/iniconfig.h
	./engines/gob/init.h
	./engines/gob/inter.h
	./engines/gob/map.h
	./engines/gob/module.mk
	./engines/gob/mult.h
	./engines/gob/palanim.h
	./engines/gob/resources.h
	./engines/gob/rxyfile.h
	./engines/gob/scenery.h
	./engines/gob/script.h
	./engines/gob/surface.h
	./engines/gob/totfile.h
	./engines/gob/util.h
	./engines/gob/variables.h
	./engines/gob/video.h
	./engines/gob/videoplayer.h
	./engines/griffon/console.h
	./engines/griffon/detection.cpp
	./engines/griffon/griffon.h
	./engines/griffon/module.mk
	./engines/grim/actor.h
	./engines/grim/animation.h
	./engines/grim/bitmap.h
	./engines/grim/color.h
	./engines/grim/colormap.h
	./engines/grim/costume.h
	./engines/grim/cursor.h
	./engines/grim/debug.h
	./engines/grim/debugger.h
	./engines/grim/detection.cpp ./engines/grim/detection.h
	./engines/grim/font.h
	./engines/grim/gfx_base.h
	./engines/grim/gfx_opengl.h
	./engines/grim/gfx_opengl_shaders.h
	./engines/grim/gfx_tinygl.h
	./engines/grim/grim.h
	./engines/grim/hotspot.h
	./engines/grim/inputdialog.h
	./engines/grim/iris.h
	./engines/grim/keyframe.h
	./engines/grim/lab.h
	./engines/grim/lipsync.h
	./engines/grim/localize.h
	./engines/grim/lua.h
	./engines/grim/lua_v1.h
	./engines/grim/material.h
	./engines/grim/md5check.h
	./engines/grim/md5checkdialog.h
	./engines/grim/model.h
	./engines/grim/module.mk
	./engines/grim/object.h
	./engines/grim/objectstate.h
	./engines/grim/patchr.h
	./engines/grim/pool.h
	./engines/grim/primitives.h
	./engines/grim/registry.h
	./engines/grim/resource.h
	./engines/grim/savegame.h
	./engines/grim/sector.h
	./engines/grim/set.h
	./engines/grim/sound.h
	./engines/grim/sprite.h
	./engines/grim/textobject.h
	./engines/grim/textsplit.h
	./engines/groovie/cursor.h
	./engines/groovie/debug.h
	./engines/groovie/detection.cpp ./engines/groovie/detection.h
	./engines/groovie/font.h
	./engines/groovie/graphics.h
	./engines/groovie/groovie.h
	./engines/groovie/lzss.h
	./engines/groovie/module.mk
	./engines/groovie/music.h
	./engines/groovie/resource.h
	./engines/groovie/saveload.h
	./engines/groovie/script.h
	./engines/hadesch/ambient.h
	./engines/hadesch/baptr.h
	./engines/hadesch/detection.cpp
	./engines/hadesch/detection_tables.h
	./engines/hadesch/enums.h
	./engines/hadesch/event.h
	./engines/hadesch/gfx_context.h
	./engines/hadesch/hadesch.h
	./engines/hadesch/herobelt.h
	./engines/hadesch/hotzone.h
	./engines/hadesch/module.mk
	./engines/hadesch/persistent.h
	./engines/hadesch/pod_file.h
	./engines/hadesch/pod_image.h
	./engines/hadesch/table.h
	./engines/hadesch/tag_file.h
	./engines/hadesch/video.h
	./engines/hdb/ai-player.h
	./engines/hdb/ai.h
	./engines/hdb/detection.cpp ./engines/hdb/detection.h
	./engines/hdb/file-manager.h
	./engines/hdb/gfx.h
	./engines/hdb/hdb.h
	./engines/hdb/input.h
	./engines/hdb/lua-script.h
	./engines/hdb/map.h
	./engines/hdb/menu.h
	./engines/hdb/module.mk
	./engines/hdb/mpc.h
	./engines/hdb/sound.h
	./engines/hdb/window.h
	./engines/hopkins/anim.h
	./engines/hopkins/computer.h
	./engines/hopkins/debugger.h
	./engines/hopkins/detection.cpp ./engines/hopkins/detection.h
	./engines/hopkins/detection_tables.h
	./engines/hopkins/dialogs.h
	./engines/hopkins/events.h
	./engines/hopkins/files.h
	./engines/hopkins/font.h
	./engines/hopkins/globals.h
	./engines/hopkins/graphics.h
	./engines/hopkins/hopkins.h
	./engines/hopkins/lines.h
	./engines/hopkins/menu.h
	./engines/hopkins/module.mk
	./engines/hopkins/objects.h
	./engines/hopkins/saveload.h
	./engines/hopkins/script.h
	./engines/hopkins/sound.h
	./engines/hopkins/talk.h
	./engines/hugo/console.h
	./engines/hugo/detection.cpp ./engines/hugo/detection.h
	./engines/hugo/dialogs.h
	./engines/hugo/display.h
	./engines/hugo/file.h
	./engines/hugo/game.h
	./engines/hugo/hugo.h
	./engines/hugo/intro.h
	./engines/hugo/inventory.h
	./engines/hugo/module.mk
	./engines/hugo/mouse.h
	./engines/hugo/object.h
	./engines/hugo/parser.h
	./engines/hugo/route.h
	./engines/hugo/schedule.h
	./engines/hugo/sound.h
	./engines/hugo/text.h
	./engines/hugo/util.h
	./engines/hypno/detection.cpp
	./engines/hypno/grammar.h
	./engines/hypno/hypno.h
	./engines/hypno/libfile.h
	./engines/hypno/module.mk
	./engines/hypno/tokens_arc.h
	./engines/hypno/tokens_mis.h
	./engines/icb/actor.h
	./engines/icb/actor_pc.h
	./engines/icb/actor_view_pc.h
	./engines/icb/animation_mega_set.h
	./engines/icb/barriers.h
	./engines/icb/bone.h
	./engines/icb/breath.h
	./engines/icb/cluster_manager_pc.h
	./engines/icb/configfile.h
	./engines/icb/custom_logics.h
	./engines/icb/debug.h
	./engines/icb/debug_pc.h
	./engines/icb/detection.cpp
	./engines/icb/direct_input.h
	./engines/icb/drawpoly_pc.h
	./engines/icb/event_list.h
	./engines/icb/event_manager.h
	./engines/icb/event_timer.h
	./engines/icb/floors.h
	./engines/icb/fn_routines.h
	./engines/icb/game_script.h
	./engines/icb/game_volume.h
	./engines/icb/gameover.h
	./engines/icb/global_objects.h
	./engines/icb/global_objects_pc.h
	./engines/icb/global_objects_psx.h
	./engines/icb/global_switches.h
	./engines/icb/global_vars.h
	./engines/icb/graphic_prims.h
	./engines/icb/icb.h
	./engines/icb/icon_list.h
	./engines/icb/icon_list_manager.h
	./engines/icb/icon_menu.h
	./engines/icb/icon_menu_pc.h
	./engines/icb/jpeg_decode.h
	./engines/icb/keyboard.h
	./engines/icb/light.h
	./engines/icb/light_pc.h
	./engines/icb/line_of_sight.h
	./engines/icb/loadscrn.h
	./engines/icb/main_menu.h
	./engines/icb/map_marker.h
	./engines/icb/mission.h
	./engines/icb/mission_functions.h
	./engines/icb/module.mk
	./engines/icb/mouse.h
	./engines/icb/movie_pc.h
	./engines/icb/non_ad_module.h
	./engines/icb/object_structs.h
	./engines/icb/options_manager_pc.h
	./engines/icb/p4.h
	./engines/icb/p4_generic.h
	./engines/icb/p4_generic_pc.h
	./engines/icb/player.h
	./engines/icb/prim_route_builder.h
	./engines/icb/protocol.h
	./engines/icb/remora.h
	./engines/icb/remora_pc.h
	./engines/icb/remora_sprite.h
	./engines/icb/res_man.h
	./engines/icb/res_man_pc.h
	./engines/icb/route_manager.h
	./engines/icb/session.h
	./engines/icb/set.h
	./engines/icb/set_pc.h
	./engines/icb/shade.h
	./engines/icb/shade_pc.h
	./engines/icb/shadow.h
	./engines/icb/shadow_pc.h
	./engines/icb/shake.h
	./engines/icb/softskin_pc.h
	./engines/icb/sound.h
	./engines/icb/sound_logic.h
	./engines/icb/sound_logic_entry.h
	./engines/icb/sound_lowlevel.h
	./engines/icb/speech.h
	./engines/icb/stage_draw.h
	./engines/icb/stage_view.h
	./engines/icb/string_vest.h
	./engines/icb/surface_manager.h
	./engines/icb/text.h
	./engines/icb/text_sprites.h
	./engines/icb/timer_func.h
	./engines/icb/tracer.h
	./engines/icb/zsupport.h
	./engines/illusions/actor.h
	./engines/illusions/camera.h
	./engines/illusions/cursor.h
	./engines/illusions/detection.cpp ./engines/illusions/detection.h
	./engines/illusions/dictionary.h
	./engines/illusions/fileresourcereader.h
	./engines/illusions/fixedpoint.h
	./engines/illusions/gamarchive.h
	./engines/illusions/gamestate.h
	./engines/illusions/gamresourcereader.h
	./engines/illusions/graphics.h
	./engines/illusions/illusions.h
	./engines/illusions/input.h
	./engines/illusions/menusystem.h
	./engines/illusions/module.mk
	./engines/illusions/pathfinder.h
	./engines/illusions/resourcereader.h
	./engines/illusions/resourcesystem.h
	./engines/illusions/screen.h
	./engines/illusions/screentext.h
	./engines/illusions/scriptopcodes.h
	./engines/illusions/scriptstack.h
	./engines/illusions/sequenceopcodes.h
	./engines/illusions/sound.h
	./engines/illusions/specialcode.h
	./engines/illusions/textdrawer.h
	./engines/illusions/thread.h
	./engines/illusions/time.h
	./engines/illusions/updatefunctions.h
	./engines/kingdom/console.h
	./engines/kingdom/detection.cpp
	./engines/kingdom/kingdom.h
	./engines/kingdom/logic.h
	./engines/kingdom/module.mk
	./engines/kyra/detection.cpp ./engines/kyra/detection.h
	./engines/kyra/detection_tables.h
	./engines/kyra/kyra_v1.h
	./engines/kyra/module.mk
	./engines/lab/anim.h
	./engines/lab/console.h
	./engines/lab/detection.cpp ./engines/lab/detection.h
	./engines/lab/dispman.h
	./engines/lab/eventman.h
	./engines/lab/image.h
	./engines/lab/interface.h
	./engines/lab/intro.h
	./engines/lab/lab.h
	./engines/lab/labsets.h
	./engines/lab/module.mk
	./engines/lab/music.h
	./engines/lab/processroom.h
	./engines/lab/resource.h
	./engines/lab/speciallocks.h
	./engines/lab/utils.h
	./engines/lastexpress/debug.h
	./engines/lastexpress/detection.cpp
	./engines/lastexpress/drawable.h
	./engines/lastexpress/eventhandler.h
	./engines/lastexpress/graphics.h
	./engines/lastexpress/helpers.h
	./engines/lastexpress/lastexpress.h
	./engines/lastexpress/module.mk
	./engines/lastexpress/resource.h
	./engines/lastexpress/shared.h
	./engines/lilliput/console.h
	./engines/lilliput/detection.cpp ./engines/lilliput/detection.h
	./engines/lilliput/lilliput.h
	./engines/lilliput/module.mk
	./engines/lilliput/script.h
	./engines/lilliput/sound.h
	./engines/lilliput/stream.h
	./engines/lure/animseq.h
	./engines/lure/debugger.h
	./engines/lure/decode.h
	./engines/lure/detection.cpp ./engines/lure/detection.h
	./engines/lure/disk.h
	./engines/lure/events.h
	./engines/lure/fights.h
	./engines/lure/game.h
	./engines/lure/hotspots.h
	./engines/lure/intro.h
	./engines/lure/lure.h
	./engines/lure/luredefs.h
	./engines/lure/memory.h
	./engines/lure/menu.h
	./engines/lure/module.mk
	./engines/lure/palette.h
	./engines/lure/res.h
	./engines/lure/res_struct.h
	./engines/lure/room.h
	./engines/lure/screen.h
	./engines/lure/scripts.h
	./engines/lure/sound.h
	./engines/lure/strings.h
	./engines/lure/surface.h
	./engines/macventure/container.h
	./engines/macventure/controls.h
	./engines/macventure/debug.h
	./engines/macventure/detection.cpp
	./engines/macventure/dialog.h
	./engines/macventure/gui.h
	./engines/macventure/hufflists.h
	./engines/macventure/image.h
	./engines/macventure/macventure.h
	./engines/macventure/module.mk
	./engines/macventure/prebuilt_dialogs.h
	./engines/macventure/script.h
	./engines/macventure/sound.h
	./engines/macventure/stringtable.h
	./engines/macventure/text.h
	./engines/macventure/windows.h
	./engines/macventure/world.h
	./engines/made/console.h
	./engines/made/database.h
	./engines/made/detection.cpp ./engines/made/detection.h
	./engines/made/detection_tables.h
	./engines/made/graphics.h
	./engines/made/made.h
	./engines/made/module.mk
	./engines/made/music.h
	./engines/made/pmvplayer.h
	./engines/made/redreader.h
	./engines/made/resource.h
	./engines/made/screen.h
	./engines/made/screenfx.h
	./engines/made/script.h
	./engines/made/scriptfuncs.h
	./engines/made/sound.h
	./engines/mads/action.h
	./engines/mads/animation.h
	./engines/mads/assets.h
	./engines/mads/audio.h
	./engines/mads/camera.h
	./engines/mads/compression.h
	./engines/mads/conversations.h
	./engines/mads/debugger.h
	./engines/mads/detection.cpp ./engines/mads/detection.h
	./engines/mads/detection_tables.h
	./engines/mads/dialogs.h
	./engines/mads/events.h
	./engines/mads/font.h
	./engines/mads/game.h
	./engines/mads/game_data.h
	./engines/mads/globals.h
	./engines/mads/hotspots.h
	./engines/mads/inventory.h
	./engines/mads/mads.h
	./engines/mads/menu_views.h
	./engines/mads/messages.h
	./engines/mads/module.mk
	./engines/mads/msurface.h
	./engines/mads/palette.h
	./engines/mads/player.h
	./engines/mads/rails.h
	./engines/mads/resources.h
	./engines/mads/scene.h
	./engines/mads/scene_data.h
	./engines/mads/screen.h
	./engines/mads/sequence.h
	./engines/mads/sound.h
	./engines/mads/sprites.h
	./engines/mads/staticres.h
	./engines/mads/user_interface.h
	./engines/mohawk/bitmap.h
	./engines/mohawk/console.h
	./engines/mohawk/cstime.h
	./engines/mohawk/cstime_cases.h
	./engines/mohawk/cstime_game.h
	./engines/mohawk/cstime_graphics.h
	./engines/mohawk/cstime_ui.h
	./engines/mohawk/cstime_view.h
	./engines/mohawk/cursors.h
	./engines/mohawk/detection.cpp ./engines/mohawk/detection.h
	./engines/mohawk/detection_tables.h
	./engines/mohawk/dialogs.h
	./engines/mohawk/graphics.h
	./engines/mohawk/installer_archive.h
	./engines/mohawk/livingbooks.h
	./engines/mohawk/livingbooks_code.h
	./engines/mohawk/livingbooks_graphics.h
	./engines/mohawk/livingbooks_lbx.h
	./engines/mohawk/module.mk
	./engines/mohawk/mohawk.h
	./engines/mohawk/myst.h
	./engines/mohawk/myst_actions.h
	./engines/mohawk/myst_areas.h
	./engines/mohawk/myst_card.h
	./engines/mohawk/myst_graphics.h
	./engines/mohawk/myst_metaengine.cpp ./engines/mohawk/myst_metaengine.h
	./engines/mohawk/myst_scripts.h
	./engines/mohawk/myst_sound.h
	./engines/mohawk/myst_state.h
	./engines/mohawk/resource.h
	./engines/mohawk/resource_cache.h
	./engines/mohawk/riven.h
	./engines/mohawk/riven_actions.h
	./engines/mohawk/riven_card.h
	./engines/mohawk/riven_graphics.h
	./engines/mohawk/riven_graphics_detection_enums.h
	./engines/mohawk/riven_inventory.h
	./engines/mohawk/riven_metaengine.cpp ./engines/mohawk/riven_metaengine.h
	./engines/mohawk/riven_saveload.h
	./engines/mohawk/riven_scripts.h
	./engines/mohawk/riven_sound.h
	./engines/mohawk/riven_stack.h
	./engines/mohawk/riven_video.h
	./engines/mohawk/sound.h
	./engines/mohawk/video.h
	./engines/mohawk/view.h
	./engines/mortevielle/debugger.h
	./engines/mortevielle/detection.cpp ./engines/mortevielle/detection.h
	./engines/mortevielle/detection_tables.h
	./engines/mortevielle/dialogs.h
	./engines/mortevielle/graphics.h
	./engines/mortevielle/menu.h
	./engines/mortevielle/module.mk
	./engines/mortevielle/mortevielle.h
	./engines/mortevielle/mouse.h
	./engines/mortevielle/outtext.h
	./engines/mortevielle/saveload.h
	./engines/mortevielle/sound.h
	./engines/mutationofjb/animationdecoder.h
	./engines/mutationofjb/assets.h
	./engines/mutationofjb/conversationlinelist.h
	./engines/mutationofjb/debug.h
	./engines/mutationofjb/detection.cpp
	./engines/mutationofjb/encryptedfile.h
	./engines/mutationofjb/font.h
	./engines/mutationofjb/game.h
	./engines/mutationofjb/gamedata.h
	./engines/mutationofjb/gamescreen.h
	./engines/mutationofjb/guiscreen.h
	./engines/mutationofjb/hardcodedstrings.h
	./engines/mutationofjb/inventory.h
	./engines/mutationofjb/inventoryitemdefinitionlist.h
	./engines/mutationofjb/module.mk
	./engines/mutationofjb/mutationofjb.h
	./engines/mutationofjb/room.h
	./engines/mutationofjb/script.h
	./engines/mutationofjb/timer.h
	./engines/mutationofjb/util.h
	./engines/myst3/ambient.h
	./engines/myst3/archive.h
	./engines/myst3/console.h
	./engines/myst3/cursor.h
	./engines/myst3/database.h
	./engines/myst3/detection.cpp ./engines/myst3/detection.h
	./engines/myst3/effects.h
	./engines/myst3/gfx.h
	./engines/myst3/gfx_opengl.h
	./engines/myst3/gfx_opengl_shaders.h
	./engines/myst3/gfx_opengl_texture.h
	./engines/myst3/gfx_tinygl.h
	./engines/myst3/gfx_tinygl_texture.h
	./engines/myst3/hotspot.h
	./engines/myst3/inventory.h
	./engines/myst3/menu.h
	./engines/myst3/module.mk
	./engines/myst3/movie.h
	./engines/myst3/myst3.h
	./engines/myst3/node.h
	./engines/myst3/nodecube.h
	./engines/myst3/nodeframe.h
	./engines/myst3/puzzles.h
	./engines/myst3/scene.h
	./engines/myst3/script.h
	./engines/myst3/sound.h
	./engines/myst3/state.h
	./engines/myst3/subtitles.h
	./engines/myst3/transition.h
	./engines/nancy/commontypes.h
	./engines/nancy/console.h
	./engines/nancy/constants.h
	./engines/nancy/cursor.h
	./engines/nancy/decompress.h
	./engines/nancy/detection.cpp ./engines/nancy/detection.h
	./engines/nancy/dialogs.h
	./engines/nancy/dialogueresponses.h
	./engines/nancy/font.h
	./engines/nancy/graphics.h
	./engines/nancy/iff.h
	./engines/nancy/input.h
	./engines/nancy/module.mk
	./engines/nancy/nancy.h
	./engines/nancy/renderobject.h
	./engines/nancy/resource.h
	./engines/nancy/sound.h
	./engines/nancy/time.h
	./engines/nancy/util.h
	./engines/nancy/video.h
	./engines/neverhood/background.h
	./engines/neverhood/blbarchive.h
	./engines/neverhood/console.h
	./engines/neverhood/detection.cpp ./engines/neverhood/detection.h
	./engines/neverhood/diskplayerscene.h
	./engines/neverhood/entity.h
	./engines/neverhood/gamemodule.h
	./engines/neverhood/gamevars.h
	./engines/neverhood/graphics.h
	./engines/neverhood/klaymen.h
	./engines/neverhood/menumodule.h
	./engines/neverhood/messages.h
	./engines/neverhood/microtiles.h
	./engines/neverhood/module.h ./engines/neverhood/module.mk
	./engines/neverhood/mouse.h
	./engines/neverhood/navigationscene.h
	./engines/neverhood/neverhood.h
	./engines/neverhood/palette.h
	./engines/neverhood/resource.h
	./engines/neverhood/resourceman.h
	./engines/neverhood/scene.h
	./engines/neverhood/screen.h
	./engines/neverhood/smackerplayer.h
	./engines/neverhood/smackerscene.h
	./engines/neverhood/sound.h
	./engines/neverhood/sprite.h
	./engines/neverhood/staticdata.h
	./engines/ngi/anihandler.h
	./engines/ngi/behavior.h
	./engines/ngi/console.h
	./engines/ngi/constants.h
	./engines/ngi/detection.cpp ./engines/ngi/detection.h
	./engines/ngi/floaters.h
	./engines/ngi/gameloader.h
	./engines/ngi/gfx.h
	./engines/ngi/input.h
	./engines/ngi/interaction.h
	./engines/ngi/inventory.h
	./engines/ngi/messages.h
	./engines/ngi/modal.h
	./engines/ngi/module.mk
	./engines/ngi/motion.h
	./engines/ngi/ngi.h
	./engines/ngi/ngiarchive.h
	./engines/ngi/objectnames.h
	./engines/ngi/objects.h
	./engines/ngi/scene.h
	./engines/ngi/scenes.h
	./engines/ngi/sound.h
	./engines/ngi/statics.h
	./engines/ngi/utils.h
	./engines/parallaction/debug.h
	./engines/parallaction/detection.cpp ./engines/parallaction/detection.h
	./engines/parallaction/disk.h
	./engines/parallaction/exec.h
	./engines/parallaction/graphics.h
	./engines/parallaction/gui.h
	./engines/parallaction/input.h
	./engines/parallaction/inventory.h
	./engines/parallaction/module.mk
	./engines/parallaction/objects.h
	./engines/parallaction/parallaction.h
	./engines/parallaction/parser.h
	./engines/parallaction/saveload.h
	./engines/parallaction/sound.h
	./engines/parallaction/walk.h
	./engines/pegasus/chase.h
	./engines/pegasus/compass.h
	./engines/pegasus/console.h
	./engines/pegasus/constants.h
	./engines/pegasus/cursor.h
	./engines/pegasus/detection.cpp ./engines/pegasus/detection.h
	./engines/pegasus/elements.h
	./engines/pegasus/energymonitor.h
	./engines/pegasus/fader.h
	./engines/pegasus/gamestate.h
	./engines/pegasus/graphics.h
	./engines/pegasus/hotspot.h
	./engines/pegasus/input.h
	./engines/pegasus/interaction.h
	./engines/pegasus/interface.h
	./engines/pegasus/menu.h
	./engines/pegasus/module.mk
	./engines/pegasus/movie.h
	./engines/pegasus/notification.h
	./engines/pegasus/pegasus.h
	./engines/pegasus/scoring.h
	./engines/pegasus/sound.h
	./engines/pegasus/surface.h
	./engines/pegasus/timers.h
	./engines/pegasus/transition.h
	./engines/pegasus/types.h
	./engines/pegasus/util.h
	./engines/petka/base.h
	./engines/petka/big_dialogue.h
	./engines/petka/detection.cpp
	./engines/petka/detection_tables.h
	./engines/petka/file_mgr.h
	./engines/petka/flc.h
	./engines/petka/module.mk
	./engines/petka/petka.h
	./engines/petka/q_manager.h
	./engines/petka/q_system.h
	./engines/petka/sound.h
	./engines/petka/video.h
	./engines/petka/walk.h
	./engines/pink/archive.h
	./engines/pink/audio_info_mgr.h
	./engines/pink/cel_decoder.h
	./engines/pink/console.h
	./engines/pink/constants.h
	./engines/pink/cursor_mgr.h
	./engines/pink/detection.cpp
	./engines/pink/detection_tables.h
	./engines/pink/director.h
	./engines/pink/file.h
	./engines/pink/module.mk
	./engines/pink/pda_mgr.h
	./engines/pink/pink.h
	./engines/pink/resource_mgr.h
	./engines/pink/sound.h
	./engines/pink/utils.h
	./engines/playground3d/detection.cpp
	./engines/playground3d/gfx.h
	./engines/playground3d/gfx_opengl.h
	./engines/playground3d/gfx_opengl_shaders.h
	./engines/playground3d/gfx_tinygl.h
	./engines/playground3d/module.mk
	./engines/playground3d/playground3d.h
	./engines/plumbers/console.h
	./engines/plumbers/detection.cpp
	./engines/plumbers/module.mk
	./engines/plumbers/plumbers.h
	./engines/prince/animation.h
	./engines/prince/archive.h
	./engines/prince/common.h
	./engines/prince/cursor.h
	./engines/prince/curve_values.h
	./engines/prince/debugger.h
	./engines/prince/decompress.h
	./engines/prince/detection.cpp ./engines/prince/detection.h
	./engines/prince/flags.h
	./engines/prince/font.h
	./engines/prince/graphics.h
	./engines/prince/hero.h
	./engines/prince/hero_set.h
	./engines/prince/mhwanh.h
	./engines/prince/mob.h
	./engines/prince/module.mk
	./engines/prince/musNum.h
	./engines/prince/music.h
	./engines/prince/object.h
	./engines/prince/option_text.h
	./engines/prince/prince.h
	./engines/prince/pscr.h
	./engines/prince/resource.h
	./engines/prince/script.h
	./engines/prince/variatxt.h
	./engines/private/decompiler.h
	./engines/private/detection.cpp
	./engines/private/grammar.h
	./engines/private/module.mk
	./engines/private/private.h
	./engines/private/symbol.h
	./engines/private/tokens.h
	./engines/queen/bankman.h
	./engines/queen/command.h
	./engines/queen/credits.h
	./engines/queen/cutaway.h
	./engines/queen/debug.h
	./engines/queen/defs.h
	./engines/queen/detection.cpp ./engines/queen/detection.h
	./engines/queen/display.h
	./engines/queen/graphics.h
	./engines/queen/grid.h
	./engines/queen/input.h
	./engines/queen/journal.h
	./engines/queen/logic.h
	./engines/queen/midiadlib.h
	./engines/queen/module.mk
	./engines/queen/music.h
	./engines/queen/queen.h
	./engines/queen/resource.cpp ./engines/queen/resource.h
	./engines/queen/restables.cpp
	./engines/queen/sound.h
	./engines/queen/state.h
	./engines/queen/structs.h
	./engines/queen/talk.h
	./engines/queen/walk.h
	./engines/saga/actor.h
	./engines/saga/animation.h
	./engines/saga/console.h
	./engines/saga/detection.cpp ./engines/saga/detection.h
	./engines/saga/detection_tables.h
	./engines/saga/displayinfo.h
	./engines/saga/events.h
	./engines/saga/font.h
	./engines/saga/gfx.h
	./engines/saga/interface.h
	./engines/saga/isomap.h
	./engines/saga/itedata.h
	./engines/saga/module.mk
	./engines/saga/music.h
	./engines/saga/objectmap.h
	./engines/saga/palanim.h
	./engines/saga/puzzle.h
	./engines/saga/render.h
	./engines/saga/resource.h
	./engines/saga/saga.h
	./engines/saga/scene.h
	./engines/saga/script.h
	./engines/saga/shared_detection_defines.h
	./engines/saga/sndres.h
	./engines/saga/sound.h
	./engines/saga/sprite.h
	./engines/saga2/actor.h
	./engines/saga2/annoy.h
	./engines/saga2/assign.h
	./engines/saga2/audio.h
	./engines/saga2/automap.h
	./engines/saga2/band.h
	./engines/saga2/beegee.h
	./engines/saga2/blitters.h
	./engines/saga2/button.h
	./engines/saga2/calender.h
	./engines/saga2/cmisc.h
	./engines/saga2/code.h
	./engines/saga2/combat.h
	./engines/saga2/console.h
	./engines/saga2/contain.h
	./engines/saga2/detection.cpp ./engines/saga2/detection.h
	./engines/saga2/dice.h
	./engines/saga2/display.h
	./engines/saga2/dispnode.h
	./engines/saga2/document.h
	./engines/saga2/effects.h
	./engines/saga2/enchant.h
	./engines/saga2/floating.h
	./engines/saga2/fontlib.h
	./engines/saga2/fta.h
	./engines/saga2/gamerate.h
	./engines/saga2/gbevel.h
	./engines/saga2/gblitter.h
	./engines/saga2/gdraw.h
	./engines/saga2/gfx.h
	./engines/saga2/gpointer.h
	./engines/saga2/grabinfo.h
	./engines/saga2/grequest.h
	./engines/saga2/gtextbox.h
	./engines/saga2/hresmgr.h
	./engines/saga2/idtypes.h
	./engines/saga2/imagcach.h
	./engines/saga2/input.h
	./engines/saga2/intrface.h
	./engines/saga2/loadmsg.h
	./engines/saga2/localize.h
	./engines/saga2/magic.h
	./engines/saga2/mainmap.h
	./engines/saga2/mapfeatr.h
	./engines/saga2/messager.h
	./engines/saga2/mission.h
	./engines/saga2/modal.h
	./engines/saga2/module.mk
	./engines/saga2/motion.h
	./engines/saga2/mouseimg.h
	./engines/saga2/msgbox.h
	./engines/saga2/music.h
	./engines/saga2/objects.h
	./engines/saga2/objproto.h
	./engines/saga2/oncall.h
	./engines/saga2/palette.h
	./engines/saga2/panel.h
	./engines/saga2/patrol.h
	./engines/saga2/player.h
	./engines/saga2/priqueue.h
	./engines/saga2/program.h
	./engines/saga2/property.h
	./engines/saga2/rect.h
	./engines/saga2/saga2.h
	./engines/saga2/saveload.h
	./engines/saga2/script.h
	./engines/saga2/sensor.h
	./engines/saga2/setup.h
	./engines/saga2/shorten.h
	./engines/saga2/speech.h
	./engines/saga2/speldefs.h
	./engines/saga2/spellbuk.h
	./engines/saga2/spellio.h
	./engines/saga2/spells.h
	./engines/saga2/spelshow.h
	./engines/saga2/spelvals.h
	./engines/saga2/sprite.h
	./engines/saga2/stimtype.h
	./engines/saga2/tagnoise.h
	./engines/saga2/target.h
	./engines/saga2/task.h
	./engines/saga2/tcoords.h
	./engines/saga2/terrain.h
	./engines/saga2/tile.h
	./engines/saga2/tileline.h
	./engines/saga2/tileload.h
	./engines/saga2/tilemode.h
	./engines/saga2/tilevect.h
	./engines/saga2/timers.h
	./engines/saga2/tower.h
	./engines/saga2/towerfta.h
	./engines/saga2/towerwin.h
	./engines/saga2/transit.h
	./engines/saga2/tromode.h
	./engines/saga2/uidialog.h
	./engines/saga2/uimetrcs.h
	./engines/saga2/uitext.h
	./engines/saga2/vbacksav.h
	./engines/saga2/vdraw.h
	./engines/saga2/version.h
	./engines/saga2/videobox.h
	./engines/saga2/vpage.h
	./engines/saga2/vpal.h
	./engines/saga2/weapons.h
	./engines/sci/console.h
	./engines/sci/debug.h
	./engines/sci/detection.cpp ./engines/sci/detection.h
	./engines/sci/detection_options.h
	./engines/sci/detection_tables.h
	./engines/sci/dialogs.h
	./engines/sci/event.h
	./engines/sci/module.mk
	./engines/sci/sci.h
	./engines/sci/util.h
	./engines/scumm/actor.h
	./engines/scumm/actor_he.h
	./engines/scumm/akos.h
	./engines/scumm/base-costume.h
	./engines/scumm/bomp.h
	./engines/scumm/boxes.h
	./engines/scumm/cdda.h
	./engines/scumm/charset.h
	./engines/scumm/costume.h
	./engines/scumm/debugger.h
	./engines/scumm/detection.cpp ./engines/scumm/detection.h
	./engines/scumm/detection_internal.h
	./engines/scumm/detection_steam.h
	./engines/scumm/detection_tables.h
	./engines/scumm/dialogs.h
	./engines/scumm/file.cpp ./engines/scumm/file.h
	./engines/scumm/file_nes.cpp ./engines/scumm/file_nes.h
	./engines/scumm/gfx.h
	./engines/scumm/help.h
	./engines/scumm/ks_check.h
	./engines/scumm/metaengine.h
	./engines/scumm/module.mk
	./engines/scumm/music.h
	./engines/scumm/nut_renderer.h
	./engines/scumm/object.h
	./engines/scumm/obsolete.h
	./engines/scumm/resource.h
	./engines/scumm/script.h
	./engines/scumm/scumm-md5.h
	./engines/scumm/scumm.h
	./engines/scumm/scumm_v0.h
	./engines/scumm/scumm_v2.h
	./engines/scumm/scumm_v3.h
	./engines/scumm/scumm_v4.h
	./engines/scumm/scumm_v5.h
	./engines/scumm/scumm_v6.h
	./engines/scumm/scumm_v7.h
	./engines/scumm/scumm_v8.h
	./engines/scumm/sound.h
	./engines/scumm/usage_bits.h
	./engines/scumm/util.h
	./engines/scumm/verbs.h
	./engines/sherlock/animation.h
	./engines/sherlock/debugger.h
	./engines/sherlock/detection.cpp ./engines/sherlock/detection.h
	./engines/sherlock/detection_tables.h
	./engines/sherlock/events.h
	./engines/sherlock/fixed_text.h
	./engines/sherlock/fonts.h
	./engines/sherlock/image_file.h
	./engines/sherlock/inventory.h
	./engines/sherlock/journal.h
	./engines/sherlock/map.h
	./engines/sherlock/module.mk
	./engines/sherlock/music.h
	./engines/sherlock/objects.h
	./engines/sherlock/people.h
	./engines/sherlock/resources.h
	./engines/sherlock/saveload.h
	./engines/sherlock/scene.h
	./engines/sherlock/screen.h
	./engines/sherlock/sherlock.h
	./engines/sherlock/sound.h
	./engines/sherlock/surface.h
	./engines/sherlock/talk.h
	./engines/sherlock/user_interface.h
	./engines/sky/autoroute.h
	./engines/sky/compact.h
	./engines/sky/control.h
	./engines/sky/debug.h
	./engines/sky/detection.cpp
	./engines/sky/disk.h
	./engines/sky/grid.h
	./engines/sky/intro.h
	./engines/sky/logic.h
	./engines/sky/module.mk
	./engines/sky/mouse.h
	./engines/sky/rnc_deco.h
	./engines/sky/screen.h
	./engines/sky/sky.h
	./engines/sky/skydefs.h
	./engines/sky/sound.h
	./engines/sky/struc.h
	./engines/sky/text.h
	./engines/sludge/builtin.h
	./engines/sludge/csludge.h
	./engines/sludge/cursors.h
	./engines/sludge/detection.cpp ./engines/sludge/detection.h
	./engines/sludge/detection_tables.h
	./engines/sludge/errors.h
	./engines/sludge/event.h
	./engines/sludge/fileset.h
	./engines/sludge/floor.h
	./engines/sludge/fonttext.h
	./engines/sludge/freeze.h
	./engines/sludge/function.h
	./engines/sludge/functionlist.h
	./engines/sludge/graphics.h
	./engines/sludge/hsi.h
	./engines/sludge/imgloader.h
	./engines/sludge/language.h
	./engines/sludge/main_loop.h
	./engines/sludge/module.mk
	./engines/sludge/moreio.h
	./engines/sludge/movie.h
	./engines/sludge/newfatal.h
	./engines/sludge/objtypes.h
	./engines/sludge/people.h
	./engines/sludge/region.h
	./engines/sludge/savedata.h
	./engines/sludge/saveload.h
	./engines/sludge/sludge.h
	./engines/sludge/sludger.h
	./engines/sludge/sound.h
	./engines/sludge/speech.h
	./engines/sludge/sprbanks.h
	./engines/sludge/sprites.h
	./engines/sludge/statusba.h
	./engines/sludge/timing.h
	./engines/sludge/variable.h
	./engines/sludge/version.h
	./engines/sludge/zbuffer.h
	./engines/stark/console.h
	./engines/stark/debug.h
	./engines/stark/detection.cpp ./engines/stark/detection.h
	./engines/stark/module.mk
	./engines/stark/resourcereference.h
	./engines/stark/savemetadata.h
	./engines/stark/scene.h
	./engines/stark/stark.h
	./engines/startrek/action.h
	./engines/startrek/awaymission.h
	./engines/startrek/bitmap.h
	./engines/startrek/bridge.h
	./engines/startrek/common.h
	./engines/startrek/console.h
	./engines/startrek/detection.cpp ./engines/startrek/detection.h
	./engines/startrek/fixedint.h
	./engines/startrek/font.h
	./engines/startrek/graphics.h
	./engines/startrek/items.h
	./engines/startrek/iwfile.h
	./engines/startrek/lzss.h
	./engines/startrek/module.mk
	./engines/startrek/object.h
	./engines/startrek/resource.h
	./engines/startrek/room.h
	./engines/startrek/sound.h
	./engines/startrek/soundeffects.h
	./engines/startrek/space.h
	./engines/startrek/sprite.h
	./engines/startrek/startrek.h
	./engines/startrek/text.h
	./engines/supernova/console.h
	./engines/supernova/detection.cpp
	./engines/supernova/game-manager.h
	./engines/supernova/graphics.h
	./engines/supernova/imageid.h
	./engines/supernova/module.mk
	./engines/supernova/msn_def.h
	./engines/supernova/resman.h
	./engines/supernova/room.h
	./engines/supernova/screen.h
	./engines/supernova/sound.h
	./engines/supernova/supernova.h
	./engines/sword1/animation.h
	./engines/sword1/collision.h
	./engines/sword1/console.h
	./engines/sword1/control.h
	./engines/sword1/debug.h
	./engines/sword1/detection.cpp
	./engines/sword1/eventman.h
	./engines/sword1/logic.h
	./engines/sword1/memman.h
	./engines/sword1/menu.h
	./engines/sword1/module.mk
	./engines/sword1/mouse.h
	./engines/sword1/music.h
	./engines/sword1/object.h
	./engines/sword1/objectman.h
	./engines/sword1/resman.h
	./engines/sword1/router.h
	./engines/sword1/screen.h
	./engines/sword1/sound.h
	./engines/sword1/sword1.h
	./engines/sword1/sworddefs.h
	./engines/sword1/swordres.h
	./engines/sword1/text.h
	./engines/sword2/animation.h
	./engines/sword2/console.h
	./engines/sword2/controls.h
	./engines/sword2/debug.h
	./engines/sword2/defs.h
	./engines/sword2/detection.cpp ./engines/sword2/detection.h
	./engines/sword2/detection_internal.h
	./engines/sword2/header.h
	./engines/sword2/interpreter.h
	./engines/sword2/logic.h
	./engines/sword2/maketext.h
	./engines/sword2/memory.h
	./engines/sword2/module.mk
	./engines/sword2/mouse.h
	./engines/sword2/object.h
	./engines/sword2/resman.h
	./engines/sword2/router.h
	./engines/sword2/saveload.h
	./engines/sword2/screen.h
	./engines/sword2/sound.h
	./engines/sword2/sword2.h
	./engines/sword25/console.h
	./engines/sword25/detection.cpp ./engines/sword25/detection.h
	./engines/sword25/detection_tables.h
	./engines/sword25/module.mk
	./engines/sword25/sword25.h
	./engines/teenagent/actor.h
	./engines/teenagent/animation.h
	./engines/teenagent/console.h
	./engines/teenagent/detection.cpp
	./engines/teenagent/dialog.h
	./engines/teenagent/font.h
	./engines/teenagent/inventory.h
	./engines/teenagent/module.mk
	./engines/teenagent/music.h
	./engines/teenagent/objects.h
	./engines/teenagent/pack.h
	./engines/teenagent/resources.h
	./engines/teenagent/scene.h
	./engines/teenagent/segment.h
	./engines/teenagent/surface.h
	./engines/teenagent/surface_list.h
	./engines/teenagent/teenagent.h
	./engines/testbed/cloud.h
	./engines/testbed/config-params.h
	./engines/testbed/config.h
	./engines/testbed/detection.cpp
	./engines/testbed/events.h
	./engines/testbed/fs.h
	./engines/testbed/graphics.h
	./engines/testbed/midi.h
	./engines/testbed/misc.h
	./engines/testbed/module.mk
	./engines/testbed/networking.h
	./engines/testbed/savegame.h
	./engines/testbed/sound.h
	./engines/testbed/speech.h
	./engines/testbed/template.h
	./engines/testbed/testbed.h
	./engines/testbed/testsuite.h
	./engines/testbed/webserver.h
	./engines/tinsel/actors.h
	./engines/tinsel/adpcm.h
	./engines/tinsel/anim.h
	./engines/tinsel/background.h
	./engines/tinsel/bmv.h
	./engines/tinsel/cliprect.h
	./engines/tinsel/config.h
	./engines/tinsel/cursor.h
	./engines/tinsel/debugger.h
	./engines/tinsel/detection.cpp ./engines/tinsel/detection.h
	./engines/tinsel/detection_tables.h
	./engines/tinsel/dialogs.h
	./engines/tinsel/drives.h
	./engines/tinsel/dw.h
	./engines/tinsel/events.h
	./engines/tinsel/faders.h
	./engines/tinsel/film.h
	./engines/tinsel/font.h
	./engines/tinsel/graphics.h
	./engines/tinsel/handle.h
	./engines/tinsel/heapmem.h
	./engines/tinsel/mareels.h
	./engines/tinsel/module.mk
	./engines/tinsel/move.h
	./engines/tinsel/movers.h
	./engines/tinsel/multiobj.h
	./engines/tinsel/music.h
	./engines/tinsel/object.h
	./engines/tinsel/palette.h
	./engines/tinsel/pcode.h
	./engines/tinsel/pdisplay.h
	./engines/tinsel/pid.h
	./engines/tinsel/play.h
	./engines/tinsel/polygons.h
	./engines/tinsel/savescn.h
	./engines/tinsel/scene.h
	./engines/tinsel/sched.h
	./engines/tinsel/scn.h
	./engines/tinsel/scroll.h
	./engines/tinsel/sound.h
	./engines/tinsel/strres.h
	./engines/tinsel/sysvar.h
	./engines/tinsel/text.h
	./engines/tinsel/timers.h
	./engines/tinsel/tinlib.h
	./engines/tinsel/tinsel.h
	./engines/tinsel/token.h
	./engines/titanic/continue_save_dialog.h
	./engines/titanic/debugger.h
	./engines/titanic/detection.cpp ./engines/titanic/detection.h
	./engines/titanic/detection_tables.h
	./engines/titanic/events.h
	./engines/titanic/game_location.h
	./engines/titanic/game_manager.h
	./engines/titanic/game_state.h
	./engines/titanic/game_view.h
	./engines/titanic/input_handler.h
	./engines/titanic/input_translator.h
	./engines/titanic/main_game_window.h
	./engines/titanic/module.mk
	./engines/titanic/room_flags.h
	./engines/titanic/titanic.h
	./engines/titanic/translation.h
	./engines/toltecs/animation.h
	./engines/toltecs/console.h
	./engines/toltecs/detection.cpp ./engines/toltecs/detection.h
	./engines/toltecs/menu.h
	./engines/toltecs/microtiles.h
	./engines/toltecs/module.mk
	./engines/toltecs/movie.h
	./engines/toltecs/music.h
	./engines/toltecs/palette.h
	./engines/toltecs/render.h
	./engines/toltecs/resource.h
	./engines/toltecs/screen.h
	./engines/toltecs/script.h
	./engines/toltecs/segmap.h
	./engines/toltecs/sound.h
	./engines/toltecs/toltecs.h
	./engines/tony/custom.h
	./engines/tony/debugger.h
	./engines/tony/detection.cpp ./engines/tony/detection.h
	./engines/tony/detection_tables.h
	./engines/tony/font.h
	./engines/tony/game.h
	./engines/tony/gfxcore.h
	./engines/tony/gfxengine.h
	./engines/tony/globals.h
	./engines/tony/input.h
	./engines/tony/inventory.h
	./engines/tony/loc.h
	./engines/tony/module.mk
	./engines/tony/resid.h
	./engines/tony/sound.h
	./engines/tony/tony.h
	./engines/tony/tonychar.h
	./engines/tony/utils.h
	./engines/tony/window.h
	./engines/toon/anim.h
	./engines/toon/audio.h
	./engines/toon/character.h
	./engines/toon/console.h
	./engines/toon/conversation.h
	./engines/toon/detection.cpp
	./engines/toon/drew.h
	./engines/toon/flux.h
	./engines/toon/font.h
	./engines/toon/hotspot.h
	./engines/toon/module.mk
	./engines/toon/movie.h
	./engines/toon/path.h
	./engines/toon/picture.h
	./engines/toon/resource.h
	./engines/toon/script.h
	./engines/toon/script_func.h
	./engines/toon/state.h
	./engines/toon/subtitles.h
	./engines/toon/text.h
	./engines/toon/tools.h
	./engines/toon/toon.h
	./engines/touche/console.h
	./engines/touche/detection.cpp
	./engines/touche/graphics.h
	./engines/touche/midi.h
	./engines/touche/module.mk
	./engines/touche/touche.h
	./engines/trecision/actor.h
	./engines/trecision/anim.h
	./engines/trecision/console.h
	./engines/trecision/defines.h
	./engines/trecision/detection.cpp
	./engines/trecision/dialog.h
	./engines/trecision/fastfile.h
	./engines/trecision/graphics.h
	./engines/trecision/logic.h
	./engines/trecision/module.mk
	./engines/trecision/pathfinding3d.h
	./engines/trecision/renderer3d.h
	./engines/trecision/scheduler.h
	./engines/trecision/sound.h
	./engines/trecision/struct.h
	./engines/trecision/text.h
	./engines/trecision/trecision.h
	./engines/trecision/video.h
	./engines/tsage/converse.h
	./engines/tsage/core.h
	./engines/tsage/debugger.h
	./engines/tsage/detection.cpp ./engines/tsage/detection.h
	./engines/tsage/detection_tables.h
	./engines/tsage/dialogs.h
	./engines/tsage/events.h
	./engines/tsage/globals.h
	./engines/tsage/graphics.h
	./engines/tsage/module.mk
	./engines/tsage/resources.h
	./engines/tsage/saveload.h
	./engines/tsage/scenes.h
	./engines/tsage/screen.h
	./engines/tsage/sound.h
	./engines/tsage/staticres.h
	./engines/tsage/tsage.h
	./engines/tsage/user_interface.h
	./engines/tucker/console.h
	./engines/tucker/detection.cpp ./engines/tucker/detection.h
	./engines/tucker/graphics.h
	./engines/tucker/module.mk
	./engines/tucker/tucker.h
	./engines/twine/achievements_tables.h
	./engines/twine/detection.cpp ./engines/twine/detection.h
	./engines/twine/holomap.h
	./engines/twine/input.h
	./engines/twine/module.mk
	./engines/twine/movies.h
	./engines/twine/shared.h
	./engines/twine/slideshow.h
	./engines/twine/text.h
	./engines/twine/twine.h
	./engines/ultima/detection.cpp ./engines/ultima/detection.h
	./engines/ultima/detection_tables.h
	./engines/ultima/metaengine.h
	./engines/ultima/module.mk
	./engines/voyeur/animation.h
	./engines/voyeur/data.h
	./engines/voyeur/debugger.h
	./engines/voyeur/detection.cpp ./engines/voyeur/detection.h
	./engines/voyeur/detection_tables.h
	./engines/voyeur/events.h
	./engines/voyeur/files.h
	./engines/voyeur/module.mk
	./engines/voyeur/screen.h
	./engines/voyeur/sound.h
	./engines/voyeur/staticres.h
	./engines/voyeur/voyeur.h
	./engines/wage/debugger.h
	./engines/wage/design.h
	./engines/wage/detection.cpp
	./engines/wage/detection_tables.h
	./engines/wage/dialog.h
	./engines/wage/entities.h
	./engines/wage/gui.h
	./engines/wage/module.mk
	./engines/wage/randomhat.h
	./engines/wage/script.h
	./engines/wage/sound.h
	./engines/wage/wage.h
	./engines/wage/world.h
	./engines/wintermute/achievements_tables.h
	./engines/wintermute/coll_templ.h
	./engines/wintermute/dcgf.h
	./engines/wintermute/dctypes.h
	./engines/wintermute/debugger.h
	./engines/wintermute/detection.cpp ./engines/wintermute/detection.h
	./engines/wintermute/detection_tables.h
	./engines/wintermute/keymapper_tables.h
	./engines/wintermute/module.mk
	./engines/wintermute/persistent.h
	./engines/wintermute/platform_osystem.h
	./engines/wintermute/wintermute.h
	./engines/wintermute/wintypes.h
	./engines/xeen/character.h
	./engines/xeen/combat.h
	./engines/xeen/cutscenes.h
	./engines/xeen/debugger.h
	./engines/xeen/detection.cpp ./engines/xeen/detection.h
	./engines/xeen/detection_tables.h
	./engines/xeen/events.h
	./engines/xeen/files.h
	./engines/xeen/font.h
	./engines/xeen/interface.h
	./engines/xeen/interface_minimap.h
	./engines/xeen/interface_scene.h
	./engines/xeen/item.h
	./engines/xeen/locations.h
	./engines/xeen/map.h
	./engines/xeen/module.mk
	./engines/xeen/party.h
	./engines/xeen/patcher.h
	./engines/xeen/resources.h
	./engines/xeen/saves.h
	./engines/xeen/screen.h
	./engines/xeen/scripts.h
	./engines/xeen/sound.h
	./engines/xeen/sound_driver.h
	./engines/xeen/sound_driver_adlib.h
	./engines/xeen/spells.h
	./engines/xeen/sprites.h
	./engines/xeen/subtitles.h
	./engines/xeen/window.h
	./engines/xeen/xeen.h
	./engines/xeen/xsurface.h
	./engines/zvision/detection.cpp ./engines/zvision/detection.h
	./engines/zvision/detection_tables.h
	./engines/zvision/module.mk
	./engines/zvision/zvision.h

)

add_executable(scummvm
	./LICENSES/COPYING.BSD ./LICENSES/COPYING.FREEFONT ./LICENSES/COPYING.GLAD ./LICENSES/COPYING.ISC ./LICENSES/COPYING.LGPL ./LICENSES/COPYING.LUA ./LICENSES/COPYING.MIT ./LICENSES/COPYING.OFL ./LICENSES/COPYING.TINYGL
	./audio/decoders/3do.cpp ./audio/decoders/3do.h
	./audio/decoders/aac.cpp ./audio/decoders/aac.h
	./audio/decoders/ac3.h
	./audio/decoders/adpcm.cpp ./audio/decoders/adpcm.h
	./audio/decoders/adpcm_intern.h
	./audio/decoders/aiff.cpp ./audio/decoders/aiff.h
	./audio/decoders/asf.cpp ./audio/decoders/asf.h
	./audio/decoders/codec.h
	./audio/decoders/flac.cpp ./audio/decoders/flac.h
	./audio/decoders/g711.cpp ./audio/decoders/g711.h
	./audio/decoders/iff_sound.cpp ./audio/decoders/iff_sound.h
	./audio/decoders/mac_snd.cpp ./audio/decoders/mac_snd.h
	./audio/decoders/mp3.cpp ./audio/decoders/mp3.h
	./audio/decoders/qdm2.cpp ./audio/decoders/qdm2.h
	./audio/decoders/qdm2data.h
	./audio/decoders/quicktime.cpp ./audio/decoders/quicktime.h
	./audio/decoders/quicktime_intern.h
	./audio/decoders/raw.cpp ./audio/decoders/raw.h
	./audio/decoders/util.h
	./audio/decoders/voc.cpp ./audio/decoders/voc.h
	./audio/decoders/vorbis.cpp ./audio/decoders/vorbis.h
	./audio/decoders/wave.cpp ./audio/decoders/wave.h
	./audio/decoders/wave_types.h
	./audio/decoders/wma.cpp ./audio/decoders/wma.h
	./audio/decoders/wmadata.h
	./audio/decoders/xa.cpp ./audio/decoders/xa.h
	./audio/decoders/xan_dpcm.cpp ./audio/decoders/xan_dpcm.h
	./audio/mods/infogrames.cpp ./audio/mods/infogrames.h
	./audio/mods/maxtrax.cpp ./audio/mods/maxtrax.h
	./audio/mods/mod_xm_s3m.cpp ./audio/mods/mod_xm_s3m.h
	./audio/mods/module.cpp ./audio/mods/module.h
	./audio/mods/module_mod_xm_s3m.cpp ./audio/mods/module_mod_xm_s3m.h
	./audio/mods/paula.cpp ./audio/mods/paula.h
	./audio/mods/protracker.cpp ./audio/mods/protracker.h
	./audio/mods/rjp1.cpp ./audio/mods/rjp1.h
	./audio/mods/soundfx.cpp ./audio/mods/soundfx.h
	./audio/mods/tfmx.cpp ./audio/mods/tfmx.h
	./audio/softsynth/fmtowns_pc98/pc98_audio.cpp ./audio/softsynth/fmtowns_pc98/pc98_audio.h
	./audio/softsynth/fmtowns_pc98/pcm_common.cpp ./audio/softsynth/fmtowns_pc98/pcm_common.h
	./audio/softsynth/fmtowns_pc98/sega_audio.cpp ./audio/softsynth/fmtowns_pc98/sega_audio.h
	./audio/softsynth/fmtowns_pc98/towns_audio.cpp ./audio/softsynth/fmtowns_pc98/towns_audio.h
	./audio/softsynth/fmtowns_pc98/towns_euphony.cpp ./audio/softsynth/fmtowns_pc98/towns_euphony.h
	./audio/softsynth/fmtowns_pc98/towns_pc98_driver.cpp ./audio/softsynth/fmtowns_pc98/towns_pc98_driver.h
	./audio/softsynth/fmtowns_pc98/towns_pc98_fmsynth.cpp ./audio/softsynth/fmtowns_pc98/towns_pc98_fmsynth.h
	./audio/softsynth/fmtowns_pc98/towns_pc98_plugins.cpp
	./audio/softsynth/mt32/c_interface/c_interface.cpp ./audio/softsynth/mt32/c_interface/c_interface.h
	./audio/softsynth/mt32/c_interface/c_types.h
	./audio/softsynth/mt32/c_interface/cpp_interface.h
	./audio/softsynth/mt32/sha1/sha1.cpp ./audio/softsynth/mt32/sha1/sha1.h
	./audio/softsynth/mt32/Analog.cpp ./audio/softsynth/mt32/Analog.h
	./audio/softsynth/mt32/BReverbModel.cpp ./audio/softsynth/mt32/BReverbModel.h
	./audio/softsynth/mt32/Enumerations.h
	./audio/softsynth/mt32/File.cpp ./audio/softsynth/mt32/File.h
	./audio/softsynth/mt32/FileStream.cpp ./audio/softsynth/mt32/FileStream.h
	./audio/softsynth/mt32/LA32FloatWaveGenerator.cpp ./audio/softsynth/mt32/LA32FloatWaveGenerator.h
	./audio/softsynth/mt32/LA32Ramp.cpp ./audio/softsynth/mt32/LA32Ramp.h
	./audio/softsynth/mt32/LA32WaveGenerator.cpp ./audio/softsynth/mt32/LA32WaveGenerator.h
	./audio/softsynth/mt32/MemoryRegion.h
	./audio/softsynth/mt32/MidiEventQueue.h
	./audio/softsynth/mt32/MidiStreamParser.cpp ./audio/softsynth/mt32/MidiStreamParser.h
	./audio/softsynth/mt32/Part.cpp ./audio/softsynth/mt32/Part.h
	./audio/softsynth/mt32/Partial.cpp ./audio/softsynth/mt32/Partial.h
	./audio/softsynth/mt32/PartialManager.cpp ./audio/softsynth/mt32/PartialManager.h
	./audio/softsynth/mt32/Poly.cpp ./audio/softsynth/mt32/Poly.h
	./audio/softsynth/mt32/ROMInfo.cpp ./audio/softsynth/mt32/ROMInfo.h
	./audio/softsynth/mt32/SampleRateConverter.cpp ./audio/softsynth/mt32/SampleRateConverter.h
	./audio/softsynth/mt32/Structures.h
	./audio/softsynth/mt32/Synth.cpp ./audio/softsynth/mt32/Synth.h
	./audio/softsynth/mt32/TVA.cpp ./audio/softsynth/mt32/TVA.h
	./audio/softsynth/mt32/TVF.cpp ./audio/softsynth/mt32/TVF.h
	./audio/softsynth/mt32/TVP.cpp ./audio/softsynth/mt32/TVP.h
	./audio/softsynth/mt32/Tables.cpp ./audio/softsynth/mt32/Tables.h
	./audio/softsynth/mt32/Types.h
	./audio/softsynth/mt32/VersionTagging.h
	./audio/softsynth/mt32/config.h
	./audio/softsynth/mt32/globals.h
	./audio/softsynth/mt32/internals.h
	./audio/softsynth/mt32/mmath.h
	./audio/softsynth/mt32/module.mk
	./audio/softsynth/mt32/mt32emu.h
	./audio/softsynth/opl/dbopl.cpp ./audio/softsynth/opl/dbopl.h
	./audio/softsynth/opl/dosbox.cpp ./audio/softsynth/opl/dosbox.h
	./audio/softsynth/opl/mame.cpp ./audio/softsynth/opl/mame.h
	./audio/softsynth/opl/nuked.cpp ./audio/softsynth/opl/nuked.h
	./audio/softsynth/appleiigs.cpp
	./audio/softsynth/cms.cpp ./audio/softsynth/cms.h
	./audio/softsynth/eas.cpp
	./audio/softsynth/emumidi.h
	./audio/softsynth/fluidsynth.cpp
	./audio/softsynth/mt32.cpp
	./audio/softsynth/pcspk.cpp ./audio/softsynth/pcspk.h
	./audio/softsynth/sid.cpp ./audio/softsynth/sid.h
	./audio/softsynth/wave6581.cpp
	./audio/soundfont/vab/psxspu.cpp ./audio/soundfont/vab/psxspu.h
	./audio/soundfont/vab/vab.cpp ./audio/soundfont/vab/vab.h
	./audio/soundfont/common.h
	./audio/soundfont/rawfile.cpp ./audio/soundfont/rawfile.h
	./audio/soundfont/rifffile.cpp ./audio/soundfont/rifffile.h
	./audio/soundfont/sf2file.cpp ./audio/soundfont/sf2file.h
	./audio/soundfont/synthfile.cpp ./audio/soundfont/synthfile.h
	./audio/soundfont/vgmcoll.cpp ./audio/soundfont/vgmcoll.h
	./audio/soundfont/vgminstrset.cpp ./audio/soundfont/vgminstrset.h
	./audio/soundfont/vgmitem.cpp ./audio/soundfont/vgmitem.h
	./audio/soundfont/vgmsamp.cpp ./audio/soundfont/vgmsamp.h
	./audio/adlib.cpp
	./audio/adlib_ms.cpp ./audio/adlib_ms.h
	./audio/audiostream.cpp ./audio/audiostream.h
	./audio/fmopl.cpp ./audio/fmopl.h
	./audio/mididrv.cpp ./audio/mididrv.h
	./audio/mididrv_ms.cpp ./audio/mididrv_ms.h
	./audio/midiparser.cpp ./audio/midiparser.h
	./audio/midiparser_qt.cpp ./audio/midiparser_qt.h
	./audio/midiparser_smf.cpp
	./audio/midiparser_xmidi.cpp
	./audio/midiplayer.cpp ./audio/midiplayer.h
	./audio/miles.h
	./audio/miles_adlib.cpp
	./audio/miles_midi.cpp
	./audio/mixer.cpp ./audio/mixer.h
	./audio/mixer_intern.h
	./audio/module.mk
	./audio/mpu401.cpp ./audio/mpu401.h
	./audio/mt32gm.cpp ./audio/mt32gm.h
	./audio/musicplugin.cpp ./audio/musicplugin.h
	./audio/null.cpp ./audio/null.h
	./audio/rate.cpp ./audio/rate.h
	./audio/timestamp.cpp ./audio/timestamp.h
	./backends/audiocd/default/default-audiocd.cpp ./backends/audiocd/default/default-audiocd.h
	./backends/audiocd/win32/win32-audiocd.cpp ./backends/audiocd/win32/win32-audiocd.h
	./backends/audiocd/audiocd-stream.cpp ./backends/audiocd/audiocd-stream.h
	./backends/audiocd/audiocd.h
	./backends/cloud/box/boxlistdirectorybyidrequest.cpp ./backends/cloud/box/boxlistdirectorybyidrequest.h
	./backends/cloud/box/boxstorage.cpp ./backends/cloud/box/boxstorage.h
	./backends/cloud/box/boxtokenrefresher.cpp ./backends/cloud/box/boxtokenrefresher.h
	./backends/cloud/box/boxuploadrequest.cpp ./backends/cloud/box/boxuploadrequest.h
	./backends/cloud/dropbox/dropboxcreatedirectoryrequest.cpp ./backends/cloud/dropbox/dropboxcreatedirectoryrequest.h
	./backends/cloud/dropbox/dropboxinforequest.cpp ./backends/cloud/dropbox/dropboxinforequest.h
	./backends/cloud/dropbox/dropboxlistdirectoryrequest.cpp ./backends/cloud/dropbox/dropboxlistdirectoryrequest.h
	./backends/cloud/dropbox/dropboxstorage.cpp ./backends/cloud/dropbox/dropboxstorage.h
	./backends/cloud/dropbox/dropboxtokenrefresher.cpp ./backends/cloud/dropbox/dropboxtokenrefresher.h
	./backends/cloud/dropbox/dropboxuploadrequest.cpp ./backends/cloud/dropbox/dropboxuploadrequest.h
	./backends/cloud/googledrive/googledrivelistdirectorybyidrequest.cpp ./backends/cloud/googledrive/googledrivelistdirectorybyidrequest.h
	./backends/cloud/googledrive/googledrivestorage.cpp ./backends/cloud/googledrive/googledrivestorage.h
	./backends/cloud/googledrive/googledrivetokenrefresher.cpp ./backends/cloud/googledrive/googledrivetokenrefresher.h
	./backends/cloud/googledrive/googledriveuploadrequest.cpp ./backends/cloud/googledrive/googledriveuploadrequest.h
	./backends/cloud/id/idcreatedirectoryrequest.cpp ./backends/cloud/id/idcreatedirectoryrequest.h
	./backends/cloud/id/iddownloadrequest.cpp ./backends/cloud/id/iddownloadrequest.h
	./backends/cloud/id/idlistdirectoryrequest.cpp ./backends/cloud/id/idlistdirectoryrequest.h
	./backends/cloud/id/idresolveidrequest.cpp ./backends/cloud/id/idresolveidrequest.h
	./backends/cloud/id/idstorage.cpp ./backends/cloud/id/idstorage.h
	./backends/cloud/id/idstreamfilerequest.cpp ./backends/cloud/id/idstreamfilerequest.h
	./backends/cloud/onedrive/onedrivecreatedirectoryrequest.cpp ./backends/cloud/onedrive/onedrivecreatedirectoryrequest.h
	./backends/cloud/onedrive/onedrivelistdirectoryrequest.cpp ./backends/cloud/onedrive/onedrivelistdirectoryrequest.h
	./backends/cloud/onedrive/onedrivestorage.cpp ./backends/cloud/onedrive/onedrivestorage.h
	./backends/cloud/onedrive/onedrivetokenrefresher.cpp ./backends/cloud/onedrive/onedrivetokenrefresher.h
	./backends/cloud/onedrive/onedriveuploadrequest.cpp ./backends/cloud/onedrive/onedriveuploadrequest.h
	./backends/cloud/basestorage.cpp ./backends/cloud/basestorage.h
	./backends/cloud/cloudicon.cpp ./backends/cloud/cloudicon.h
	./backends/cloud/cloudicon_data.h
	./backends/cloud/cloudicon_disabled_data.h
	./backends/cloud/cloudmanager.cpp ./backends/cloud/cloudmanager.h
	./backends/cloud/downloadrequest.cpp ./backends/cloud/downloadrequest.h
	./backends/cloud/folderdownloadrequest.cpp ./backends/cloud/folderdownloadrequest.h
	./backends/cloud/iso8601.cpp ./backends/cloud/iso8601.h
	./backends/cloud/savessyncrequest.cpp ./backends/cloud/savessyncrequest.h
	./backends/cloud/storage.cpp ./backends/cloud/storage.h
	./backends/cloud/storagefile.cpp ./backends/cloud/storagefile.h
	./backends/cloud/storageinfo.h
	./backends/dialogs/win32/mingw-compat.h
	./backends/dialogs/win32/win32-dialogs.cpp ./backends/dialogs/win32/win32-dialogs.h

	./backends/events/default/default-events.cpp ./backends/events/default/default-events.h
	./backends/events/sdl/legacy-sdl-events.cpp ./backends/events/sdl/legacy-sdl-events.h
	./backends/events/sdl/sdl-events.cpp ./backends/events/sdl/sdl-events.h

	./backends/fs/windows/windows-fs-factory.cpp ./backends/fs/windows/windows-fs-factory.h
	./backends/fs/windows/windows-fs.cpp ./backends/fs/windows/windows-fs.h
	./backends/fs/abstract-fs.cpp ./backends/fs/abstract-fs.h
	./backends/fs/fs-factory.h
	./backends/fs/stdiostream.cpp ./backends/fs/stdiostream.h
	./backends/graphics/opengl/pipelines/clut8.cpp ./backends/graphics/opengl/pipelines/clut8.h
	./backends/graphics/opengl/pipelines/fixed.cpp ./backends/graphics/opengl/pipelines/fixed.h
	./backends/graphics/opengl/pipelines/pipeline.cpp ./backends/graphics/opengl/pipelines/pipeline.h
	./backends/graphics/opengl/pipelines/shader.cpp ./backends/graphics/opengl/pipelines/shader.h
	./backends/graphics/opengl/context.cpp
	./backends/graphics/opengl/debug.cpp ./backends/graphics/opengl/debug.h
	./backends/graphics/opengl/framebuffer.cpp ./backends/graphics/opengl/framebuffer.h
	./backends/graphics/opengl/opengl-graphics.cpp ./backends/graphics/opengl/opengl-graphics.h
	./backends/graphics/opengl/opengl-sys.h
	./backends/graphics/opengl/shader.cpp ./backends/graphics/opengl/shader.h
	./backends/graphics/opengl/texture.cpp ./backends/graphics/opengl/texture.h
	./backends/graphics/openglsdl/openglsdl-graphics.cpp ./backends/graphics/openglsdl/openglsdl-graphics.h
	./backends/graphics/sdl/sdl-graphics.cpp ./backends/graphics/sdl/sdl-graphics.h
	./backends/graphics/surfacesdl/surfacesdl-graphics.cpp ./backends/graphics/surfacesdl/surfacesdl-graphics.h
	./backends/graphics/default-palette.h
	./backends/graphics/graphics.h
	./backends/graphics/windowed.h
	./backends/graphics3d/opengl/framebuffer.cpp ./backends/graphics3d/opengl/framebuffer.h
	./backends/graphics3d/opengl/surfacerenderer.cpp ./backends/graphics3d/opengl/surfacerenderer.h
	./backends/graphics3d/opengl/texture.cpp ./backends/graphics3d/opengl/texture.h
	./backends/graphics3d/opengl/tiledsurface.cpp ./backends/graphics3d/opengl/tiledsurface.h
	./backends/graphics3d/openglsdl/openglsdl-graphics3d.cpp ./backends/graphics3d/openglsdl/openglsdl-graphics3d.h

	./backends/keymapper/action.cpp ./backends/keymapper/action.h
	./backends/keymapper/hardware-input.cpp ./backends/keymapper/hardware-input.h
	./backends/keymapper/input-watcher.cpp ./backends/keymapper/input-watcher.h
	./backends/keymapper/keymap.cpp ./backends/keymapper/keymap.h
	./backends/keymapper/keymapper-defaults.h
	./backends/keymapper/keymapper.cpp ./backends/keymapper/keymapper.h
	./backends/keymapper/remap-widget.cpp ./backends/keymapper/remap-widget.h
	./backends/keymapper/standard-actions.cpp ./backends/keymapper/standard-actions.h
	./backends/keymapper/virtual-mouse.cpp ./backends/keymapper/virtual-mouse.h
	./backends/log/log.cpp ./backends/log/log.h
	./backends/midi/alsa.cpp
	./backends/midi/dmedia.cpp
	./backends/midi/seq.cpp
	./backends/midi/sndio.cpp
	./backends/midi/stmidi.cpp
	./backends/midi/timidity.cpp
	./backends/midi/windows.cpp
	./backends/mixer/null/null-mixer.cpp ./backends/mixer/null/null-mixer.h
	./backends/mixer/sdl/sdl-mixer.cpp ./backends/mixer/sdl/sdl-mixer.h
	./backends/mixer/mixer.h
	./backends/mutex/sdl/sdl-mutex.cpp ./backends/mutex/sdl/sdl-mutex.h

	./backends/networking/curl/connectionmanager.cpp ./backends/networking/curl/connectionmanager.h
	./backends/networking/curl/curljsonrequest.cpp ./backends/networking/curl/curljsonrequest.h
	./backends/networking/curl/curlrequest.cpp ./backends/networking/curl/curlrequest.h
	./backends/networking/curl/networkreadstream.cpp ./backends/networking/curl/networkreadstream.h
	./backends/networking/curl/postrequest.cpp ./backends/networking/curl/postrequest.h
	./backends/networking/curl/request.cpp ./backends/networking/curl/request.h
	./backends/networking/curl/session.cpp ./backends/networking/curl/session.h
	./backends/networking/curl/sessionrequest.cpp ./backends/networking/curl/sessionrequest.h
	./backends/networking/sdl_net/handlers/basehandler.h
	./backends/networking/sdl_net/handlers/createdirectoryhandler.cpp ./backends/networking/sdl_net/handlers/createdirectoryhandler.h
	./backends/networking/sdl_net/handlers/downloadfilehandler.cpp ./backends/networking/sdl_net/handlers/downloadfilehandler.h
	./backends/networking/sdl_net/handlers/filesajaxpagehandler.cpp ./backends/networking/sdl_net/handlers/filesajaxpagehandler.h
	./backends/networking/sdl_net/handlers/filesbasehandler.cpp ./backends/networking/sdl_net/handlers/filesbasehandler.h
	./backends/networking/sdl_net/handlers/filespagehandler.cpp ./backends/networking/sdl_net/handlers/filespagehandler.h
	./backends/networking/sdl_net/handlers/indexpagehandler.cpp ./backends/networking/sdl_net/handlers/indexpagehandler.h
	./backends/networking/sdl_net/handlers/listajaxhandler.cpp ./backends/networking/sdl_net/handlers/listajaxhandler.h
	./backends/networking/sdl_net/handlers/resourcehandler.cpp ./backends/networking/sdl_net/handlers/resourcehandler.h
	./backends/networking/sdl_net/handlers/uploadfilehandler.cpp ./backends/networking/sdl_net/handlers/uploadfilehandler.h
	./backends/networking/sdl_net/client.cpp ./backends/networking/sdl_net/client.h
	./backends/networking/sdl_net/getclienthandler.cpp ./backends/networking/sdl_net/getclienthandler.h
	./backends/networking/sdl_net/handlerutils.cpp ./backends/networking/sdl_net/handlerutils.h
	./backends/networking/sdl_net/localwebserver.cpp ./backends/networking/sdl_net/localwebserver.h
	./backends/networking/sdl_net/reader.cpp ./backends/networking/sdl_net/reader.h
	./backends/networking/sdl_net/uploadfileclienthandler.cpp ./backends/networking/sdl_net/uploadfileclienthandler.h

	./backends/platform/sdl/win32/win32-main.cpp
	./backends/platform/sdl/win32/win32-window.cpp ./backends/platform/sdl/win32/win32-window.h
	./backends/platform/sdl/win32/win32.cpp ./backends/platform/sdl/win32/win32.h
	./backends/platform/sdl/win32/win32_wrapper.cpp ./backends/platform/sdl/win32/win32_wrapper.h
	./backends/platform/sdl/module.mk
	./backends/platform/sdl/sdl-sys.h
	./backends/platform/sdl/sdl-window.cpp ./backends/platform/sdl/sdl-window.h
	./backends/platform/sdl/sdl.cpp ./backends/platform/sdl/sdl.h

	./backends/plugins/sdl/sdl-provider.cpp ./backends/plugins/sdl/sdl-provider.h
	./backends/plugins/win32/win32-provider.cpp ./backends/plugins/win32/win32-provider.h
	./backends/plugins/dynamic-plugin.h
	./backends/saves/default/default-saves.cpp ./backends/saves/default/default-saves.h
	./backends/saves/recorder/recorder-saves.cpp ./backends/saves/recorder/recorder-saves.h
	./backends/saves/windows/windows-saves.cpp ./backends/saves/windows/windows-saves.h
	./backends/saves/savefile.cpp
	./backends/taskbar/win32/mingw-compat.h
	./backends/taskbar/win32/win32-taskbar.cpp ./backends/taskbar/win32/win32-taskbar.h

	./backends/text-to-speech/windows/windows-text-to-speech.cpp ./backends/text-to-speech/windows/windows-text-to-speech.h

	./backends/timer/default/default-timer.cpp ./backends/timer/default/default-timer.h
	./backends/timer/sdl/sdl-timer.cpp ./backends/timer/sdl/sdl-timer.h

	./backends/updates/win32/win32-updates.cpp ./backends/updates/win32/win32-updates.h

	./backends/vkeybd/image-map.cpp ./backends/vkeybd/image-map.h
	./backends/vkeybd/keycode-descriptions.h
	./backends/vkeybd/polygon.cpp ./backends/vkeybd/polygon.h
	./backends/vkeybd/virtual-keyboard-gui.cpp ./backends/vkeybd/virtual-keyboard-gui.h
	./backends/vkeybd/virtual-keyboard-parser.cpp ./backends/vkeybd/virtual-keyboard-parser.h
	./backends/vkeybd/virtual-keyboard.cpp ./backends/vkeybd/virtual-keyboard.h
	./backends/base-backend.cpp ./backends/base-backend.h
	./backends/modular-backend.cpp ./backends/modular-backend.h
	./backends/module.mk
	./base/commandLine.cpp ./base/commandLine.h
	./base/internal_plugins.h
	./base/internal_version.h
	./base/main.cpp ./base/main.h
	./base/module.mk
	./base/plugins.cpp ./base/plugins.h
	./base/test_new_standards.cpp
	./base/version.cpp ./base/version.h
	./common/encodings/singlebyte.cpp
	./common/lua/COPYRIGHT
	./common/lua/double_serialization.cpp ./common/lua/double_serialization.h
	./common/lua/lapi.cpp ./common/lua/lapi.h
	./common/lua/lauxlib.cpp ./common/lua/lauxlib.h
	./common/lua/lbaselib.cpp
	./common/lua/lcode.cpp ./common/lua/lcode.h
	./common/lua/ldblib.cpp
	./common/lua/ldebug.cpp ./common/lua/ldebug.h
	./common/lua/ldo.cpp ./common/lua/ldo.h
	./common/lua/lfunc.cpp ./common/lua/lfunc.h
	./common/lua/lgc.cpp ./common/lua/lgc.h
	./common/lua/linit.cpp
	./common/lua/liolib.cpp
	./common/lua/llex.cpp ./common/lua/llex.h
	./common/lua/llimits.h
	./common/lua/lmathlib.cpp
	./common/lua/lmem.cpp ./common/lua/lmem.h
	./common/lua/loadlib.cpp
	./common/lua/lobject.cpp ./common/lua/lobject.h
	./common/lua/lopcodes.cpp ./common/lua/lopcodes.h
	./common/lua/loslib.cpp
	./common/lua/lparser.cpp ./common/lua/lparser.h
	./common/lua/lstate.cpp ./common/lua/lstate.h
	./common/lua/lstring.cpp ./common/lua/lstring.h
	./common/lua/lstrlib.cpp
	./common/lua/ltable.cpp ./common/lua/ltable.h
	./common/lua/ltablib.cpp
	./common/lua/ltm.cpp ./common/lua/ltm.h
	./common/lua/lua.h
	./common/lua/lua_persist.cpp
	./common/lua/lua_persistence.h
	./common/lua/lua_persistence_util.cpp ./common/lua/lua_persistence_util.h
	./common/lua/lua_unpersist.cpp
	./common/lua/luaconf.h
	./common/lua/lualib.h
	./common/lua/lvm.cpp ./common/lua/lvm.h
	./common/lua/lzio.cpp ./common/lua/lzio.h
	./common/lua/scummvm_file.cpp ./common/lua/scummvm_file.h
	./common/achievements.cpp ./common/achievements.h
	./common/algorithm.h
	./common/archive.cpp ./common/archive.h
	./common/array.h
	./common/base-str.cpp ./common/base-str.h
	./common/bitarray.h
	./common/bitstream.h
	./common/bufferedstream.h
	./common/callback.h
	./common/config-manager.cpp ./common/config-manager.h
	./common/coroutines.cpp ./common/coroutines.h
	./common/cosinetables.cpp ./common/cosinetables.h
	./common/crc.h
	./common/dcl.cpp ./common/dcl.h
	./common/dct.cpp ./common/dct.h
	./common/debug-channels.h
	./common/debug.cpp ./common/debug.h
	./common/dialogs.h
	./common/enc-internal.h
	./common/endian.h
	./common/error.cpp ./common/error.h
	./common/events.cpp ./common/events.h
	./common/fft.cpp ./common/fft.h
	./common/file.cpp ./common/file.h
	./common/forbidden.h
	./common/foreach.h
	./common/frac.h
	./common/fs.cpp ./common/fs.h
	./common/func.h
	./common/gui_options.cpp ./common/gui_options.h
	./common/hash-ptr.h
	./common/hash-str.h
	./common/hashmap.cpp ./common/hashmap.h
	./common/huffman.h
	./common/iff_container.cpp ./common/iff_container.h
	./common/ini-file.cpp ./common/ini-file.h
	./common/initializer_list.h
	./common/installshield_cab.cpp ./common/installshield_cab.h
	./common/installshieldv3_archive.cpp ./common/installshieldv3_archive.h
	./common/inttypes.h
	./common/json.cpp ./common/json.h
	./common/keyboard.h
	./common/language.cpp ./common/language.h
	./common/list.h
	./common/list_intern.h
	./common/localization.cpp ./common/localization.h
	./common/macresman.cpp ./common/macresman.h
	./common/math.h
	./common/md5.cpp ./common/md5.h
	./common/mdct.cpp ./common/mdct.h
	./common/memory.h
	./common/memorypool.cpp ./common/memorypool.h
	./common/memstream.h
	./common/module.mk
	./common/mutex.cpp ./common/mutex.h
	./common/noncopyable.h
	./common/osd_message_queue.cpp ./common/osd_message_queue.h
	./common/pack-end.h
	./common/pack-start.h
	./common/path.cpp ./common/path.h
	./common/platform.cpp ./common/platform.h
	./common/ptr.h
	./common/punycode.cpp ./common/punycode.h
	./common/queue.h
	./common/quicktime.cpp ./common/quicktime.h
	./common/random.cpp ./common/random.h
	./common/rational.cpp ./common/rational.h
	./common/rdft.cpp ./common/rdft.h
	./common/recorderfile.cpp ./common/recorderfile.h
	./common/rect.h
	./common/rendermode.cpp ./common/rendermode.h
	./common/safe-bool.h
	./common/savefile.h
	./common/scummsys.h
	./common/serializer.h
	./common/sinetables.cpp ./common/sinetables.h
	./common/sinewindows.cpp ./common/sinewindows.h
	./common/singleton.h
	./common/span.h
	./common/stack.h
	./common/str-array.h
	./common/str-enc.cpp ./common/str-enc.h
	./common/str.cpp ./common/str.h
	./common/stream.cpp ./common/stream.h
	./common/streamdebug.cpp ./common/streamdebug.h
	./common/stuffit.cpp ./common/stuffit.h
	./common/substream.h
	./common/system.cpp ./common/system.h
	./common/taskbar.h
	./common/text-to-speech.cpp ./common/text-to-speech.h
	./common/textconsole.cpp ./common/textconsole.h
	./common/timer.h
	./common/tokenizer.cpp ./common/tokenizer.h
	./common/translation.cpp ./common/translation.h
	./common/type-traits.h
	./common/types.h
	./common/unarj.cpp ./common/unarj.h
	./common/unicode-bidi.cpp ./common/unicode-bidi.h
	./common/unzip.cpp ./common/unzip.h
	./common/updates.cpp ./common/updates.h
	./common/ustr.cpp ./common/ustr.h
	./common/util.cpp ./common/util.h
	./common/winexe.cpp ./common/winexe.h
	./common/winexe_ne.cpp ./common/winexe_ne.h
	./common/winexe_pe.cpp ./common/winexe_pe.h
	./common/xmlparser.cpp ./common/xmlparser.h
	./common/zlib.cpp ./common/zlib.h
	./engines/advancedDetector.cpp ./engines/advancedDetector.h
	./engines/detection_table.h
	./engines/dialogs.cpp ./engines/dialogs.h
	./engines/engine.cpp ./engines/engine.h
	./engines/game.cpp ./engines/game.h
	./engines/logo_data.h
	./engines/metaengine.cpp ./engines/metaengine.h
	./engines/module.mk
	./engines/obsolete.cpp ./engines/obsolete.h
	./engines/plugins_table.h
	./engines/savestate.cpp ./engines/savestate.h
	./engines/util.h
	./graphics/fonts/amigafont.cpp ./graphics/fonts/amigafont.h
	./graphics/fonts/bdf.cpp ./graphics/fonts/bdf.h
	./graphics/fonts/consolefont.cpp
	./graphics/fonts/macfont.cpp ./graphics/fonts/macfont.h
	./graphics/fonts/newfont.cpp
	./graphics/fonts/newfont_big.cpp
	./graphics/fonts/ttf.cpp ./graphics/fonts/ttf.h
	./graphics/fonts/winfont.cpp ./graphics/fonts/winfont.h
	./graphics/macgui/datafiles.cpp
	./graphics/macgui/macbutton.cpp ./graphics/macgui/macbutton.h
	./graphics/macgui/macfontmanager.cpp ./graphics/macgui/macfontmanager.h
	./graphics/macgui/macmenu.cpp ./graphics/macgui/macmenu.h
	./graphics/macgui/mactext.cpp ./graphics/macgui/mactext.h
	./graphics/macgui/mactextwindow.cpp ./graphics/macgui/mactextwindow.h
	./graphics/macgui/macwidget.cpp ./graphics/macgui/macwidget.h
	./graphics/macgui/macwindow.cpp ./graphics/macgui/macwindow.h
	./graphics/macgui/macwindowborder.cpp ./graphics/macgui/macwindowborder.h
	./graphics/macgui/macwindowmanager.cpp ./graphics/macgui/macwindowmanager.h
	./graphics/opengl/context.cpp ./graphics/opengl/context.h
	./graphics/opengl/glad.h
	./graphics/opengl/shader.cpp ./graphics/opengl/shader.h
	./graphics/opengl/system_headers.h
	./graphics/scaler/aspect.cpp ./graphics/scaler/aspect.h
	./graphics/scaler/dotmatrix.cpp ./graphics/scaler/dotmatrix.h
	./graphics/scaler/downscaler.cpp ./graphics/scaler/downscaler.h
	./graphics/scaler/edge.cpp ./graphics/scaler/edge.h
	./graphics/scaler/hq.cpp ./graphics/scaler/hq.h
	./graphics/scaler/hq2x_i386.asm
	./graphics/scaler/hq3x_i386.asm
	./graphics/scaler/intern.h
	./graphics/scaler/normal.cpp ./graphics/scaler/normal.h
	./graphics/scaler/pm.cpp ./graphics/scaler/pm.h
	./graphics/scaler/sai.cpp ./graphics/scaler/sai.h
	./graphics/scaler/scale2x.cpp ./graphics/scaler/scale2x.h
	./graphics/scaler/scale3x.cpp ./graphics/scaler/scale3x.h
	./graphics/scaler/scalebit.cpp ./graphics/scaler/scalebit.h
	./graphics/scaler/thumbnail_intern.cpp
	./graphics/scaler/tv.cpp ./graphics/scaler/tv.h
	./graphics/tinygl/api.cpp
	./graphics/tinygl/arrays.cpp
	./graphics/tinygl/clear.cpp
	./graphics/tinygl/clip.cpp
	./graphics/tinygl/get.cpp
	./graphics/tinygl/gl.h
	./graphics/tinygl/image_util.cpp
	./graphics/tinygl/init.cpp
	./graphics/tinygl/light.cpp
	./graphics/tinygl/list.cpp
	./graphics/tinygl/matrix.cpp
	./graphics/tinygl/memory.cpp
	./graphics/tinygl/misc.cpp
	./graphics/tinygl/opinfo.h
	./graphics/tinygl/pixelbuffer.cpp ./graphics/tinygl/pixelbuffer.h
	./graphics/tinygl/select.cpp
	./graphics/tinygl/specbuf.cpp
	./graphics/tinygl/texelbuffer.cpp ./graphics/tinygl/texelbuffer.h
	./graphics/tinygl/texture.cpp
	./graphics/tinygl/tinygl.h
	./graphics/tinygl/vertex.cpp
	./graphics/tinygl/zblit.cpp ./graphics/tinygl/zblit.h
	./graphics/tinygl/zblit_public.h
	./graphics/tinygl/zbuffer.cpp ./graphics/tinygl/zbuffer.h
	./graphics/tinygl/zdirtyrect.cpp ./graphics/tinygl/zdirtyrect.h
	./graphics/tinygl/zgl.h
	./graphics/tinygl/zline.cpp
	./graphics/tinygl/zmath.cpp ./graphics/tinygl/zmath.h
	./graphics/tinygl/ztriangle.cpp
	./graphics/VectorRenderer.cpp ./graphics/VectorRenderer.h
	./graphics/VectorRendererSpec.cpp ./graphics/VectorRendererSpec.h
	./graphics/colormasks.h
	./graphics/conversion.cpp ./graphics/conversion.h
	./graphics/cursor.h
	./graphics/cursorman.cpp ./graphics/cursorman.h
	./graphics/font.cpp ./graphics/font.h
	./graphics/fontman.cpp ./graphics/fontman.h
	./graphics/framelimiter.cpp ./graphics/framelimiter.h
	./graphics/korfont.cpp ./graphics/korfont.h
	./graphics/larryScale.cpp ./graphics/larryScale.h
	./graphics/maccursor.cpp ./graphics/maccursor.h
	./graphics/macega.h
	./graphics/managed_surface.cpp ./graphics/managed_surface.h
	./graphics/mode.h
	./graphics/module.mk
	./graphics/nine_patch.cpp ./graphics/nine_patch.h
	./graphics/palette.h
	./graphics/pixelformat.cpp ./graphics/pixelformat.h
	./graphics/primitives.cpp ./graphics/primitives.h
	./graphics/renderer.cpp ./graphics/renderer.h
	./graphics/scaler.h
	./graphics/scalerplugin.cpp ./graphics/scalerplugin.h
	./graphics/screen.cpp ./graphics/screen.h
	./graphics/sjis.cpp ./graphics/sjis.h
	./graphics/surface.cpp ./graphics/surface.h
	./graphics/svg.cpp ./graphics/svg.h
	./graphics/thumbnail.cpp ./graphics/thumbnail.h
	./graphics/transform_struct.cpp ./graphics/transform_struct.h
	./graphics/transform_tools.cpp ./graphics/transform_tools.h
	./graphics/transparent_surface.cpp ./graphics/transparent_surface.h
	./graphics/wincursor.cpp ./graphics/wincursor.h
	./graphics/yuv_to_rgb.cpp ./graphics/yuv_to_rgb.h
	./gui/animation/AccelerateInterpolator.h
	./gui/animation/AlphaAnimation.h
	./gui/animation/Animation.cpp ./gui/animation/Animation.h
	./gui/animation/DeccelerateInterpolator.h
	./gui/animation/Drawable.h
	./gui/animation/Interpolator.h
	./gui/animation/ParallelAnimation.h
	./gui/animation/RepeatAnimationWrapper.cpp ./gui/animation/RepeatAnimationWrapper.h
	./gui/animation/ScaleAnimation.h
	./gui/animation/SequenceAnimationComposite.cpp ./gui/animation/SequenceAnimationComposite.h
	./gui/animation/WaitForConditionAnimation.h
	./gui/widgets/editable.cpp ./gui/widgets/editable.h
	./gui/widgets/edittext.cpp ./gui/widgets/edittext.h
	./gui/widgets/grid.cpp ./gui/widgets/grid.h
	./gui/widgets/groupedlist.cpp ./gui/widgets/groupedlist.h
	./gui/widgets/list.cpp ./gui/widgets/list.h
	./gui/widgets/popup.cpp ./gui/widgets/popup.h
	./gui/widgets/scrollbar.cpp ./gui/widgets/scrollbar.h
	./gui/widgets/scrollcontainer.cpp ./gui/widgets/scrollcontainer.h
	./gui/widgets/tab.cpp ./gui/widgets/tab.h
	./gui/EventRecorder.cpp ./gui/EventRecorder.h
	./gui/MetadataParser.cpp ./gui/MetadataParser.h
	./gui/ThemeEngine.cpp ./gui/ThemeEngine.h
	./gui/ThemeEval.cpp ./gui/ThemeEval.h
	./gui/ThemeLayout.cpp ./gui/ThemeLayout.h
	./gui/ThemeParser.cpp ./gui/ThemeParser.h
	./gui/Tooltip.cpp ./gui/Tooltip.h
	./gui/about.cpp ./gui/about.h
	./gui/browser.cpp ./gui/browser.h
	./gui/chooser.cpp ./gui/chooser.h
	./gui/console.cpp ./gui/console.h
	./gui/credits.h
	./gui/debugger.cpp ./gui/debugger.h
	./gui/dialog.cpp ./gui/dialog.h
	./gui/downloaddialog.cpp ./gui/downloaddialog.h
	./gui/downloadiconsdialog.cpp ./gui/downloadiconsdialog.h
	./gui/editgamedialog.cpp ./gui/editgamedialog.h
	./gui/editrecorddialog.cpp ./gui/editrecorddialog.h
	./gui/error.cpp ./gui/error.h
	./gui/filebrowser-dialog.cpp ./gui/filebrowser-dialog.h
	./gui/fluidsynth-dialog.cpp ./gui/fluidsynth-dialog.h
	./gui/gui-manager.cpp ./gui/gui-manager.h
	./gui/launcher.cpp ./gui/launcher.h
	./gui/massadd.cpp ./gui/massadd.h
	./gui/message.cpp ./gui/message.h
	./gui/module.mk
	./gui/object.cpp ./gui/object.h
	./gui/onscreendialog.cpp ./gui/onscreendialog.h
	./gui/options.cpp ./gui/options.h
	./gui/predictivedialog.cpp ./gui/predictivedialog.h
	./gui/recorderdialog.cpp ./gui/recorderdialog.h
	./gui/remotebrowser.cpp ./gui/remotebrowser.h
	./gui/saveload-dialog.cpp ./gui/saveload-dialog.h
	./gui/saveload.cpp ./gui/saveload.h
	./gui/themebrowser.cpp ./gui/themebrowser.h
	./gui/unknown-game-dialog.cpp ./gui/unknown-game-dialog.h
	./gui/updates-dialog.cpp ./gui/updates-dialog.h
	./gui/widget.cpp ./gui/widget.h
	./image/codecs/indeo/get_bits.h
	./image/codecs/indeo/indeo.cpp ./image/codecs/indeo/indeo.h
	./image/codecs/indeo/indeo_dsp.cpp ./image/codecs/indeo/indeo_dsp.h
	./image/codecs/indeo/mem.cpp ./image/codecs/indeo/mem.h
	./image/codecs/indeo/vlc.cpp ./image/codecs/indeo/vlc.h
	./image/codecs/bmp_raw.cpp ./image/codecs/bmp_raw.h
	./image/codecs/cdtoons.cpp ./image/codecs/cdtoons.h
	./image/codecs/cinepak.cpp ./image/codecs/cinepak.h
	./image/codecs/cinepak_tables.h
	./image/codecs/codec.cpp ./image/codecs/codec.h
	./image/codecs/hlz.cpp ./image/codecs/hlz.h
	./image/codecs/indeo3.cpp ./image/codecs/indeo3.h
	./image/codecs/indeo4.cpp ./image/codecs/indeo4.h
	./image/codecs/indeo5.cpp ./image/codecs/indeo5.h
	./image/codecs/jyv1.cpp ./image/codecs/jyv1.h
	./image/codecs/mjpeg.cpp ./image/codecs/mjpeg.h
	./image/codecs/mpeg.cpp ./image/codecs/mpeg.h
	./image/codecs/msrle.cpp ./image/codecs/msrle.h
	./image/codecs/msrle4.cpp ./image/codecs/msrle4.h
	./image/codecs/msvideo1.cpp ./image/codecs/msvideo1.h
	./image/codecs/qtrle.cpp ./image/codecs/qtrle.h
	./image/codecs/rpza.cpp ./image/codecs/rpza.h
	./image/codecs/smc.cpp ./image/codecs/smc.h
	./image/codecs/svq1.cpp ./image/codecs/svq1.h
	./image/codecs/svq1_cb.h
	./image/codecs/svq1_vlc.h
	./image/codecs/truemotion1.cpp ./image/codecs/truemotion1.h
	./image/codecs/truemotion1data.h
	./image/codecs/xan.cpp ./image/codecs/xan.h
	./image/bmp.cpp ./image/bmp.h
	./image/cel_3do.cpp ./image/cel_3do.h
	./image/gif.cpp ./image/gif.h
	./image/iff.cpp ./image/iff.h
	./image/image_decoder.h
	./image/jpeg.cpp ./image/jpeg.h
	./image/module.mk
	./image/pcx.cpp ./image/pcx.h
	./image/pict.cpp ./image/pict.h
	./image/png.cpp ./image/png.h
	./image/tga.cpp ./image/tga.h
	./math/aabb.cpp ./math/aabb.h
	./math/angle.cpp ./math/angle.h
	./math/frustum.cpp ./math/frustum.h
	./math/glmath.cpp ./math/glmath.h
	./math/line2d.cpp ./math/line2d.h
	./math/line3d.cpp ./math/line3d.h
	./math/mathfwd.h
	./math/matrix.h
	./math/matrix3.cpp ./math/matrix3.h
	./math/matrix4.cpp ./math/matrix4.h
	./math/module.mk
	./math/plane.cpp ./math/plane.h
	./math/quat.cpp ./math/quat.h
	./math/ray.cpp ./math/ray.h
	./math/rect2d.cpp ./math/rect2d.h
	./math/rotation3d.h
	./math/squarematrix.h
	./math/transform.h
	./math/utils.h
	./math/vector.h
	./math/vector2d.cpp ./math/vector2d.h
	./math/vector3d.cpp ./math/vector3d.h
	./math/vector4d.cpp ./math/vector4d.h
	./video/3do_decoder.cpp ./video/3do_decoder.h
	./video/avi_decoder.cpp ./video/avi_decoder.h
	./video/bink_decoder.cpp ./video/bink_decoder.h
	./video/binkdata.h
	./video/coktel_decoder.cpp ./video/coktel_decoder.h
	./video/dxa_decoder.cpp ./video/dxa_decoder.h
	./video/flic_decoder.cpp ./video/flic_decoder.h
	./video/hnm_decoder.cpp ./video/hnm_decoder.h
	./video/module.mk
	./video/mpegps_decoder.cpp ./video/mpegps_decoder.h
	./video/mve_decoder.cpp ./video/mve_decoder.h
	./video/psx_decoder.cpp ./video/psx_decoder.h
	./video/qt_data.h
	./video/qt_decoder.cpp ./video/qt_decoder.h
	./video/smk_decoder.cpp ./video/smk_decoder.h
	./video/theora_decoder.cpp ./video/theora_decoder.h
	./video/video_decoder.cpp ./video/video_decoder.h
	./AUTHORS
	./COPYING
	./COPYRIGHT
	./NEWS.md
	./README.md
)

# Engines libraries handling
foreach(ENGINE IN LISTS ENGINES)
	string(TOLOWER ${ENGINE} ENGINE_DIR)
	add_subdirectory(engines/${ENGINE_DIR})
endforeach()

# Libraries
target_link_libraries(scummvm ${SDL2_LIBRARIES} ${SCUMMVM_LIBS})
if (WIN32)
	target_sources(scummvm PUBLIC ./dists/scummvm.rc)
	target_link_libraries(scummvm winmm)
endif()

if (WIN32)
	target_link_libraries(scummvm sapi ole32)
endif()
set_property(TARGET scummvm PROPERTY CXX_STANDARD 11)
set_property(TARGET scummvm PROPERTY CXX_STANDARD_REQUIRED ON)
