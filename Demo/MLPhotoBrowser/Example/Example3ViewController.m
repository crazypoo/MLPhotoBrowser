//
//  @Author : MakeZL
//  @Desc   : 查看头像
//
//  MLPhotoBrowser
//
//  Created by 张磊 on 15/4/27.
//  Copyright (c) 2015年 www.weibo.com/makezl. All rights reserved.
//

#import "Example3ViewController.h"
#import "MLPhotoBrowserSignleViewController.h"
#import "UIImage+MLBrowserPhotoImageForBundle.h"

@interface Example3ViewController ()

@end

@implementation Example3ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *headerView = [[UIButton alloc] init];
    headerView.frame = CGRectMake(100, 100, 50, 50);
    [headerView setImage:[UIImage ml_imageFromBundleNamed:@"header.jpeg"] forState:UIControlStateNormal];
    [headerView addTarget:self action:@selector(showHeadPortrait:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headerView];
}

#pragma mark 传入imageView放大
- (void)showHeadPortrait:(UIButton *)btn{
    MLPhotoBrowserSignleViewController *browserVc = [[MLPhotoBrowserSignleViewController alloc] init];
    [browserVc showHeadPortrait:btn.imageView originUrl:@"https://avatars0.githubusercontent.com/u/7121927?v=3&s=460"];
}

@end
