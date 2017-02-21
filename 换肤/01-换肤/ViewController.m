//
//  ViewController.m
//  01-换肤
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 1. All rights reserved.
//

#import "ViewController.h"
#import "LHYSkinTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *face;
@property (weak, nonatomic) IBOutlet UIImageView *heart;
@property (weak, nonatomic) IBOutlet UIImageView *rect;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectColor;
- (IBAction)selectColorClick:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //素材和
    //颜色 背景  文字颜色
    //目标: 皮肤样式 更改了
    //改  view 背景色  +  label 背景 色 和 文字颜色
    
    
    
    //设置默认样式
    self.selectColor.selectedSegmentIndex = [self indexWithSkinStr:[LHYSkinTool getSkin]];
    [self setSkin];
    
}

//设置界面(保存和更新)
- (IBAction)selectColorClick:(UISegmentedControl *)sender {
    //点击事件
    // 设置界面(保存和更新)   普通界面 (被更新)
    //1.保存用户的选择
    NSString *skinStr = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    [LHYSkinTool saveSkinWith:skinStr];
    
    //2.更新当前的界面
    self.selectColor.selectedSegmentIndex = [self indexWithSkinStr:skinStr];
    [self setSkin];
    
}
//被更新
- (void)setSkin
{
    
    self.face.image = [LHYSkinTool getImageWithName:@"face"];
    
    self.heart.image =[LHYSkinTool getImageWithName:@"heart"];

    self.rect.image = [LHYSkinTool getImageWithName:@"rect"];
    
    //myView_bg         255,0,0
    //myLabel_textColor 255,255,0
    //myLabel_bg        255,0,255
    self.myView.backgroundColor = [LHYSkinTool getColorWith:@"myView_bg"];
    self.myLabel.textColor = [LHYSkinTool getColorWith:@"myLabel_textColor"];
    self.myLabel.backgroundColor = [LHYSkinTool getColorWith:@"myLabel_bg"];
}


- (NSInteger)indexWithSkinStr:(NSString *)str
{
    if ([str isEqualToString:@"blue"]) {
        return 0;
    }else if ([str isEqualToString:@"green"])
    {
        return 1;
    }if ([str isEqualToString:@"orange"])
    {
        return 2;
    }if ([str isEqualToString:@"red"])
    {
        return 3;
    }
    return 100;
}

@end
