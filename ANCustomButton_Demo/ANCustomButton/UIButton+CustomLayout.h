//
//  UIButton+CustomLayout.h
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 2017/3/16.
//  Copyright © 2017年 AudiebantNil. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ANButtonTypeCustomRect,                 // 无排版,后续自定义 imageRect 和 titleRect
    ANButtonTypeImageTopTitleBottom,        // 图片在上 文字在下
    ANButtonTypeTitleTopImageBottom,        // 文字在上 图片在下
    ANButtonTypeImageLeftTitleRight,        // 图片在左 文字在右
    ANButtonTypeTitleLeftImageRight,        // 文字在左 图片在右
} ANButtonType;

@interface UIButton (CustomLayout)

/**
 自定义图片位置尺寸
 */
@property (nonatomic,assign) CGRect imageRect;

/**
 自定义文字位置尺寸
 */
@property (nonatomic,assign) CGRect titleRect;

/**
 自定义布局按钮的位置(大小内部自适应)
 */
@property (nonatomic, assign) CGPoint buttonFrameOrigin;

/**
 自定义图片文字布局的按钮设置
 @param type        ANButtonType
 @param margin      图片文字间距
 @param normalTitle normal状态下文字(默认字体颜色darkGray)
 @param normalImage normal状态下图片(网络图片请给出占位图)
 */
+ (__kindof UIButton *)buttonWithType:(ANButtonType)type margin:(CGFloat)margin titleFont:(UIFont *)font normalTitle:(NSString *)normalTitle normalImage:(UIImage *)normalImage;


@end
