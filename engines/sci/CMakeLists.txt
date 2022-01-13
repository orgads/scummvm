add_engine(sci
	engine/features.cpp engine/features.h
	engine/file.cpp engine/file.h
	engine/gc.cpp engine/gc.h
	engine/guest_additions.cpp engine/guest_additions.h
	engine/hoyle5poker.cpp engine/hoyle5poker.h
	engine/kernel.cpp engine/kernel.h
	engine/kernel_tables.h
	engine/kevent.cpp
	engine/kfile.cpp
	engine/kgraphics.cpp
	engine/kgraphics32.cpp
	engine/klists.cpp
	engine/kmath.cpp
	engine/kmenu.cpp
	engine/kmisc.cpp
	engine/kmovement.cpp
	engine/kparse.cpp
	engine/kpathing.cpp
	engine/kscripts.cpp
	engine/ksound.cpp
	engine/kstring.cpp
	engine/kvideo.cpp
	engine/message.cpp engine/message.h
	engine/object.cpp engine/object.h
	engine/savegame.cpp engine/savegame.h
	engine/script.cpp engine/script.h
	engine/script_patches.cpp engine/script_patches.h
	engine/scriptdebug.cpp engine/scriptdebug.h
	engine/seg_manager.cpp engine/seg_manager.h
	engine/segment.cpp engine/segment.h
	engine/selector.cpp engine/selector.h
	engine/state.cpp engine/state.h
	engine/static_selectors.cpp
	engine/tts.cpp engine/tts.h
	engine/vm.cpp engine/vm.h
	engine/vm_types.cpp engine/vm_types.h
	engine/workarounds.cpp engine/workarounds.h
	graphics/animate.cpp graphics/animate.h
	graphics/cache.cpp graphics/cache.h
	graphics/celobj32.cpp graphics/celobj32.h
	graphics/compare.cpp graphics/compare.h
	graphics/controls16.cpp graphics/controls16.h
	graphics/controls32.cpp graphics/controls32.h
	graphics/coordadjuster.cpp graphics/coordadjuster.h
	graphics/cursor.cpp graphics/cursor.h
	graphics/cursor32.cpp graphics/cursor32.h
	graphics/fontkorean.cpp graphics/fontkorean.h
	graphics/fontsjis.cpp graphics/fontsjis.h
	graphics/frameout.cpp graphics/frameout.h
	graphics/helpers.h
	graphics/helpers_detection_enums.h
	graphics/lists32.h
	graphics/maccursor32.cpp graphics/maccursor32.h
	graphics/maciconbar.cpp graphics/maciconbar.h
	graphics/menu.cpp graphics/menu.h
	graphics/paint16.cpp graphics/paint16.h
	graphics/paint32.cpp graphics/paint32.h
	graphics/palette.cpp graphics/palette.h
	graphics/palette32.cpp graphics/palette32.h
	graphics/picture.cpp graphics/picture.h
	graphics/plane32.cpp graphics/plane32.h
	graphics/portrait.cpp graphics/portrait.h
	graphics/ports.cpp graphics/ports.h
	graphics/remap.cpp graphics/remap.h
	graphics/remap32.cpp graphics/remap32.h
	graphics/scifont.cpp graphics/scifont.h
	graphics/scifx.cpp graphics/scifx.h
	graphics/screen.cpp graphics/screen.h
	graphics/screen_item32.cpp graphics/screen_item32.h
	graphics/text16.cpp graphics/text16.h
	graphics/text32.cpp graphics/text32.h
	graphics/transitions.cpp graphics/transitions.h
	graphics/transitions32.cpp graphics/transitions32.h
	graphics/video32.cpp graphics/video32.h
	graphics/view.cpp graphics/view.h
	parser/grammar.cpp
	parser/said.cpp
	parser/vocabulary.cpp parser/vocabulary.h
	resource/decompressor.cpp resource/decompressor.h
	resource/resource.cpp resource/resource.h
	resource/resource_audio.cpp
	resource/resource_intern.h
	resource/resource_patcher.cpp resource/resource_patcher.h
	sound/decoders/sol.cpp sound/decoders/sol.h
	sound/drivers/adlib.cpp
	sound/drivers/amigamac0.cpp
	sound/drivers/amigamac1.cpp
	sound/drivers/cms.cpp
	sound/drivers/fb01.cpp
	sound/drivers/fmtowns.cpp
	sound/drivers/gm_names.h
	sound/drivers/macmixer.h
	sound/drivers/map-mt32-to-gm.h
	sound/drivers/midi.cpp
	sound/drivers/mididriver.h
	sound/drivers/pc9801.cpp
	sound/drivers/pcjr.cpp
	sound/audio.cpp sound/audio.h
	sound/audio32.cpp sound/audio32.h
	sound/midiparser_sci.cpp sound/midiparser_sci.h
	sound/music.cpp sound/music.h
	sound/soundcmd.cpp sound/soundcmd.h
	sound/sync.cpp sound/sync.h
	video/robot_decoder.cpp video/robot_decoder.h
	video/seq_decoder.cpp video/seq_decoder.h
	console.cpp console.h
	debug.h
	detection.h
	detection_options.h
	detection_tables.h
	dialogs.cpp dialogs.h
	event.cpp event.h
	metaengine.cpp
	module.mk
	sci.cpp sci.h
	util.cpp util.h
)
