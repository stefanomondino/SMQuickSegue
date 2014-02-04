//
//  SecondViewController.h
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import <SMQuickViewControllers.h>

@interface SecondViewController : SMQuickViewController
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong,nonatomic) NSString* selectedTitle;

@end
