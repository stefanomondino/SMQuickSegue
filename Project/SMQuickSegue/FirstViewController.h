//
//  FirstViewController.h
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import <SMQuickViewControllers.h>

@interface FirstViewController : SMQuickTableViewController
- (IBAction)backFromSecondStep:(UIStoryboardSegue* )segue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@end
