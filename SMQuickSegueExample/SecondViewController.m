//
//  SecondViewController.m
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
- (IBAction)goBack:(id)sender {
    [self performSegueWithIdentifier:@"goBack" sender:nil params:@{@"title":@"We're back!"}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelTitle.text = self.selectedTitle;
}
@end
