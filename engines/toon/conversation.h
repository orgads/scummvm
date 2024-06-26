/* ScummVM - Graphic Adventure Engine
 *
 * ScummVM is the legal property of its developers, whose names
 * are too numerous to list here. Please refer to the COPYRIGHT
 * file distributed with this source distribution.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 * This file is dual-licensed.
 * In addition to the GPLv3 license mentioned above, MojoTouch has
 * exclusively licensed this code on March 23th, 2024, to be used in
 * closed-source products.
 * Therefore, any contributions (commits) to it will also be dual-licensed.
 *
 */

#ifndef TOON_CONVERSATION_H
#define TOON_CONVERSATION_H

#include "engines/engine.h"
#include "common/stream.h"

namespace Toon {

class Conversation {
public:
	int32 _enable;    // 00

	struct ConvState {
		int32 _data2; // 04
		int16 _data3; // 08
		void *_data4; // 10
	} state[10];

	void save(Common::WriteStream *stream, int16 *conversationDataBase);
	void load(Common::ReadStream *stream, int16 *conversationDataBase);
};

} // End of namespace Toon

#endif
