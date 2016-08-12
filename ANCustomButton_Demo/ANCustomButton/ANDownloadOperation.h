//
//  DownloadOperation.h
//  多线程_day04_模拟SDWebImage
//
//  Created by AudiebantNil on 6/7/16.
//  Copyright © 2016 AudiebantNil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FinishedBlock)(UIImage *);

@interface ANDownloadOperation : NSOperation

@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, copy) FinishedBlock finishiedBlock;

+ (instancetype)downloadImageWithURLString:(NSString *)URLString andFinishedBlock:(FinishedBlock)finishedBlock;

@end
