//
//  UIViewController+SMQuickSegue.m
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import "UIViewController+SMQuickSegue.h"
#import "SMQuickViewControllers.h"
#import <objc/runtime.h>
#define kSMQuickParamsAssociatedObject @"kSMQuickParamsAssociatedObject"



@implementation NSObject(SMQuickParams)

- (void)setSegueParams:(NSDictionary*)segueParams {
    objc_setAssociatedObject(self, kSMQuickParamsAssociatedObject, segueParams, OBJC_ASSOCIATION_RETAIN);
}
- (NSDictionary *)segueParams {
    return objc_getAssociatedObject(self, kSMQuickParamsAssociatedObject);
}

@end

@implementation UIViewController (SMQuickSegue)

- (void) quickPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDictionary *params = [sender segueParams];
    if (params){
        if ([segue.destinationViewController isKindOfClass:[SMQuickNavigationController class]]){
            ((SMQuickNavigationController*)segue.destinationViewController).params = params;
        }
        else {
            [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                if ([segue.destinationViewController respondsToSelector:NSSelectorFromString(key)]){
                    [segue.destinationViewController setValue:obj forKeyPath:key];
                }
            }];
    }
    }
}

- (void) performSegueWithIdentifier:(NSString *)identifier params:(NSDictionary*) params {
    [self performSegueWithIdentifier:identifier sender:nil params:params];
}

- (void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender params:(NSDictionary*) params {
    if (!sender) sender = [NSObject new];
    [sender setSegueParams:params];
    [self performSegueWithIdentifier:identifier sender:sender];
    [sender performSelector:@selector(setSegueParams:) withObject:nil afterDelay:0.0];
}
@end
