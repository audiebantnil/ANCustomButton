//
//  DownloadOperation.m
//  多线程_day04_模拟SDWebImage
//
//  Created by AudiebantNil on 6/7/16.
//  Copyright © 2016 AudiebantNil. All rights reserved.
//

#import "ANDownloadOperation.h"

@implementation ANDownloadOperation

+ (instancetype)downloadImageWithURLString:(NSString *)URLString andFinishedBlock:(FinishedBlock)finishedBlock {
    ANDownloadOperation *op = [[ANDownloadOperation alloc] init];
    op.URLString = URLString;
    op.finishiedBlock = finishedBlock;
    return op;
}

- (void)main {
    NSURL *url = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    //存储沙盒
    if (image) {
        [data writeToFile:[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self.URLString lastPathComponent]] atomically:YES];
    }
    //判断取消
    if (self.isCancelled) {
        return;
    }
    //主线程更新UI
    if (self.finishiedBlock) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.finishiedBlock(image);
        }];
    }
}

@end
