//
//  APLContentViewController.h
//  APLPageViewControllerDataSource
//
//  Created by Tobias Conradi on 07.02.14.
//  Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APLContentViewController : UIViewController
@property (nonatomic, strong) NSString *item;

+ (APLContentViewController *)instantiateFromStoryboard;
@end
