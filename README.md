# MLPhotoBrowser
A simple iOS Photo browser Library, Support optional animation.

![image](https://github.com/MakeZL/MLPhotoBrowser/blob/master/screenhost.gif)

### CocoaPod
    pod search 'MLPhotoBrowser'
    
### Use 
###### import "MLPhotoBrowserViewController.h"
	// 图片游览器
    MLPhotoBrowserViewController *photoBrowser = [[MLPhotoBrowserViewController alloc] init];
    // 缩放动画
    photoBrowser.status = UIViewAnimationAnimationStatusZoom;
    // 可以删除
    photoBrowser.editing = YES;
    // 数据源/delegate
    photoBrowser.delegate = self;
    photoBrowser.dataSource = self;
    // 当前选中的值
    photoBrowser.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.row inSection:0];
    // 展示控制器
    [self.navigationController presentViewController:photoBrowser animated:NO completion:nil];

###### MLPhotoBrowserViewControllerDataSource
	@optional
	/**
	 *  有多少组
	 */
	- (NSInteger) numberOfSectionInPhotosInPhotoBrowser:(MLPhotoBrowserViewController *)photoBrowser;

	@required
	/**
	 *  每个组多少个图片
	 */
	- (NSInteger) photoBrowser:(MLPhotoBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section;
	/**
	 *  每个对应的IndexPath展示什么内容
 	 */
 	- (MLPhotoBrowserPhoto *)photoBrowser:	(MLPhotoBrowserViewController *)photoBrowser photoAtIndexPath:	(NSIndexPath *)indexPath;

###### MLPhotoBrowserViewControllerDelegate
	@optional
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

	/**
	 *  点击每个Item时候调用
	 */
	- (void)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser photoDidSelectView:(UIView *)scrollBoxView atIndexPath:(NSIndexPath *)indexPath;

	/**
	 *  返回用户自定义的toolBarView(类似tableView FooterView)
	 *
	 *  @return 返回用户自定义的toolBarView
	 */
	- (MLPhotoBrowserCustomToolBarView *)photoBrowserShowToolBarViewWithphotoBrowser:(MLPhotoBrowserViewController *)photoBrowser;

# Contact
@weibo : [我的微博](http://weibo.com/makezl/)

# License

MLSelectPhoto is published under MIT License

    Copyright (c) 2015 MakeZL (@MakeZL)
    
    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to use,
    copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
    Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.