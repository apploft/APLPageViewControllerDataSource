//
//  APLPageViewControllerDataSource.h
//
//  Created by Tobias Conradi on 30.09.13.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//



@class APLPageViewControllerDataSource;

@protocol APLPageViewControllerDataSourceDelegate <NSObject>

@required

/**
 *  Return a configured view controller for the page at the given index or nil.
 *
 *  @param dataSource APLPageViewControllerDataSource requesting this information.
 *  @param index      index for the view controller
 *
 *  @return a configured UIViewController instance or nil
 */
- (UIViewController*)pageViewControllerDataSource:(APLPageViewControllerDataSource*)dataSource contentViewControllerForIndex:(NSUInteger)index;

/**
 *  Return the index of the given view controller.
 *
 *  @param dataSource     APLPageViewControllerDataSource requesting this information.
 *  @param viewController viewController view controller
 *
 *  @return index of view controller
 */
- (NSUInteger)pageViewControllerDataSource:(APLPageViewControllerDataSource*)dataSource indexForContentViewController:(UIViewController*)viewController;

@end

/**
 *  A class for all data source and delegate logic for a UIPageViewController.
 *  @note: Subclasses must implement -contentViewControllerForIndex: and -indexForContentViewController:
 */
@interface APLPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>
/**
 *  Array of page model objects
 */
@property (nonatomic, strong) NSArray *objects;
/**
 *  The PageViewController to which we should serve as data source and delegate
 */
@property (nonatomic, weak) UIPageViewController *pageViewController;

/**
 *  Set yes if the page view controller should loop.
 */
@property (assign, nonatomic) BOOL circular;
/**
 *  Set yes if the page view controller should not display it's standart page control.
 */
@property (assign, nonatomic) BOOL hidePageIndicator;

@property (weak, nonatomic) id<APLPageViewControllerDataSourceDelegate> delegate;

// Programmatically set the current page. The specified current page must be >= 0 && < number of objects
@property (assign, nonatomic) NSUInteger currentPage;

/**
 *  Set new objects a preselect the specified object at index.
 *
 *  @param objects the objects provided by this data source
 *  @param index   the index of the selected object
 */
-(void)setObjects:(NSArray *)objects selectIndex:(NSUInteger)index;

@end
