# SMQuickSegue

[![Pod Version](http://cocoapod-badges.herokuapp.com/v/SMQuickSegue/badge.png)](http://cocoadocs.org/docsets/SMQuickSegue)
[![Pod Platform](http://cocoapod-badges.herokuapp.com/p/SMQuickSegue/badge.png)](http://cocoadocs.org/docsets/SMQuickSegue)

SMQuickSegue is a drop-in category for UIViewControllers that simplifies parameters setting from source view-controller to destination-view controller when using storyboard segues. The main library goal is to eliminate the conditional code in -prepareForSegue that usually checks destination view-controller class before custom parameters setting and move to a different approach where the sender that originated the segue is carrying all the parameters. This is really useful when a single view controller has more than one segue in output.


## Usage

The simplest scenario we can figure is a storyboard with two view-controllers embedded in a navigation controller with vibible navigation bar.
In the first view-controller (subclassed as FirstViewController), we put a UIButton and create an IBOutlet property named nextButton.
Then we create a push segue from the button to the next view-controller. Our goal is to set the title property of the second view-controller to a custom value (let's say "NEW TITLE!"), without setting it in storyboard. This will visually change the navigation bar title.
Then we should add the following in viewDidLoad:

```  objective-c
//FirstViewController.m

- (void) viewDidLoad {
[super viewDidLoad];
[self.nextButton setSegueParameters:@{@"title":@"NEW TITLE!"}];
}
```
and override the prepareForSegue:sender: method like this :
```  objective-c
//FirstViewController.m or your base view controller from which you extend every view-controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    [self quickPrepareForSegue:segue sender:sender];
}
```
You can also skip this last one if you extend FirstViewController from SMQuickViewController instead of UIViewController, it' up to you.

That's it!
This example, of course, is very simple and kinda nonsense (it's pointless to simply set a hardcoded title from previous to next view controller) , but you can put all values (and keypaths too) we need to set in segueParameters and automatically have them set in destination view-controller.
More examples coming really soon, in the meantime you can check out the example project.

To run the example project; clone the repo, and run `pod install` from the Project directory first.

## Requirements

SMQuickSegue requires iOS 5.0 and above in a storyboard based ARC project.

## Installation

SMQuickSegue is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

   	pod 'SMQuickSegue'

## Author

Stefano Mondino, stefano.mondino.dev@gmail.com

## License

SMQuickSegue is available under the MIT license. See the LICENSE file for more info.

