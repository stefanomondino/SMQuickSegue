//
//  UIViewController+SMQuickSegue.h
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIViewController (SMQuickSegue)
- (void) quickPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
- (void) performSegueWithIdentifier:(NSString *)identifier params:(NSDictionary*) params;
- (void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender params:(NSDictionary*) params;
@end

@interface NSObject(SMQuickParams)
@property (nonatomic,strong) NSDictionary* segueParams;
@end