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
That's it!
This example, of course, is trivial (and kinda nonsense), but you can put all values (and keypaths too) we need to set in segueParameters and automatically have them set in destination view-controller.
More examples coming really soon, in the meantime you can check out the example project.

To run the example project; clone the repo, and run `pod install` from the Project directory first.

## Requirements

SMQuickSegue requires iOS 5.0 and above in a storyboard based ARC project.

## Installation

SMQuickSegue is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile (pull request to cocoapods coming soon):

   	pod 'SMQuickRestKit',:git => 'https://github.com/stefanomondino/SMQuickRestKit.git', :branch => 'master'

## Author

Stefano Mondino, stefano.mondino.dev@gmail.com

## License

SMQuickSegue is available under the MIT license. See the LICENSE file for more info.

