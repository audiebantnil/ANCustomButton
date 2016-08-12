//
//  UIView+ANFrame.h
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ANFrame)

/**
 *  frame.origin.x
 */
@property (nonatomic, assign) CGFloat x;

/**
 *  frame.origin.y
 */
@property (nonatomic, assign) CGFloat y;

/**
 *  frame.size.width
 */
@property (nonatomic, assign) CGFloat width;

/**
 *  frame.size.height
 */
@property (nonatomic, assign) CGFloat height;

/**
 *  center.x
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 *  center.y
 */
@property (nonatomic, assign) CGFloat centerY;

@end
