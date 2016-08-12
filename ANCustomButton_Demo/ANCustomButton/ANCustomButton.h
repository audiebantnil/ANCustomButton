//
//  ANCustomButton.h
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PLACE_HOLDER @"place_holder"    // 网络图片占位图名称
#define TEXT_COLOR [UIColor grayColor]  // 文字颜色

typedef enum {
    ANButtonTypeImageTopTitleBottom,    // 图片在上 文字在下
    ANButtonTypeTitleTopImageBottom,    // 文字在上 图片在下
    ANButtonTypeImageLeftTitleRight,    // 图片在左 文字在右
    ANButtonTypeTitleLeftImageRight,    // 文字在左 图片在右
}ANButtonType;


@interface ANCustomButton : UIButton

/**
*  加载网络图片的Button
*
*  @param type           按钮图片文字排版类型
*  @param imageString    按钮图片地址(本地为图片名, 网络为url字符串)
*  @param title          按钮文字内容
*  @param fontSize       文字字号, 可传0, 默认为12
*
*  @return 对应类型的Button
*/
+ (instancetype)buttonWithType:(ANButtonType)type andImageString:(NSString *)imageString andTitle:(NSString *)title andFontSize:(CGFloat)fontSize;

/**
 *  文字高度, 默认上下排版为17, 左右排版为30
 */
@property (nonatomic, assign) CGFloat labelHeight;

/**
 *  图片与文字间距, 默认为3
 */
@property (nonatomic, assign) CGFloat margin;

@end
