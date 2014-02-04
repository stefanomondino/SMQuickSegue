//
//  FirstViewController.m
//  SMQuickSegue
//
//  Created by Stefano Mondino on 07/12/13.
//  Copyright (c) 2013 Stefano Mondino. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.title = @"Step 1";
    [self performSegueWithIdentifier:@"next" sender:nil params:@{@"title":@"Step 2",@"selectedTitle":[NSString stringWithFormat:@"Index %d selected!",indexPath.row]}];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.textLabel setText:[NSString stringWithFormat:@"Index number %d",indexPath.row]];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.barButton setSegueParams:@{@"selectedTitle":@"Direct segue from button!"}];
}
- (IBAction)backFromSecondStep:(UIStoryboardSegue* )segue {}
@end
