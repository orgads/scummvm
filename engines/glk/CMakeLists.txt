add_engine(glk
	adrift/adrift.cpp adrift/adrift.h
	adrift/detection.cpp adrift/detection.h
	adrift/detection_tables.h
	adrift/os_glk.cpp adrift/os_glk.h
	adrift/scare.h
	adrift/scdebug.cpp
	adrift/scevents.cpp
	adrift/scexpr.cpp
	adrift/scgamest.cpp adrift/scgamest.h
	adrift/scinterf.cpp
	adrift/sclibrar.cpp
	adrift/sclocale.cpp
	adrift/scmemos.cpp
	adrift/scnpcs.cpp
	adrift/scobjcts.cpp
	adrift/scparser.cpp
	adrift/scprintf.cpp
	adrift/scprops.cpp
	adrift/scprotos.h
	adrift/scresour.cpp
	adrift/screstrs.cpp
	adrift/scrunner.cpp
	adrift/sctaffil.cpp
	adrift/sctafpar.cpp
	adrift/sctasks.cpp
	adrift/scutils.cpp
	adrift/scvars.cpp
	adrift/serialization.cpp adrift/serialization.h
	adrift/sxfile.cpp
	adrift/sxglob.cpp
	adrift/sxprotos.h
	adrift/sxutils.cpp
	advsys/advsys.cpp advsys/advsys.h
	advsys/definitions.h
	advsys/detection.cpp advsys/detection.h
	advsys/detection_tables.h
	advsys/game.cpp advsys/game.h
	advsys/glk_interface.cpp advsys/glk_interface.h
	advsys/vm.cpp advsys/vm.h
	agt/agil.cpp
	agt/agility.h
	agt/agt.cpp agt/agt.h
	agt/agtread.cpp
	agt/agxfile.cpp
	agt/auxfile.cpp
	agt/config.h
	agt/debugcmd.cpp
	agt/detection.cpp agt/detection.h
	agt/detection_tables.h
	agt/disassemble.cpp
	agt/exec.cpp agt/exec.h
	agt/filename.cpp
	agt/gamedata.cpp
	agt/interface.cpp
	agt/interp.h
	agt/metacommand.cpp
	agt/object.cpp
	agt/os_glk.cpp
	agt/parser.cpp
	agt/runverb.cpp
	agt/savegame.cpp
	agt/token.cpp
	agt/util.cpp
	agt/vars.cpp
	alan2/acode.h
	alan2/alan2.cpp alan2/alan2.h
	alan2/alan_version.cpp alan2/alan_version.h
	alan2/args.cpp alan2/args.h
	alan2/debug.cpp alan2/debug.h
	alan2/decode.cpp alan2/decode.h
	alan2/detection.cpp alan2/detection.h
	alan2/detection_tables.h
	alan2/exe.cpp alan2/exe.h
	alan2/glkio.cpp alan2/glkio.h
	alan2/inter.cpp alan2/inter.h
	alan2/main.cpp alan2/main.h
	alan2/params.cpp alan2/params.h
	alan2/parse.cpp alan2/parse.h
	alan2/reverse.cpp alan2/reverse.h
	alan2/rules.cpp alan2/rules.h
	alan2/stack.cpp alan2/stack.h
	alan2/sysdep.cpp alan2/sysdep.h
	alan2/types.cpp alan2/types.h
	alan2/version.h
	alan3/acode.cpp alan3/acode.h
	alan3/act.cpp alan3/act.h
	alan3/actor.cpp alan3/actor.h
	alan3/alan3.cpp alan3/alan3.h
	alan3/alan_version.cpp alan3/alan_version.h
	alan3/alt_info.cpp alan3/alt_info.h
	alan3/attribute.cpp alan3/attribute.h
	alan3/checkentry.cpp alan3/checkentry.h
	alan3/class.cpp alan3/class.h
	alan3/compatibility.cpp alan3/compatibility.h
	alan3/container.cpp alan3/container.h
	alan3/current.cpp alan3/current.h
	alan3/debug.cpp alan3/debug.h
	alan3/decode.cpp alan3/decode.h
	alan3/detection.cpp alan3/detection.h
	alan3/detection_tables.h
	alan3/dictionary.cpp alan3/dictionary.h
	alan3/event.cpp alan3/event.h
	alan3/exe.cpp alan3/exe.h
	alan3/fnmatch.cpp alan3/fnmatch.h
	alan3/glkio.cpp alan3/glkio.h
	alan3/instance.cpp alan3/instance.h
	alan3/inter.cpp alan3/inter.h
	alan3/lists.cpp alan3/lists.h
	alan3/literal.cpp alan3/literal.h
	alan3/location.cpp alan3/location.h
	alan3/main.cpp alan3/main.h
	alan3/memory.cpp alan3/memory.h
	alan3/msg.cpp alan3/msg.h
	alan3/options.cpp alan3/options.h
	alan3/output.cpp alan3/output.h
	alan3/parameter_position.cpp alan3/parameter_position.h
	alan3/params.cpp alan3/params.h
	alan3/parse.cpp alan3/parse.h
	alan3/resources.h
	alan3/reverse.cpp alan3/reverse.h
	alan3/rules.cpp alan3/rules.h
	alan3/save.cpp alan3/save.h
	alan3/scan.cpp alan3/scan.h
	alan3/score.cpp alan3/score.h
	alan3/set.cpp alan3/set.h
	alan3/stack.cpp alan3/stack.h
	alan3/state.cpp alan3/state.h
	alan3/state_stack.cpp alan3/state_stack.h
	alan3/syntax.cpp alan3/syntax.h
	alan3/sysdep.cpp alan3/sysdep.h
	alan3/syserr.cpp alan3/syserr.h
	alan3/types.cpp alan3/types.h
	alan3/utils.cpp alan3/utils.h
	alan3/version.h
	alan3/word.cpp alan3/word.h
	archetype/archetype.cpp archetype/archetype.h
	archetype/array.cpp archetype/array.h
	archetype/crypt.cpp archetype/crypt.h
	archetype/detection.cpp archetype/detection.h
	archetype/detection_tables.h
	archetype/error.cpp archetype/error.h
	archetype/expression.cpp archetype/expression.h
	archetype/game_stat.cpp archetype/game_stat.h
	archetype/heap_sort.cpp archetype/heap_sort.h
	archetype/id_table.cpp archetype/id_table.h
	archetype/interpreter.cpp archetype/interpreter.h
	archetype/keywords.cpp archetype/keywords.h
	archetype/linked_list.cpp archetype/linked_list.h
	archetype/misc.cpp archetype/misc.h
	archetype/parser.cpp archetype/parser.h
	archetype/saveload.cpp archetype/saveload.h
	archetype/semantic.cpp archetype/semantic.h
	archetype/statement.h
	archetype/string.cpp archetype/string.h
	archetype/sys_object.cpp archetype/sys_object.h
	archetype/timestamp.cpp archetype/timestamp.h
	archetype/token.cpp archetype/token.h
	comprehend/charset.cpp comprehend/charset.h
	comprehend/comprehend.cpp comprehend/comprehend.h
	comprehend/debugger.cpp comprehend/debugger.h
	comprehend/debugger_dumper.cpp comprehend/debugger_dumper.h
	comprehend/detection.cpp comprehend/detection.h
	comprehend/detection_tables.h
	comprehend/dictionary.cpp comprehend/dictionary.h
	comprehend/draw_surface.cpp comprehend/draw_surface.h
	comprehend/file_buf.cpp comprehend/file_buf.h
	comprehend/game.cpp comprehend/game.h
	comprehend/game_cc.cpp comprehend/game_cc.h
	comprehend/game_data.cpp comprehend/game_data.h
	comprehend/game_oo.cpp comprehend/game_oo.h
	comprehend/game_opcodes.cpp comprehend/game_opcodes.h
	comprehend/game_tm.cpp comprehend/game_tm.h
	comprehend/game_tr1.cpp comprehend/game_tr1.h
	comprehend/game_tr2.cpp comprehend/game_tr2.h
	comprehend/pics.cpp comprehend/pics.h
	glulx/accel.cpp
	glulx/detection.cpp glulx/detection.h
	glulx/detection_tables.h
	glulx/exec.cpp
	glulx/float.cpp glulx/float.h
	glulx/funcs.cpp
	glulx/gestalt.cpp
	glulx/glkop.cpp
	glulx/glulx.cpp glulx/glulx.h
	glulx/glulx_types.h
	glulx/heap.cpp
	glulx/operand.cpp
	glulx/search.cpp
	glulx/serial.cpp
	glulx/string.cpp
	glulx/vm.cpp
	hugo/detection.cpp hugo/detection.h
	hugo/detection_tables.h
	hugo/heexpr.cpp
	hugo/heglk.cpp
	hugo/hemedia.cpp
	hugo/hemisc.cpp
	hugo/heobject.cpp
	hugo/heparse.cpp
	hugo/heres.cpp
	hugo/herun.cpp
	hugo/heset.cpp
	hugo/htokens.cpp hugo/htokens.h
	hugo/hugo.cpp hugo/hugo.h
	hugo/hugo_defines.h
	hugo/hugo_types.h
	hugo/resource_archive.cpp hugo/resource_archive.h
	hugo/stringfn.cpp hugo/stringfn.h
	jacl/constants.h
	jacl/csv.h
	jacl/detection.cpp jacl/detection.h
	jacl/detection_tables.h
	jacl/display.cpp
	jacl/encapsulate.cpp
	jacl/errors.cpp
	jacl/findroute.cpp
	jacl/glk_saver.cpp
	jacl/interpreter.cpp
	jacl/jacl.cpp jacl/jacl.h
	jacl/jacl_main.cpp
	jacl/jpp.cpp
	jacl/language.h
	jacl/libcsv.cpp
	jacl/loader.cpp
	jacl/logging.cpp
	jacl/parser.cpp
	jacl/prototypes.h
	jacl/resolvers.cpp
	jacl/types.h
	jacl/utils.cpp
	jacl/version.h
	level9/bitmap.cpp
	level9/detection.cpp level9/detection.h
	level9/detection_tables.h
	level9/level9.cpp level9/level9.h
	level9/level9_main.cpp level9/level9_main.h
	level9/os_glk.cpp level9/os_glk.h
	magnetic/detection.cpp magnetic/detection.h
	magnetic/detection_tables.h
	magnetic/emu.cpp
	magnetic/glk.cpp
	magnetic/magnetic.cpp magnetic/magnetic.h
	magnetic/magnetic_defs.h
	magnetic/magnetic_types.h
	quest/detection.cpp quest/detection.h
	quest/detection_tables.h
	quest/geas_file.cpp quest/geas_file.h
	quest/geas_glk.cpp quest/geas_glk.h
	quest/geas_impl.h
	quest/geas_runner.cpp quest/geas_runner.h
	quest/geas_state.cpp quest/geas_state.h
	quest/geas_util.cpp quest/geas_util.h
	quest/limit_stack.h
	quest/quest.cpp quest/quest.h
	quest/read_file.cpp quest/read_file.h
	quest/reserved_words.h
	quest/streams.cpp quest/streams.h
	quest/string.cpp quest/string.h
	scott/detection.cpp scott/detection.h
	scott/detection_tables.h
	scott/scott.cpp scott/scott.h
	tads/tads2/appctx.h
	tads/tads2/built_in.cpp tads/tads2/built_in.h
	tads/tads2/character_map.cpp tads/tads2/character_map.h
	tads/tads2/command_line.cpp tads/tads2/command_line.h
	tads/tads2/data.cpp tads/tads2/data.h
	tads/tads2/debug.cpp tads/tads2/debug.h
	tads/tads2/error.cpp tads/tads2/error.h
	tads/tads2/error_handling.cpp tads/tads2/error_handling.h
	tads/tads2/error_message.cpp
	tads/tads2/execute_command.cpp
	tads/tads2/file_io.cpp tads/tads2/file_io.h
	tads/tads2/get_string.cpp
	tads/tads2/lib.h
	tads/tads2/line_source.h
	tads/tads2/line_source_file.cpp tads/tads2/line_source_file.h
	tads/tads2/list.cpp tads/tads2/list.h
	tads/tads2/ltk.cpp tads/tads2/ltk.h
	tads/tads2/memory_cache.cpp tads/tads2/memory_cache.h
	tads/tads2/memory_cache_heap.cpp tads/tads2/memory_cache_heap.h
	tads/tads2/memory_cache_loader.h
	tads/tads2/memory_cache_swap.cpp tads/tads2/memory_cache_swap.h
	tads/tads2/object.cpp tads/tads2/object.h
	tads/tads2/opcode.h
	tads/tads2/os.cpp tads/tads2/os.h
	tads/tads2/output.cpp
	tads/tads2/play.cpp tads/tads2/play.h
	tads/tads2/post_compilation.cpp tads/tads2/post_compilation.h
	tads/tads2/property.h
	tads/tads2/qa_scriptor.cpp
	tads/tads2/regex.cpp tads/tads2/regex.h
	tads/tads2/run.cpp tads/tads2/run.h
	tads/tads2/runstat.cpp
	tads/tads2/runtime_app.cpp tads/tads2/runtime_app.h
	tads/tads2/runtime_driver.cpp
	tads/tads2/string_resources.h
	tads/tads2/tads2.cpp tads/tads2/tads2.h
	tads/tads2/text_io.h
	tads/tads2/tokenizer.cpp tads/tads2/tokenizer.h
	tads/tads2/tokenizer_hash.cpp
	tads/tads2/vocabulary.cpp tads/tads2/vocabulary.h
	tads/tads2/vocabulary_parser.cpp
	tads/tads3/tads3.cpp tads/tads3/tads3.h
	tads/detection.cpp tads/detection.h
	tads/detection_tables.h
	tads/os_banners.cpp tads/os_banners.h
	tads/os_buffer.cpp tads/os_buffer.h
	tads/os_filetype.h
	tads/os_frob_tads.cpp tads/os_frob_tads.h
	tads/os_glk.cpp tads/os_glk.h
	tads/os_parse.cpp tads/os_parse.h
	tads/tads.cpp tads/tads.h
	zcode/bitmap_font.cpp zcode/bitmap_font.h
	zcode/config.cpp zcode/config.h
	zcode/detection.cpp zcode/detection.h
	zcode/detection_tables.h
	zcode/frotz_types.h
	zcode/glk_interface.cpp zcode/glk_interface.h
	zcode/mem.cpp zcode/mem.h
	zcode/pics.cpp zcode/pics.h
	zcode/pics_decoder.cpp zcode/pics_decoder.h
	zcode/processor.cpp zcode/processor.h
	zcode/processor_buffer.cpp
	zcode/processor_input.cpp
	zcode/processor_maths.cpp
	zcode/processor_mem.cpp
	zcode/processor_objects.cpp
	zcode/processor_screen.cpp
	zcode/processor_streams.cpp
	zcode/processor_table.cpp
	zcode/processor_text.cpp
	zcode/processor_variables.cpp
	zcode/processor_windows.cpp
	zcode/quetzal.cpp zcode/quetzal.h
	zcode/screen.cpp zcode/screen.h
	zcode/sound_folder.cpp zcode/sound_folder.h
	zcode/windows.cpp zcode/windows.h
	zcode/zcode.cpp zcode/zcode.h
	blorb.cpp blorb.h
	conf.cpp conf.h
	debugger.cpp debugger.h
	detection.cpp detection.h
	events.cpp events.h
	fonts.cpp fonts.h
	game_description.h
	glk.cpp glk.h
	glk_api.cpp glk_api.h
	glk_dispa.cpp
	glk_types.h
	jumps.h
	metaengine.cpp
	module.mk
	pc_speaker.cpp pc_speaker.h
	picture.cpp picture.h
	quetzal.cpp quetzal.h
	raw_decoder.cpp raw_decoder.h
	screen.cpp screen.h
	selection.cpp selection.h
	sound.cpp sound.h
	speech.cpp speech.h
	streams.cpp streams.h
	time.cpp time.h
	unicode.cpp unicode.h
	unicode_gen.cpp unicode_gen.h
	utils.cpp utils.h
	window_graphics.cpp window_graphics.h
	window_pair.cpp window_pair.h
	window_text_buffer.cpp window_text_buffer.h
	window_text_grid.cpp window_text_grid.h
	windows.cpp windows.h
)
