//
//  @Author : MakeZL
//  @Desc   : 例子2
//
//  MLPhotoBrowser
//
//  Created by 张磊 on 15/4/27.
//  Copyright (c) 2015年 www.weibo.com/makezl. All rights reserved.
//

#import "Example2ViewController.h"
#import "MLPhotoBrowserAssets.h"
#import "MLPhotoBrowserViewController.h"
#import <UIButton+WebCache.h>

@interface Example2ViewController () <MLPhotoBrowserViewControllerDataSource,MLPhotoBrowserViewControllerDelegate>

@property (weak,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) NSMutableArray *photos;
@end

@implementation Example2ViewController
- (NSMutableArray *)photos{
    if (!_photos) {
        _photos = [NSMutableArray arrayWithArray:@[
                                                   @"http://imgsrc.baidu.com/forum/pic/item/3f7dacaf2edda3cc7d2289ab01e93901233f92c5.jpg",
                                                   @"http://123.57.17.222:8000/school/web/upload/20150316093117407_6246_9.jpg",
                                                   @"http://imgsrc.baidu.com/forum/pic/item/3f7dacaf2edda3cc7d2289ab01e93901233f92c5.jpg",
                                                   @"http://123.57.17.222:8000/school/web/upload/20150316093117407_6246_9.jpg"
                                                   ]];
    }
    return _photos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:scrollView];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView = scrollView;
    
    // 属性scrollView
    [self reloadScrollView];
}

- (void)reloadScrollView{
    // 先移除，后添加
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSUInteger column = 3;
    // 加一是为了有个添加button
    NSUInteger assetCount = self.photos.count;
    
    CGFloat width = self.view.frame.size.width / column;
    for (NSInteger i = 0; i < assetCount; i++) {
        
        NSInteger row = i / column;
        NSInteger col = i % column;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btn.frame = CGRectMake(width * col, row * width, width, width);
        
        // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
        if ([[self.photos objectAtIndex:i] isKindOfClass:[MLPhotoBrowserAssets class]]) {
            [btn setImage:[self.photos[i] thumbImage] forState:UIControlStateNormal];
        }else{
            [btn sd_setImageWithURL:[NSURL URLWithString:self.photos[i % (self.photos.count)]] forState:UIControlStateNormal];
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(tapBrowser:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY([[self.scrollView.subviews lastObject] frame]));
}


- (void)tapBrowser:(UIButton *)btn{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    // 图片游览器
    MLPhotoBrowserViewController *photoBrowser = [[MLPhotoBrowserViewController alloc] init];
    // 淡入淡出效果
    photoBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
    photoBrowser.delegate = self;
    photoBrowser.dataSource = self;
    // 当前选中的值
    photoBrowser.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    // 展示控制器
    [self.navigationController presentViewController:photoBrowser animated:NO completion:nil];
    //    [pickerBrowser show];
}


#pragma mark - <MLPhotoBrowserViewControllerDataSource>
- (NSInteger)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section{
    return self.photos.count;
}

#pragma mark - 每个组展示什么图片,需要包装下MLPhotoBrowserPhoto
- (MLPhotoBrowserPhoto *) photoBrowser:(MLPhotoBrowserViewController *)browser photoAtIndexPath:(NSIndexPath *)indexPath{
    // 包装下imageObj 成 ZLPhotoPickerBrowserPhoto 传给数据源
    MLPhotoBrowserPhoto *photo = [[MLPhotoBrowserPhoto alloc] init];
    photo.photoObj = [self.photos objectAtIndex:indexPath.row];
    // 缩略图
    UIButton *btn = self.scrollView.subviews[indexPath.row];
    photo.toView = btn.imageView;
    photo.thumbImage = btn.imageView.image;
    return photo;
}
@end

