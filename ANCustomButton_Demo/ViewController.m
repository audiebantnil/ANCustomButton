//
//  ViewController.m
//  ANCustomButton_Demo
//
//  Created by AudiebantNil on 16/8/12.
//  Copyright © 2016年 AudiebantNil. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+CustomLayout.h"

#define IMAGE_URL_STR @"https://avatars3.githubusercontent.com/u/16851074?v=3&s=40"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:ANButtonTypeImageTopTitleBottom
                                          margin:10
                                       titleFont:[UIFont systemFontOfSize:16.0]
                                     normalTitle:@"title111111"
                                     normalImage:[UIImage imageNamed:@"best"]];
    [button1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button1 addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    button1.buttonFrameOrigin = CGPointMake(20, 40);
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:ANButtonTypeTitleTopImageBottom
                                          margin:5
                                       titleFont:[UIFont systemFontOfSize:14.0]
                                     normalTitle:@"t2"
                                     normalImage:[UIImage imageNamed:@"best"]];
    button2.buttonFrameOrigin = CGPointMake(20, 120);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:ANButtonTypeImageLeftTitleRight
                                          margin:20
                                       titleFont:[UIFont systemFontOfSize:28.0]
                                     normalTitle:@"title33333333333"
                                     normalImage:[UIImage imageNamed:@"best"]];
    button3.buttonFrameOrigin = CGPointMake(20, 200);
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:ANButtonTypeTitleLeftImageRight
                                          margin:0
                                       titleFont:[UIFont systemFontOfSize:12.0]
                                     normalTitle:@"t4"
                                     normalImage:[UIImage imageNamed:@"best"]];
    button4.buttonFrameOrigin = CGPointMake(20, 280);
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:ANButtonTypeCustomRect
                                          margin:0
                                       titleFont:[UIFont systemFontOfSize:20.0]
                                     normalTitle:@"custom"
                                     normalImage:[UIImage imageNamed:@"best"]];
    [button5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button5.imageRect = CGRectMake(0, 0, 100, 60);
    button5.titleRect = CGRectMake(18, 40, 82, 20);
    button5.frame = CGRectMake(150, 40, 100, 60);
    [self.view addSubview:button5];
    NSLog(@"\nimageRect - %@\ntitleRect - %@", [NSValue valueWithCGRect:button5.imageRect], [NSValue valueWithCGRect:button5.titleRect]);

}

#pragma mark - 按钮点击事件示例
- (void)didClickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
}


@end
