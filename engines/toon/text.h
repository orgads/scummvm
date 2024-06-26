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

#ifndef TOON_TEXT_H
#define TOON_TEXT_H

#include "toon/toon.h"

namespace Toon {

class TextResource {
public:
	TextResource(ToonEngine *vm);
	~TextResource(void);

	bool loadTextResource(const Common::Path &fileName);
	char *getText(int32 id);
	int32 getId(int32 offset);
	int32 getNext(int32 offset);

protected:
	int32 _numTexts;
	uint8 *_textData;
	ToonEngine *_vm;
};

} // End of namespace Toon

#endif
