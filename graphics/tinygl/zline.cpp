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
 */

/*
 * This file is based on, or a modified version of code from TinyGL (C) 1997-2022 Fabrice Bellard,
 * which is licensed under the MIT license (see LICENSE).
 * It also has modifications by the ResidualVM-team, which are covered under the GPLv2 (or later).
 */

#include "graphics/tinygl/zbuffer.h"

namespace TinyGL {

FORCEINLINE void FrameBuffer::putPixel(uint pixelOffset, int color, int x, int y, uint z, bool depthWrite) {
	putPixel(pixelOffset, color, x, y, z, depthWrite, _clippingEnabled);
}

FORCEINLINE void FrameBuffer::putPixel(uint pixelOffset, int color, int x, int y, uint z, bool depthWrite, bool enableScissor) {
	if (enableScissor && scissorPixel(x, y)) {
		return;
	}
	uint *pz = _zbuf + pixelOffset;
	if (compareDepth(z, *pz)) {
		if (depthWrite) {
			writePixel<true, true, true>(pixelOffset, color, z);
		} else {
			writePixel<true, true, false>(pixelOffset, color, z);
		}
	}
}

FORCEINLINE void FrameBuffer::putPixel(uint pixelOffset, int color, int x, int y, bool enableScissor) {
	if (enableScissor && scissorPixel(x, y)) {
		return;
	}
	writePixel<true, true>(pixelOffset, color);
}

void FrameBuffer::writePixel(int pixel, byte aSrc, byte rSrc, byte gSrc, byte bSrc,
	float z, uint fog, byte fog_r, byte fog_g, byte fog_b, const BaseRasterFlags &flags) {
	if (flags.alphaTest) {
		if (!checkAlphaTest(aSrc))
			return;
	}

	if (flags.depthWrite) {
		_zbuf[pixel] = z;
	}

	if (flags.fog) {
		int oneMinusFog = (1 << ZB_FOG_BITS) - fog;
		int finalR = (rSrc * fog + fog_r * oneMinusFog) >> ZB_FOG_BITS;
		int finalG = (gSrc * fog + fog_g * oneMinusFog) >> ZB_FOG_BITS;
		int finalB = (bSrc * fog + fog_b * oneMinusFog) >> ZB_FOG_BITS;
		if (finalR > 255) {
			rSrc = 255;
		} else {
			rSrc = finalR;
		}
		if (finalG > 255) {
			gSrc = 255;
		} else {
			gSrc = finalG;
		}
		if (finalB > 255) {
			bSrc = 255;
		} else {
			bSrc = finalB;
		}
	}

	if (!flags.blending) {
		setPixelAt(pixel, _pbufFormat.ARGBToColor(aSrc, rSrc, gSrc, bSrc));
	} else {
		byte rDst, gDst, bDst, aDst;
		_pbufFormat.colorToARGB(getPixelAt(pixel), aDst, rDst, gDst, bDst);
		switch (_sourceBlendingFactor) {
		case TGL_ZERO:
			rSrc = gSrc = bSrc = 0;
			break;
		case TGL_ONE:
			break;
		case TGL_DST_COLOR:
			rSrc = (rDst * rSrc) >> 8;
			gSrc = (gDst * gSrc) >> 8;
			bSrc = (bDst * bSrc) >> 8;
			break;
		case TGL_ONE_MINUS_DST_COLOR:
			rSrc = (rSrc * (255 - rDst)) >> 8;
			gSrc = (gSrc * (255 - gDst)) >> 8;
			bSrc = (bSrc * (255 - bDst)) >> 8;
			break;
		case TGL_SRC_ALPHA:
			rSrc = (rSrc * aSrc) >> 8;
			gSrc = (gSrc * aSrc) >> 8;
			bSrc = (bSrc * aSrc) >> 8;
			break;
		case TGL_ONE_MINUS_SRC_ALPHA:
			rSrc = (rSrc * (255 - aSrc)) >> 8;
			gSrc = (gSrc * (255 - aSrc)) >> 8;
			bSrc = (bSrc * (255 - aSrc)) >> 8;
			break;
		case TGL_DST_ALPHA:
			rSrc = (rSrc * aDst) >> 8;
			gSrc = (gSrc * aDst) >> 8;
			bSrc = (bSrc * aDst) >> 8;
			break;
		case TGL_ONE_MINUS_DST_ALPHA:
			rSrc = (rSrc * (255 - aDst)) >> 8;
			gSrc = (gSrc * (255 - aDst)) >> 8;
			bSrc = (bSrc * (255 - aDst)) >> 8;
			break;
		default:
			break;
		}

		switch (_destinationBlendingFactor) {
		case TGL_ZERO:
			rDst = gDst = bDst = 0;
			break;
		case TGL_ONE:
			break;
		case TGL_DST_COLOR:
			rDst = (rDst * rSrc) >> 8;
			gDst = (gDst * gSrc) >> 8;
			bDst = (bDst * bSrc) >> 8;
			break;
		case TGL_ONE_MINUS_DST_COLOR:
			rDst = (rDst * (255 - rSrc)) >> 8;
			gDst = (gDst * (255 - gSrc)) >> 8;
			bDst = (bDst * (255 - bSrc)) >> 8;
			break;
		case TGL_SRC_ALPHA:
			rDst = (rDst * aSrc) >> 8;
			gDst = (gDst * aSrc) >> 8;
			bDst = (bDst * aSrc) >> 8;
			break;
		case TGL_ONE_MINUS_SRC_ALPHA:
			rDst = (rDst * (255 - aSrc)) >> 8;
			gDst = (gDst * (255 - aSrc)) >> 8;
			bDst = (bDst * (255 - aSrc)) >> 8;
			break;
		case TGL_DST_ALPHA:
			rDst = (rDst * aDst) >> 8;
			gDst = (gDst * aDst) >> 8;
			bDst = (bDst * aDst) >> 8;
			break;
		case TGL_ONE_MINUS_DST_ALPHA:
			rDst = (rDst * (255 - aDst)) >> 8;
			gDst = (gDst * (255 - aDst)) >> 8;
			bDst = (bDst * (255 - aDst)) >> 8;
			break;
		case TGL_SRC_ALPHA_SATURATE: {
			int factor = aSrc < 1 - aDst ? aSrc : 1 - aDst;
			rDst = (rDst * factor) >> 8;
			gDst = (gDst * factor) >> 8;
			bDst = (bDst * factor) >> 8;
			}
			break;
		default:
			break;
		}
		int finalR = rDst + rSrc;
		int finalG = gDst + gSrc;
		int finalB = bDst + bSrc;
		if (finalR > 255) {
			finalR = 255;
		}
		if (finalG > 255) {
			finalG = 255;
		}
		if (finalB > 255) {
			finalB = 255;
		}
		setPixelAt(pixel, _pbufFormat.RGBToColor(finalR, finalG, finalB));
	}
}

template <bool kInterpRGB, bool kInterpZ, bool kDepthWrite>
void FrameBuffer::drawLine(const ZBufferPoint *p1, const ZBufferPoint *p2) {
	if (_clippingEnabled)
		drawLine<kInterpRGB, kInterpZ, kDepthWrite, true>(p1, p2);
	else
		drawLine<kInterpRGB, kInterpZ, kDepthWrite, false>(p1, p2);
}

template <bool kInterpRGB, bool kInterpZ, bool kDepthWrite, bool kEnableScissor>
FORCEINLINE void FrameBuffer::drawLine(const ZBufferPoint *p1, const ZBufferPoint *p2) {
	RasterFlags flags;
	flags.interpRGB = kInterpRGB;
	flags.interpZ = kInterpZ;
	flags.depthWrite = kDepthWrite;
	flags.scissor = kEnableScissor;
	drawLine(p1, p2, flags);
}

void FrameBuffer::drawLine(const ZBufferPoint *p1, const ZBufferPoint *p2, const RasterFlags &flags) {
	// Based on Bresenham's line algorithm, as implemented in
	// https://rosettacode.org/wiki/Bitmap/Bresenham%27s_line_algorithm#C
	// with a loop exit condition based on the (unidimensional) taxicab
	// distance between p1 and p2 (which is cheap to compute and
	// rounding-error-free) so that interpolations are possible without
	// code duplication.

	// Where we are in unidimensional framebuffer coordinate
	unsigned int pixelOffset = p1->y * _pbufWidth + p1->x;
	// and in 2d
	int x = p1->x;
	int y = p1->y;

	// How to move on each axis, in both coordinates systems
	const int dx = abs(p2->x - p1->x);
	const int inc_x = p1->x < p2->x ? 1 : -1;
	const int dy = abs(p2->y - p1->y);
	const int inc_y = p1->y < p2->y ? 1 : -1;
	const int inc_y_pixel = p1->y < p2->y ? _pbufWidth : -_pbufWidth;

	// When to move on each axis
	int err = (dx > dy ? dx : -dy) / 2;
	int e2;

	// How many moves
	int n = dx > dy ? dx : dy;

	// kInterpZ
	unsigned int z = 0;
	int sz = 0;

	// kInterpRGB
	int r = p1->r >> (ZB_POINT_RED_BITS - 8);
	int g = p1->g >> (ZB_POINT_GREEN_BITS - 8);
	int b = p1->b >> (ZB_POINT_BLUE_BITS - 8);
	int color = RGB_TO_PIXEL(r, g, b);
	int sr = 0, sg = 0, sb = 0;

	if (flags.interpZ) {
		if (n == 0)
			return;
		sz = (p2->z - p1->z) / n;
		z = p1->z;
	}
	if (flags.interpRGB) {
		sr = ((p2->r - p1->r) / n) >> (ZB_POINT_RED_BITS - 8);
		sg = ((p2->g - p1->g) / n) >> (ZB_POINT_GREEN_BITS - 8);
		sb = ((p2->b - p1->b) / n) >> (ZB_POINT_BLUE_BITS - 8);
	}
	while (n--) {
		if (flags.interpZ)
			putPixel(pixelOffset, color, x, y, z, flags.depthWrite, flags.scissor);
		else
			putPixel(pixelOffset, color, x, y, flags.scissor);
		e2 = err;
		if (e2 > -dx) {
			err -= dy;
			pixelOffset += inc_x;
			x += inc_x;
		}
		if (e2 < dy) {
			err += dx;
			pixelOffset += inc_y_pixel;
			y += inc_y;
		}
		if (flags.interpZ)
			z += sz;
		if (flags.interpRGB) {
			r += sr;
			g += sg;
			b += sb;
			color = RGB_TO_PIXEL(r, g, b);
		}
	}
}

void FrameBuffer::plot(ZBufferPoint *p) {
	const uint pixelOffset = p->y * _pbufWidth + p->x;
	const int col = RGB_TO_PIXEL(p->r, p->g, p->b);
	const uint z = p->z;
	if (_depthWrite && _depthTestEnabled)
		putPixel(pixelOffset, col, p->x, p->y, z, true);
	else
		putPixel(pixelOffset, col, p->x, p->y, z, false);
}

void FrameBuffer::fillLineFlatZ(ZBufferPoint *p1, ZBufferPoint *p2) {
	if (_depthWrite && _depthTestEnabled)
		drawLine<false, true, true>(p1, p2);
	else
		drawLine<false, true, false>(p1, p2);
}

// line with color interpolation
void FrameBuffer::fillLineInterpZ(ZBufferPoint *p1, ZBufferPoint *p2) {
	if (_depthWrite && _depthTestEnabled)
		drawLine<true, true, true>(p1, p2);
	else
		drawLine<true, true, false>(p1, p2);
}

// no Z interpolation
void FrameBuffer::fillLineFlat(ZBufferPoint *p1, ZBufferPoint *p2) {
	if (_depthWrite && _depthTestEnabled)
		drawLine<false, false, true>(p1, p2);
	else
		drawLine<false, false, false>(p1, p2);
}

void FrameBuffer::fillLineInterp(ZBufferPoint *p1, ZBufferPoint *p2) {
	if (_depthWrite && _depthTestEnabled)
		drawLine<false, true, true>(p1, p2);
	else
		drawLine<false, true, false>(p1, p2);
}

void FrameBuffer::fillLineZ(ZBufferPoint *p1, ZBufferPoint *p2) {
	// choose if the line should have its color interpolated or not
	if (p1->r == p2->r && p1->g == p2->g && p1->b == p2->b)
		fillLineFlatZ(p1, p2);
	else
		fillLineInterpZ(p1, p2);
}

void FrameBuffer::fillLine(ZBufferPoint *p1, ZBufferPoint *p2) {
	// choose if the line should have its color interpolated or not
	if (p1->r == p2->r && p1->g == p2->g && p1->b == p2->b)
		fillLineFlat(p1, p2);
	else
		fillLineInterp(p1, p2);
}

} // end of namespace TinyGL
