//
//  UIView+ANFrame.m
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import "UIView+ANFrame.h"

@implementation UIView (ANFrame)

// ---------- x ----------
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x {
    return self.frame.origin.x;
}

// ---------- y ----------
- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)y {
    return self.frame.origin.y;
}

// ---------- width ----------
- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)width {
    return self.frame.size.width;
}

// ---------- height ----------
- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height {
    return self.frame.size.height;
}

// ---------- centerX ----------
- (void)setCenterX:(CGFloat)centerX {
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}
- (CGFloat)centerX {
    return self.center.x;
}

// ---------- centerY ----------
- (void)setCenterY:(CGFloat)centerY {
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}
- (CGFloat)centerY {
    return self.center.y;
}


@end
