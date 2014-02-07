//
//  APLContentViewController.m
//  APLPageViewControllerDataSource
//
//  Created by Tobias Conradi on 07.02.14.
//  Copyright (c) 2014 apploft GmbH. All rights reserved.
//

#import "APLContentViewController.h"

@interface APLContentViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@end

@implementation APLContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViewsWithItem:self.item];
}

+ (APLContentViewController *)instantiateFromStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:@"content"];
}

- (void)setItem:(NSString *)item {
    _item = item;
    [self updateViewsWithItem:item];
}
- (void) updateViewsWithItem:(NSString*)string {
    if (!self.isViewLoaded) {
        return;
    }
    self.label.text = self.item;
}

@end
