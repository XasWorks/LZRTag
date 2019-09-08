/*
 * BasePattern.h
 *
 *  Created on: 5 Sep 2019
 *      Author: xasin
 */

#ifndef MAIN_FX_PATTERNS_BASEPATTERN_H_
#define MAIN_FX_PATTERNS_BASEPATTERN_H_

#include "Color.h"

namespace LZR {
namespace FX {

class BasePattern {
public:
	BasePattern();
	virtual ~BasePattern();

	virtual void tick();
	virtual void apply_color_at(Peripheral::Color &tgt, float pos);
};

} /* namespace FX */
} /* namespace LZR */

#endif /* MAIN_FX_PATTERNS_BASEPATTERN_H_ */