add_engine(zvision
	core/clock.cpp core/clock.h
	core/console.cpp core/console.h
	core/events.cpp
	file/lzss_read_stream.cpp file/lzss_read_stream.h
	file/save_manager.cpp file/save_manager.h
	file/search_manager.cpp file/search_manager.h
	file/zfs_archive.cpp file/zfs_archive.h
	graphics/cursors/cursor.cpp graphics/cursors/cursor.h
	graphics/cursors/cursor_manager.cpp graphics/cursors/cursor_manager.h
	graphics/effects/fog.cpp graphics/effects/fog.h
	graphics/effects/light.cpp graphics/effects/light.h
	graphics/effects/wave.cpp graphics/effects/wave.h
	graphics/graphics_effect.h
	graphics/render_manager.cpp graphics/render_manager.h
	graphics/render_table.cpp graphics/render_table.h
	scripting/controls/fist_control.cpp scripting/controls/fist_control.h
	scripting/controls/hotmov_control.cpp scripting/controls/hotmov_control.h
	scripting/controls/input_control.cpp scripting/controls/input_control.h
	scripting/controls/lever_control.cpp scripting/controls/lever_control.h
	scripting/controls/paint_control.cpp scripting/controls/paint_control.h
	scripting/controls/push_toggle_control.cpp scripting/controls/push_toggle_control.h
	scripting/controls/safe_control.cpp scripting/controls/safe_control.h
	scripting/controls/save_control.cpp scripting/controls/save_control.h
	scripting/controls/slot_control.cpp scripting/controls/slot_control.h
	scripting/controls/titler_control.cpp scripting/controls/titler_control.h
	scripting/effects/animation_effect.cpp scripting/effects/animation_effect.h
	scripting/effects/distort_effect.cpp scripting/effects/distort_effect.h
	scripting/effects/music_effect.cpp scripting/effects/music_effect.h
	scripting/effects/region_effect.cpp scripting/effects/region_effect.h
	scripting/effects/syncsound_effect.cpp scripting/effects/syncsound_effect.h
	scripting/effects/timer_effect.cpp scripting/effects/timer_effect.h
	scripting/effects/ttytext_effect.cpp scripting/effects/ttytext_effect.h
	scripting/actions.cpp scripting/actions.h
	scripting/control.cpp scripting/control.h
	scripting/inventory.cpp
	scripting/menu.cpp scripting/menu.h
	scripting/puzzle.h
	scripting/scr_file_handling.cpp
	scripting/script_manager.cpp scripting/script_manager.h
	scripting/scripting_effect.h
	sound/midi.cpp sound/midi.h
	sound/zork_raw.cpp sound/zork_raw.h
	text/string_manager.cpp text/string_manager.h
	text/subtitles.cpp text/subtitles.h
	text/text.cpp text/text.h
	text/truetype_font.cpp text/truetype_font.h
	video/rlf_decoder.cpp video/rlf_decoder.h
	video/video.cpp
	video/zork_avi_decoder.cpp video/zork_avi_decoder.h
	detection.h
	detection_tables.h
	metaengine.cpp
	module.mk
	zvision.cpp zvision.h
)
