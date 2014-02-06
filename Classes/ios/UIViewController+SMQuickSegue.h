//
//  UIViewController+SMQuickSegue.h
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    Convenience category used to pass parameters to destination view controllers in storyboard segues.
*/
@interface UIViewController (SMQuickSegue)
/**
 Auto-sets destination view-controller properties defined in sender's segueParameters property.
 It should be called inside source view-controller's implementation of prepareForSegue.
 If destination view-controller is a UINavigationController, segueParameters are stored in a local variable and should be set on it's first view controller during viewDidLoad.

 @param segue Original segue
 @param sender Sender that originated the segue or custom object if segue's type is manual. If a segueParameters dictionary property is set, its entries are enumerated: if every key matches a property in destination view-controller, it's value is set with corresponding object. Key-paths can be used as well. Each key/keypath in segueParameters is evaluated for compliancy in destination view-controller. If it's not responding to desired selector, nothing happens.
 */
- (void) quickPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

/**
 Manual triggers a storyboard segue with corresponding identifier and passes a parameters dictionary to segue's destination view-controller. It should be used with manual segues.
 @param identifier Segue's identifier as defined in storyboard
 @param parameters Segue's parameters dictionary to be passed over segue's destination view-controller
 */
- (void) performSegueWithIdentifier:(NSString *)identifier parameters:(NSDictionary*) params;

/**
 Manual triggers a storyboard segue with corresponding identifier and passes a parameters dictionary to segue's destination view-controller. It should be used with manual segues.
 @param identifier Segue's identifier as defined in storyboard
 @param sender Segue's original sender
 @param parameters Segue's parameters dictionary to be passed over segue's destination view-controller
 */
- (void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender parameters:(NSDictionary*) params;

/**
 Reference to UIPopoverController created by a popover segue in iPad
*/
@property (nonatomic,weak) UIPopoverController* SM_popoverController;
@end


/**
 Convenience category to be used in conjunction with UIViewController(SMQuickSegue)
 */
@interface UINavigationController(SMQuickSegue)

/**
 Sets segue parameters (coming from a previous segue) to first child view-controller.
 This is useful in custom UI design patterns such Split View Controllers, Tab View Controllers, Sliding Menus and, in general, any custom segue that leads to a UINavigationController.
 It should be called in viewDidLoad method. Use SMNavigationController instead if you don't need to subclass.
 */
- (void) setSegueParametersOnFirstChildViewController;
@end

@interface NSObject(SMQuickParams)

/**
 Parameters to be passed over segue's destination view-controller.
 @param segueParameters A NSDictionary where keys are associated to properties of destination view-controllers which you would like to set to specified values.
If you're unwinding back to a view-controller and you need to nil out some value, use [NSNull null] as value for corresponding key.
 
 */
@property (nonatomic,strong) NSDictionary* segueParameters;

/**
 Check if receiver responds to target keypath. 
 
 @param keyPath A keypath in receiver
 @return Return YES if receiver responds to desired keypath, NO otherwise
 */
- (BOOL) respondsToKeyPath:(NSString *)keyPath;
@end