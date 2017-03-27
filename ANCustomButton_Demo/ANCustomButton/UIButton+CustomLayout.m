//
//  UIButton+CustomLayout.m
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 2017/3/16.
//  Copyright © 2017年 AudiebantNil. All rights reserved.
//

#import "UIButton+CustomLayout.h"
#import <objc/runtime.h>

@implementation UIButton (CustomLayout)

+ (__kindof UIButton *)buttonWithType:(ANButtonType)type margin:(CGFloat)margin titleFont:(UIFont *)font normalTitle:(NSString *)normalTitle normalImage:(UIImage *)normalImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    switch (type) {
        case ANButtonTypeImageTopTitleBottom:
            [button layoutImageTopTitleBottomWithMargin:margin];
            break;
        case ANButtonTypeTitleTopImageBottom:
            [button layoutTitleTopImageBottomWithMargin:margin];
            break;
        case ANButtonTypeImageLeftTitleRight:
            [button layoutImageLeftTitleRightWithMargin:margin];
            break;
        case ANButtonTypeTitleLeftImageRight:
            [button layoutTitleLeftImageRightWithMargin:margin];
            break;
        default:
            break;
    }
    return button;
}


#pragma mark - Custom Layout
- (void)layoutImageTopTitleBottomWithMargin:(CGFloat)margin {
    // 获取文字宽高
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.text = self.titleLabel.text;
    tempLabel.font = self.titleLabel.font;
    [tempLabel sizeToFit];
    CGSize titleSize    = tempLabel.bounds.size;
    // 获取图片宽高
    CGSize imageSize    = self.imageView.image.size;
    // 获取坐标
    CGFloat x           = fabs(imageSize.width - titleSize.width) / 2;
    CGFloat titleY      = imageSize.height + margin;
    // 开始计算frame
    CGRect buttonFrame = self.frame;
    if (imageSize.width > titleSize.width) {
        self.imageRect = CGRectMake(0, 0, imageSize.width, imageSize.height);
        self.titleRect = CGRectMake(x, titleY, titleSize.width, titleSize.height);
        buttonFrame.size = CGSizeMake(imageSize.width, titleY+titleSize.height);
    } else {
        self.imageRect = CGRectMake(x, 0, imageSize.width, imageSize.height);
        self.titleRect = CGRectMake(0, titleY, titleSize.width, titleSize.height);
        buttonFrame.size = CGSizeMake(titleSize.width, titleY+titleSize.height);
    }
    self.frame = buttonFrame;
}

- (void)layoutTitleTopImageBottomWithMargin:(CGFloat)margin {
    // 获取文字宽高
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.text = self.titleLabel.text;
    tempLabel.font = self.titleLabel.font;
    [tempLabel sizeToFit];
    CGSize titleSize    = tempLabel.bounds.size;
    // 获取图片宽高
    CGSize imageSize    = self.imageView.image.size;
    // 获取坐标
    CGFloat x           = fabs(imageSize.width - titleSize.width) / 2;
    CGFloat imageY      = tempLabel.bounds.size.height + margin;
    // 开始计算frame
    CGRect buttonFrame = self.frame;
    if (imageSize.width > titleSize.width) {
        self.titleRect = CGRectMake(x, 0, titleSize.width, titleSize.height);
        self.imageRect = CGRectMake(0, imageY, imageSize.width, imageSize.height);
        buttonFrame.size = CGSizeMake(imageSize.width, imageY+imageSize.height);
    } else {
        self.titleRect = CGRectMake(0, 0, titleSize.width, titleSize.height);
        self.imageRect = CGRectMake(x, imageY, imageSize.width, imageSize.height);
        buttonFrame.size = CGSizeMake(titleSize.width, imageY+imageSize.height);
    }
    self.frame = buttonFrame;
}

- (void)layoutImageLeftTitleRightWithMargin:(CGFloat)margin {
    // 获取文字宽高
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.text = self.titleLabel.text;
    tempLabel.font = self.titleLabel.font;
    [tempLabel sizeToFit];
    CGSize titleSize    = tempLabel.bounds.size;
    // 获取图片宽高
    CGSize imageSize    = self.imageView.image.size;
    // 获取坐标
    CGFloat y           = fabs(imageSize.height - titleSize.height) / 2;
    CGFloat titleX      = imageSize.width + margin;
    // 开始计算frame
    CGRect buttonFrame = self.frame;
    if (imageSize.height > titleSize.height) {
        self.imageRect = CGRectMake(0, 0, imageSize.width, imageSize.height);
        self.titleRect = CGRectMake(titleX, y, titleSize.width, titleSize.height);
        buttonFrame.size = CGSizeMake(titleX+titleSize.width, imageSize.height);
    } else {
        self.imageRect = CGRectMake(0, y, imageSize.width, imageSize.height);
        self.titleRect = CGRectMake(titleX, 0, titleSize.width, titleSize.height);
        buttonFrame.size = CGSizeMake(titleX+titleSize.width, titleSize.height);
    }
    self.frame = buttonFrame;
}

- (void)layoutTitleLeftImageRightWithMargin:(CGFloat)margin {
    // 获取文字宽高
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.text = self.titleLabel.text;
    tempLabel.font = self.titleLabel.font;
    [tempLabel sizeToFit];
    CGSize titleSize    = tempLabel.bounds.size;
    // 获取图片宽高
    CGSize imageSize    = self.imageView.image.size;
    // 获取坐标
    CGFloat y           = fabs(imageSize.height - titleSize.height) / 2;
    CGFloat imageX      = titleSize.width + margin;
    // 开始计算frame
    CGRect buttonFrame = self.frame;
    if (imageSize.height > titleSize.height) {
        self.titleRect = CGRectMake(0, y, titleSize.width, titleSize.height);
        self.imageRect = CGRectMake(imageX, 0, imageSize.width, imageSize.height);
        buttonFrame.size = CGSizeMake(imageX+imageSize.width, imageSize.height);
    } else {
        self.titleRect = CGRectMake(0, 0, titleSize.width, titleSize.height);
        self.imageRect = CGRectMake(imageX, y, imageSize.width, imageSize.height);
        buttonFrame.size = CGSizeMake(imageX+imageSize.width, titleSize.height);
    }
    self.frame = buttonFrame;
}


#pragma mark - Setters And Getters
// pointKey
static int an_buttonOriginKey;

- (CGPoint)buttonFrameOrigin {
    return [objc_getAssociatedObject(self, &an_buttonOriginKey) CGPointValue];
}

- (void)setButtonFrameOrigin:(CGPoint)origin {
    objc_setAssociatedObject(self, &an_buttonOriginKey, [NSValue valueWithCGPoint:origin], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

// titleRect
static int an_titleRectKey;

- (CGRect)titleRect {
    return [objc_getAssociatedObject(self, &an_titleRectKey) CGRectValue];
}

- (void)setTitleRect:(CGRect)rect {
    objc_setAssociatedObject(self, &an_titleRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// imageRect
static int an_imageRectKey;

- (CGRect)imageRect {
    return [objc_getAssociatedObject(self, &an_imageRectKey) CGRectValue];
}

- (void)setImageRect:(CGRect)rect {
    objc_setAssociatedObject(self, &an_imageRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - Private Methods
+ (void)load {
    MethodSwizzle(self,@selector(titleRectForContentRect:),@selector(override_titleRectForContentRect:));
    MethodSwizzle(self,@selector(imageRectForContentRect:),@selector(override_imageRectForContentRect:));
}

void MethodSwizzle(Class c, SEL originalSEL, SEL overrideSEL) {
    Method originalMethod = class_getInstanceMethod(c, originalSEL);
    Method overrideMethod= class_getInstanceMethod(c, overrideSEL);
    // 添加方法
    if(class_addMethod(c, originalSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        // 添加成功，替换实现
        class_replaceMethod(c,overrideSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        // 添加失败(已存在), 交换实现
        method_exchangeImplementations(originalMethod, overrideMethod);
    }
}

- (CGRect)override_titleRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [self override_titleRectForContentRect:contentRect];
}

- (CGRect)override_imageRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [self override_imageRectForContentRect:contentRect];
}


@end
