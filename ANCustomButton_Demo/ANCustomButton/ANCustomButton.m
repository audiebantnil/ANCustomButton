//
//  ANCustomButton.m
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import "ANCustomButton.h"
#import "UIView+ANFrame.h"
#import "ANDownloadOperation.h"


@interface ANCustomButton ()

@property (nonatomic, assign) ANButtonType type;    // 按钮排版类型
@property (nonatomic, assign) CGFloat fontSize;     // 按钮文字字号

@property (nonatomic, copy) NSString *currentString;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSMutableDictionary *imageCaches;
@property (nonatomic, strong) NSMutableDictionary *operationCaches;

@end


@implementation ANCustomButton

#pragma mark - 主方法
+ (instancetype)buttonWithType:(ANButtonType)type andImageString:(NSString *)imageString andTitle:(NSString *)title andFontSize:(CGFloat)fontSize {
    ANCustomButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.type = type;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
    if (fontSize) {
        button.fontSize = fontSize;
    }
    button.titleLabel.font = [UIFont systemFontOfSize:button.fontSize];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    if ([imageString hasPrefix:@"http://"]||[imageString hasPrefix:@"https://"]) {
        return [button setupButtonImageWithURLString:imageString];
    }
    [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    return button;
}


#pragma mark - 网络图片下载
// 主方法
- (instancetype)setupButtonImageWithURLString:(NSString *)imageURLString {
    [self setImage:[UIImage imageNamed:PLACE_HOLDER] forState:UIControlStateNormal];
    if (![imageURLString isEqualToString:self.currentString]) {
        [self canceledOperationWithURLString:self.currentString];
    }
    self.currentString = imageURLString;
    __weak typeof(self) weakself = self;
    [self downloadImageWithURLString:self.currentString andFinishedBlock:^(UIImage *image) {
        [weakself setImage:image forState:UIControlStateNormal];
    }];
    return self;
}

// 判断内存/沙盒中是否有缓存
- (BOOL)checkCachesWithURLString:(NSString *)URLString {
    if (self.imageCaches[URLString]) {
        return YES;
    }
    NSString *sandBoxPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[URLString lastPathComponent]];
    NSData *data = [NSData dataWithContentsOfFile:sandBoxPath];
    UIImage *image = [UIImage imageWithData:data];
    if (image) {
        self.imageCaches[URLString] = image;
        return YES;
    }
    return NO;
}

// 下载操作
- (void)downloadImageWithURLString:(NSString *)URLString andFinishedBlock:(void (^)(UIImage *))finishedBlock {
    //有缓存则从缓存读取图片
    if ([self checkCachesWithURLString:URLString]) {
        finishedBlock(self.imageCaches[URLString]);
        return;
    }
    //无缓存则下载图片
    ANDownloadOperation *op = [ANDownloadOperation downloadImageWithURLString:URLString andFinishedBlock:^(UIImage *image){
        self.imageCaches[URLString] = image;
        finishedBlock(image);
    }];
    [self.queue addOperation:op];
    self.operationCaches[URLString] = op;
}

// 取消操作
- (void)canceledOperationWithURLString:(NSString *)URLString {
    if (URLString) {
        [self.operationCaches[URLString] cancel];
        [self.operationCaches removeObjectForKey:URLString];
    }
}

#pragma mark - 子控件布局
- (void)layoutSubviews {
    [super layoutSubviews];
    switch (self.type) {
        case ANButtonTypeImageTopTitleBottom:
            [self layoutSubviewsWithImageTopTitleBottom];
            break;
        case ANButtonTypeTitleTopImageBottom:
            [self layoutSubviewsWithTitleTopImageBottom];
            break;
        case ANButtonTypeImageLeftTitleRight:
            [self layoutSubviewsWithImageLeftTitleRight];
            break;
        case ANButtonTypeTitleLeftImageRight:
            [self layoutSubviewsWithTitleLeftImageRight];
            break;
        default:
            break;
    }
}

// 图片在上 文字在下
- (void)layoutSubviewsWithImageTopTitleBottom {
    self.imageView.height = self.height - self.labelHeight - self.margin;
    self.imageView.width = MIN(self.imageView.height, self.width - 2 * self.margin);
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = 0;
    self.titleLabel.height = self.labelHeight;
    self.titleLabel.width = self.width;
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + self.margin;
}
// 文字在上 图片在下
- (void)layoutSubviewsWithTitleTopImageBottom {
    self.titleLabel.height = self.labelHeight;
    self.titleLabel.width = self.width;
    self.titleLabel.x = 0;
    self.titleLabel.y = 0;
    self.imageView.height = self.height - self.labelHeight - self.margin;
    self.imageView.width = MIN(self.imageView.height, self.width - 2 * self.margin);
    self.imageView.x = (self.width - self.imageView.width) / 2;
    self.imageView.y = self.labelHeight + self.margin;
}
// 图片在左 文字在右
- (void)layoutSubviewsWithImageLeftTitleRight {
    self.titleLabel.x = self.imageView.width + self.margin;
}
// 文字在左 图片在右
- (void)layoutSubviewsWithTitleLeftImageRight {
    self.titleLabel.x = 0;
    self.titleLabel.y = 0;
    self.titleLabel.height = self.height;
    self.imageView.x = self.titleLabel.width + self.margin;
    self.imageView.centerY = self.titleLabel.centerY;
}

#pragma mark - 重写getter方法
- (CGFloat)labelHeight {
    if (_labelHeight == 0) {
        switch (self.type) {
            case ANButtonTypeImageTopTitleBottom:
                _labelHeight = 17;
                break;
            case ANButtonTypeTitleTopImageBottom:
                _labelHeight = 17;
                break;
            case ANButtonTypeImageLeftTitleRight:
                _labelHeight = 30;
                break;
            case ANButtonTypeTitleLeftImageRight:
                _labelHeight = 30;
                break;
            default:
                break;
        }
    }
    return _labelHeight;
}
- (CGFloat)margin {
    if (_margin == 0) {
        _margin = 3;
    }
    return _margin;
}
- (CGFloat)fontSize {
    if (_fontSize == 0) {
        _fontSize = 12;
    }
    return _fontSize;
}

#pragma mark - 懒加载
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}
- (NSMutableDictionary *)imageCaches {
    if (!_imageCaches) {
        _imageCaches = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _imageCaches;
}
- (NSMutableDictionary *)operationCaches {
    if (!_operationCaches) {
        _operationCaches = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _operationCaches;
}

@end
