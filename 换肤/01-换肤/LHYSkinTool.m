//
//  CZSkinTool.m
//  01-换肤
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 1. All rights reserved.
//

#import "LHYSkinTool.h"
@interface LHYSkinTool ()
//属性是对象
//@property (nonatomic, copy) NSString *skin;
@end

static NSString *_skin;

@implementation LHYSkinTool

+ (void)initialize //初始化 只执行一次
{
    NSLog(@"initialize");
    NSString *strSkin = [[NSUserDefaults standardUserDefaults]objectForKey:@"skin"];
    if (strSkin == nil) { //只在 第一次启动 从来没有选择过情况下 起作用
        strSkin = @"blue";
    }
    _skin = strSkin;
    
    //self  在类型 相当于CZSkinTool
}
//+(void)load //当前类被加载
//{
//    
//}
+(void)saveSkinWith:(NSString *)skinStr
{
    //保存刀本地的偏好   保存到内存的变量
    _skin = skinStr;
    [[NSUserDefaults standardUserDefaults]setObject:skinStr forKey:@"skin"];
    //立即保存
    [[NSUserDefaults standardUserDefaults]synchronize];
}

+ (UIImage *)getImageWithName:(NSString *)imageName
{
    
    //取 存
    //是否 有保存过的  没有 设置默认;
    //取出之前保存
    NSString *str = [NSString stringWithFormat:@"skin/%@/%@",_skin,imageName];
    //生成一个对的图片

    return  [UIImage imageNamed:str];
}

+(NSString *)getSkin
{
//    NSString *strSkin = [[NSUserDefaults standardUserDefaults]objectForKey:@"skin"];
    return _skin;
}


+ (UIColor *)getColorWith:(NSString *)str
{
    //myView_bg         255,0,0 255,0,0
    //myLabel_textColor 255,255,0
    //myLabel_bg        255,0,255
    //乱码
    NSString *strName = [NSString stringWithFormat:@"skin/%@/color.plist",_skin];
    NSString *path = [[NSBundle mainBundle]pathForResource:strName ofType:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *strColor =  dict[str];
    //255,255,0
    NSArray *allColor = [strColor componentsSeparatedByString:@","];
    
    
    CGFloat r = [allColor[0] floatValue] / 255.0;
    CGFloat g = [allColor[1] floatValue] / 255.0;
    CGFloat b = [allColor[2] floatValue] / 255.0;
    
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    
}

@end
