//
//  SMQuickSegueTests.m
//  SMQuickSegueTests
//
//  Created by Stefano Mondino on 29/01/14.
//  Copyright (c) 2014 Stefano Mondino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import <UIViewController+SMQuickSegue.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SMQuickSegueTests : XCTestCase
@property (nonatomic,strong) UIViewController* startViewController;
@property (nonatomic,weak) AppDelegate* appDelegate;
@end

@implementation SMQuickSegueTests

- (void)setUp
{
    [super setUp];
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"SimpleStoryboard" bundle:[NSBundle mainBundle]];
    UINavigationController* navigationController = [storyboard instantiateInitialViewController];
    self.startViewController = navigationController.topViewController;
    
}

- (void)tearDown
{
    self.startViewController = nil;
    [super tearDown];
}

- (void) testInitialViewControllerIsSet {
    XCTAssertNotNil(self.startViewController, @"First view controller must not be nil");
}

- (void)testInitialViewControllerHasSegue
{
    XCTAssertNoThrow([self.startViewController performSegueWithIdentifier:@"next" sender:self], @"Second ViewController should be connected");
}

- (void) testSetSegueParametersNotNil {
    NSDictionary* params = @{@"aKey":@"aValue"};
    NSObject* mockObject = [NSObject new];
    [mockObject setSegueParameters:params];
    
    XCTAssertNotNil(mockObject.segueParameters, @"Segue parameters must not be nil");
    
}

- (void) testSetSegueParametersEquality {
    NSDictionary* params = @{@"aKey":@"aValue"};
    NSObject* mockObject = [NSObject new];
    [mockObject setSegueParameters:params];
    XCTAssertEqual(params, mockObject.segueParameters, @"Segue parameters on object are not set correctly");
}

- (void) testPrepareForSegue {
    SecondViewController* secondViewController = [[SecondViewController alloc] init];
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"next" source:self.startViewController destination:secondViewController performHandler:^{
        return;
    }];
    NSObject* sender = [[NSObject alloc] init];
    [sender setSegueParameters:@{@"selectedTitle":@"The title"}];
    [self.startViewController prepareForSegue:segue sender:sender];
    XCTAssertTrue([secondViewController.selectedTitle isEqualToString:@"The title"], @"Property setting is not working");
    
}

@end
