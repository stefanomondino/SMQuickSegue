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
    
    
}

@end

@implementation SMQuickNavigationController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self setSegueParametersOnFirstChildViewController];
}
@end

@implementation SMQuickTabBarController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self respondsToSelector:nil];
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