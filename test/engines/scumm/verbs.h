#include <cxxtest/TestSuite.h>
#include "engines/scumm/verbs.h"

/**
 * Test suite for the functions in engines/scumm/verbs.h
 */

class ScummVerbsSuite : public CxxTest::TestSuite {

	public:
	ScummVerbsSuite () {
	}

	void test_index_of() {
		Scumm::VerbSlot s;
		s.verbid = 1;
		TS_ASSERT_EQUALS(s.verbid, 1);
	}
};
