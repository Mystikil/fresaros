#include <gtest/gtest.h>
#include "position.h"

TEST(PositionComparison, EqualityAndInequality) {
    Position a{10, 20, 5};
    Position b{10, 20, 5};
    EXPECT_TRUE(a == b);
    EXPECT_FALSE(a != b);
}

TEST(PositionComparison, LessThan) {
    Position a{10, 20, 5};
    Position b{11, 20, 5};
    EXPECT_TRUE(a < b);
    EXPECT_FALSE(b < a);
    EXPECT_FALSE(a < a);
}

TEST(PositionComparison, GreaterThan) {
    Position a{10, 20, 5};
    Position b{11, 20, 5};
    EXPECT_TRUE(b > a);
    EXPECT_FALSE(a > b);
    EXPECT_FALSE(a > a); // equal positions should not be greater
}

TEST(PositionComparison, NotEqual) {
    Position a{10, 20, 5};
    Position b{10, 20, 6};
    EXPECT_TRUE(a != b);
    EXPECT_FALSE(a == b);
}

