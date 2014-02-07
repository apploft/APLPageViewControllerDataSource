# APLPageViewControllerDataSource

[![Version](http://cocoapod-badges.herokuapp.com/v/APLPageViewControllerDataSource/badge.png)](http://cocoadocs.org/docsets/APLPageViewControllerDataSource)
[![Platform](http://cocoapod-badges.herokuapp.com/p/APLPageViewControllerDataSource/badge.png)](http://cocoadocs.org/docsets/APLPageViewControllerDataSource)


## Installation

APLPageViewControllerDataSource is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "APLPageViewControllerDataSource"

## Usage

Import header file:

    #import "APLPageViewControllerDataSource.h"

Declare a dataSource property:

    @property (nonatomic) APLPageViewControllerDataSource *dataSource;

Create a APLPageViewControllerDataSource instance and configure it:

        APLPageViewControllerDataSource *pageViewControllerDataSource = [APLPageViewControllerDataSource new];
        pageViewControllerDataSource.delegate = self;
        pageViewControllerDataSource.pageViewController = pageViewController;
        pageViewControllerDataSource.objects = @[] // your data objects
        self.dataSource = pageViewControllerDataSource;

Declare the protocol methods required to configure the view controller

    - (UIViewController*)pageViewControllerDataSource:(APLPageViewControllerDataSource *)dataSource contentViewControllerForIndex:(NSUInteger)index {
        APLContentViewController *detailViewController = [APLContentViewController instantiateFromStoryboard]; // use your own content view controller class
        id item = dataSource.objects[index];
        detailViewController.item = item; // configure your view controller
        return detailViewController;
    }
    
    - (NSUInteger)pageViewControllerDataSource:(APLPageViewControllerDataSource *)dataSource indexForContentViewController:(UIViewController *)viewController {
        APLContentViewController *detailViewController = (APLContentViewController*)viewController;
        return [dataSource.objects indexOfObject:detailViewController.item];
    }
When you retrieve new data, update your dataSource like this:

    self.dataSource.objects = newObjects;

## Author

Tobias Conradi, tconradi@apploft.de

## License

APLPageViewControllerDataSource is available under the MIT license. See the LICENSE file for more info.

