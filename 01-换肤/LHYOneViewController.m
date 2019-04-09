//
//  LHYOneViewController.m
//  01-换肤
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 1. All rights reserved.
//

#import "LHYOneViewController.h"
#import "LHYSkinTool.h"
@interface LHYOneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *rect;

@end

@implementation LHYOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置样式
    
    //问题:  1.代码重复   2.降低耦合性 不要产生控制器之间的依赖
    
    //解决: 抽取 工具类(实现特定的功能)
    // 原则: 拿用户(使用你的工具类的同行)当sb  需求驱动开发;
    
    
//    NSString *strSkin = [[NSUserDefaults standardUserDefaults]objectForKey:@"skin"];
//    
//    NSString *str = [NSString stringWithFormat:@"skin/%@/rect.png",strSkin];
    
    self.rect.image = [LHYSkinTool getImageWithName:@"rect"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
