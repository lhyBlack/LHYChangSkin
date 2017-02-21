//
//  helloviewController.m
//  01-换肤
//
//  Created by apple on 15/12/3.
//  Copyright © 2015年 1. All rights reserved.
//

#import "helloviewController.h"
#import "LHYSkinTool.h"
@interface helloviewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heart;

@end

@implementation helloviewController

- (void)viewDidLoad { //一次
    [super viewDidLoad];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    //控制器  没有被销毁
    self.heart.image = [LHYSkinTool getImageWithName:@"heart"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
