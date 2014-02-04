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
#define kSMQuickPopoverAssociatedObject @"kSMQuickPopoverAssociatedObject"




@implementation NSObject(SMQuickParams)

- (void)setSegueParameters:(NSDictionary*)segueParams {
    objc_setAssociatedObject(self, kSMQuickParamsAssociatedObject, segueParams, OBJC_ASSOCIATION_RETAIN);
}
- (NSDictionary *)segueParameters {
    return objc_getAssociatedObject(self, kSMQuickParamsAssociatedObject);
}

- (BOOL) respondsToKeyPath:(NSString *)keyPath {
    NSRange range = [keyPath rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
    
    if (range.location == NSNotFound){
        return ([self respondsToSelector:NSSelectorFromString(keyPath)]);
    }
    
    NSString *first = [keyPath substringToIndex:range.location];
    NSString *rest = [keyPath substringFromIndex:(range.location + 1)];
    
    if ([self respondsToSelector:NSSelectorFromString(first)]){
        return ([[self valueForKey:first] respondsToSelector:NSSelectorFromString(rest)]);
    }
    
    return NO;
}


@end





@implementation UIViewController (SMQuickSegue)

- (void) setSM_popoverController:(UIPopoverController*) popoverController {
    objc_setAssociatedObject(self, kSMQuickPopoverAssociatedObject, popoverController, OBJC_ASSOCIATION_ASSIGN);
}
- (UIPopoverController*) SM_popoverController {
    return objc_getAssociatedObject(self, kSMQuickPopoverAssociatedObject);
}

- (void) quickPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDictionary *params = [sender segueParameters];
    if (params){
        if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]){
            ((UINavigationController*)segue.destinationViewController).segueParameters = params;
        }
        else {
            [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                if ([segue.destinationViewController respondsToSelector:NSSelectorFromString(key)]){
                    [segue.destinationViewController setValue:obj forKeyPath:key];
                }
            }];
        }
    }
    if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
        self.SM_popoverController = [(UIStoryboardPopoverSegue*)segue popoverController];
    }
}



- (void) performSegueWithIdentifier:(NSString *)identifier parameters:(NSDictionary*) params {
    [self performSegueWithIdentifier:identifier sender:nil parameters:params];
}

- (void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender parameters:(NSDictionary*) params {
    if (!sender) sender = [NSObject new];
    NSAssert(![sender isKindOfClass:[UIViewController class]], @"Sender can't be a UIViewController");
    [sender setSegueParameters:params];
    [self performSegueWithIdentifier:identifier sender:sender];
    [sender performSelector:@selector(setSegueParams:) withObject:nil afterDelay:0.0];
}
@end

@implementation UINavigationController(SMQuickSegue)
- (void)setSegueParametersOnFirstChildViewController {
    NSDictionary* segueParameters = self.segueParameters;
    if (segueParameters && self.viewControllers.count == 1) {
        UIViewController* vc = self.viewControllers[0];
        [segueParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([vc respondsToSelector:NSSelectorFromString(key)]){
                [vc setValue:obj forKeyPath:key];
            }
        }];
    }
}
@end

