//
//  CZSkinTool.h
//  01-换肤
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LHYSkinTool : NSObject

//获取用当前样式 创建的图片
+(UIImage *)getImageWithName:(NSString *)imageName;

//保存  
+ (void)saveSkinWith:(NSString *)skinStr;

//获取当前最新的样式
+ (NSString *)getSkin;

+ (UIColor *)getColorWith:(NSString *)str;
@end
