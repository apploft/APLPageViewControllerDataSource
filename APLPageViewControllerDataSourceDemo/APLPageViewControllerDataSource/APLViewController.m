//
//  APLViewController.m
//  APLPageViewControllerDataSource
//
//  Created by Tobias Conradi on 07.02.14.
//  Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import "APLViewController.h"
#import "APLPageViewControllerDataSource.h"
#import "APLContentViewController.h"

@interface APLViewController () <APLPageViewControllerDataSourceDelegate>
@property (nonatomic) APLPageViewControllerDataSource *pageViewControllerDataSource;
@property (nonatomic, weak) IBOutlet UISwitch *circularSwitch;
@end

@implementation APLViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.pageViewControllerDataSource.circular = self.circularSwitch.isOn;
    self.pageViewControllerDataSource.objects = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"embed"]) {
        UIPageViewController *pageViewController = segue.destinationViewController;
        self.pageViewControllerDataSource.pageViewController = pageViewController;
    }
}

- (APLPageViewControllerDataSource *)pageViewControllerDataSource {
    if (!_pageViewControllerDataSource) {
        _pageViewControllerDataSource = [APLPageViewControllerDataSource new];
        _pageViewControllerDataSource.hidePageIndicator = YES;
        _pageViewControllerDataSource.delegate = self;
    }
    return _pageViewControllerDataSource;
}

- (IBAction)cirularSwitchChanged:(UISwitch*)sender {
    self.pageViewControllerDataSource.circular = sender.isOn;
}

#pragma mark - APLPageViewControllerDataSourceDelegate
- (UIViewController*)pageViewControllerDataSource:(APLPageViewControllerDataSource *)dataSource contentViewControllerForIndex:(NSUInteger)index {
    APLContentViewController *detailViewController = [APLContentViewController instantiateFromStoryboard];
    id item = dataSource.objects[index];
    detailViewController.item = item;
    return detailViewController;
}

- (NSUInteger)pageViewControllerDataSource:(APLPageViewControllerDataSource *)dataSource indexForContentViewController:(UIViewController *)viewController {
    APLContentViewController *detailViewController = (APLContentViewController*)viewController;
    return [dataSource.objects indexOfObject:detailViewController.item];
}


@end
