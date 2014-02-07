//
//  APLPageViewControllerDataSource.m
//
//  Created by Tobias Conradi on 30.09.13.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//

#import "APLPageViewControllerDataSource.h"

@implementation APLPageViewControllerDataSource

- (void)setPageViewController:(UIPageViewController *)pageViewController {
    if (_pageViewController) {
        _pageViewController.dataSource = nil;
    }
    _pageViewController = pageViewController;
    _pageViewController.dataSource = self;

    if (self.objects.count) {
        [self contentViewControllerForIndex:0];
    }
}

- (void)setObjects:(NSArray *)objects {
    [self setObjects:objects selectIndex:0];
}

-(void)setObjects:(NSArray *)objects selectIndex:(NSUInteger)index {
    _objects = objects;
    [self updatePageViewControllerSelectedIndex:index];
}


/**
 *  Updates the page view controller.
 *  This methods should be called every time when the objects array changes.
 *  It creates and sets a content view controller with the first object in the objects array.
 */
- (void)updatePageViewControllerSelectedIndex:(NSUInteger)index {
    UIViewController *contentViewController = [self contentViewControllerForIndex:index];

    if (contentViewController == nil)
    {
        /*
         We don't have a viewController for the current campaign index. Perhaps campaign was removed in backend.
         As a fallback we select the first campaign and show it in the pageViewController
         */
        contentViewController = [self contentViewControllerForIndex:0];
    }
    
    if (contentViewController != nil) {
        NSArray *viewControllers = @[contentViewController];
        [self.pageViewController setViewControllers:viewControllers
                                          direction:UIPageViewControllerNavigationDirectionForward
                                           animated:NO
                                         completion:nil];
    }
}

-(void)setCurrentPage:(NSUInteger)index {
    NSAssert(index < [self.objects count], @"Invalid index");
    
    _currentPage = index;
    [self updatePageViewControllerSelectedIndex:_currentPage];
}

- (void)dealloc {
    _pageViewController.dataSource = nil;
    _pageViewController = nil;
    _objects = nil;
}

#pragma mark - DataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexForContentViewController:viewController];
    if (0<index) {
        index--;
    } else if (self.circular) {
        index = self.objects.count-1;
    } else {
        return nil;
    }
    return [self contentViewControllerForIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexForContentViewController:viewController];
    
    if (index < self.objects.count-1) {
        index++;
    } else if (self.circular) {
        index = 0;
    } else {
        return nil;
    }
    return [self contentViewControllerForIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.hidePageIndicator ? 0 : self.objects.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    if (self.hidePageIndicator) {
        return 0;
    }
    UIViewController *currentContentViewController = [pageViewController.viewControllers firstObject];
    return  currentContentViewController ? [self indexForContentViewController:currentContentViewController] : 0;
}

#pragma mark - helper methods

- (UIViewController*)contentViewControllerForIndex:(NSUInteger)index {
    NSAssert(self.delegate!=nil, @"APLPageViewControllerDataSource: delegate not set.");
    return [self.delegate pageViewControllerDataSource:self contentViewControllerForIndex:index];
}

- (NSUInteger) indexForContentViewController:(UIViewController*)viewController {
    NSAssert(self.delegate!=nil, @"APLPageViewControllerDataSource: delegate not set.");
    return [self.delegate pageViewControllerDataSource:self indexForContentViewController:viewController];
}

@end
