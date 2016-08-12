//
//  ViewController.m
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import "ViewController.h"
#import "ANCustomButton.h"

#define IMAGE_URL_STR @"https://avatars3.githubusercontent.com/u/16851074?v=3&s=40"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<UIButton *> *buttonsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义按钮
    
    // 上下排版_本地图片_默认字号
    ANCustomButton *button1 = [ANCustomButton buttonWithType:ANButtonTypeImageTopTitleBottom andImageString:@"picture" andTitle:@"本地_上下" andFontSize:0];
    
    // 上下排版_网络图片_设置字号
    ANCustomButton *button2 = [ANCustomButton buttonWithType:ANButtonTypeTitleTopImageBottom andImageString:IMAGE_URL_STR andTitle:@"网络_上下" andFontSize:16];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    // 左右排版_网络图片_默认字号
    ANCustomButton *button3 = [ANCustomButton buttonWithType:ANButtonTypeImageLeftTitleRight andImageString:IMAGE_URL_STR andTitle:@"网络_左右" andFontSize:0];
    
    // 左右排版_本地图片_设置字号
    ANCustomButton *button4 = [ANCustomButton buttonWithType:ANButtonTypeTitleLeftImageRight andImageString:@"arrow_more_normal" andTitle:@"本地_左右" andFontSize:16];
    [button4 setImage:[UIImage imageNamed:@"arrow_more_selected"] forState:UIControlStateSelected];
    [button4 addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    button4.frame = CGRectMake(200, 50, 120, 60);
    
    // 添加子控件
    [self addSubButton:button1];
    [self addSubButton:button2];
    [self addSubButton:button3];
    [self addSubButton:button4];
    // 子控件布局
    [self setupButtonUI:self.buttonsArray];
}

#pragma mark - 按钮点击事件示例
- (void)didClickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark - setup test UI
- (void)addSubButton:(ANCustomButton *)button {;
    [self.buttonsArray addObject:button];
    [self.view addSubview:button];
}

- (void)setupButtonUI:(NSMutableArray <UIButton *>*)buttons {
    NSInteger count = buttons.count;
    for (int i = 0; i < count; i++) {
        if (i == count - 1) {
            buttons[i].translatesAutoresizingMaskIntoConstraints = YES;
            return;
        }
        buttons[i].translatesAutoresizingMaskIntoConstraints = NO;
        if (i == 0) {
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttons[i] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:50]];
        } else {
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttons[i] attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buttons[i-1] attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50]];
        }
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttons[i] attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:50]];
    }
}


#pragma mark - 懒加载
- (NSMutableArray<UIButton *> *)buttonsArray {
    if (_buttonsArray == nil) {
        _buttonsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttonsArray;
}

@end
