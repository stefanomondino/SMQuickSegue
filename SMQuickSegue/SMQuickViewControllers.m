//
//  SMQuickViewControllers.m
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import "SMQuickViewControllers.h"

@implementation SMQuickViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self quickPrepareForSegue:segue sender:sender];
    
    if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
      self.popover = [(UIStoryboardPopoverSegue*)segue popoverController];
    }
}

@end

@implementation SMQuickNavigationController

- (void) viewDidLoad {
    if (self.params && self.viewControllers.count == 1) {
        UIViewController* vc = self.viewControllers[0];
        [self.params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([vc respondsToSelector:NSSelectorFromString(key)]){
                [vc setValue:obj forKeyPath:key];
            }
        }];
    }
}
@end

@implementation SMQuickTabBarController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self quickPrepareForSegue:segue sender:sender];
}

@end

@implementation SMQuickTableViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self quickPrepareForSegue:segue sender:sender];
}

@end

@implementation SMQuickCollectionViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self quickPrepareForSegue:segue sender:sender];
}

@end