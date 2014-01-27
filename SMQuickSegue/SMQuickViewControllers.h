//
//  SMQuickViewControllers.h
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+SMQuickSegue.h"
@interface SMQuickViewController : UIViewController
@property (nonatomic,weak) UIPopoverController* popover;
@end

@interface SMQuickNavigationController : UINavigationController
@property (nonatomic,strong) NSDictionary* params;
@end

@interface SMQuickTabBarController : UITabBarController @end

@interface SMQuickTableViewController : UITableViewController @end

@interface SMQuickCollectionViewController : UICollectionViewController @end