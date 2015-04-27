//
//  ZLPhotoPickerBrowserViewController.h
//  ZLAssetsPickerDemo
//
//  Created by 张磊 on 14-11-14.
//  Copyright (c) 2014年 com.zixue101.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLPhotoBrowserPhoto.h"
#import "MLPhotoBrowserCustomToolBarView.h"

@class MLPhotoBrowserViewController;
@protocol ZLPhotoPickerBrowserViewControllerDataSource <NSObject>

@optional
/**
 *  有多少组
 */
- (NSInteger) numberOfSectionInPhotosInPickerBrowser:(MLPhotoBrowserViewController *) pickerBrowser;

@required
/**
 *  每个组多少个图片
 */
- (NSInteger) photoBrowser:(MLPhotoBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section;
/**
 *  每个对应的IndexPath展示什么内容
 */
- (MLPhotoBrowserPhoto *)photoBrowser:(MLPhotoBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath;


@end

@protocol ZLPhotoPickerBrowserViewControllerDelegate <NSObject>
@optional

/**
 *  点击每个Item时候调用
 */
- (void)photoBrowser:(MLPhotoBrowserViewController *)pickerBrowser photoDidSelectView:(UIView *)scrollBoxView atIndexPath:(NSIndexPath *)indexPath;

/**
 *  返回用户自定义的toolBarView(类似tableView FooterView)
 *
 *  @return 返回用户自定义的toolBarView
 */
- (MLPhotoBrowserCustomToolBarView *)photoBrowserShowToolBarViewWithphotoBrowser:(MLPhotoBrowserViewController *)photoBrowser;
/**
 *  准备删除那个图片
 *
 *  @param index        要删除的索引值
 */
- (BOOL)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser willRemovePhotoAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  删除indexPath对应索引的图片
 *
 *  @param indexPath        要删除的索引值
 */
- (void)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser removePhotoAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  滑动结束的页数
 *
 *  @param page         滑动的页数
 */
- (void)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser didCurrentPage:(NSUInteger)page;
/**
 *  滑动开始的页数
 *
 *  @param page         滑动的页数
 */
- (void)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser willCurrentPage:(NSUInteger)page;

@end

@interface MLPhotoBrowserViewController : UIViewController

// @require
// 数据源/代理
@property (nonatomic , weak) id<ZLPhotoPickerBrowserViewControllerDataSource> dataSource;
@property (nonatomic , weak) id<ZLPhotoPickerBrowserViewControllerDelegate> delegate;
// 点击的View
//@property (nonatomic , strong) UIView *toView;
// 当前提供的组
@property (strong,nonatomic) NSIndexPath *currentIndexPath;

// @optional
// 是否可以编辑（删除照片）
@property (nonatomic , assign,getter=isEditing) BOOL editing;
// 动画status (放大缩小/淡入淡出/旋转)
//@property (assign,nonatomic) UIViewAnimationAnimationStatus status;
// 长按保存图片会调用sheet
@property (strong,nonatomic) UIActionSheet *sheet;

// 导航高度
@property (assign,nonatomic) CGFloat navigationHeight;
// @function
// 展示控制器
- (void)show;
// 刷新数据
- (void)reloadData;
@end
