//
//  InputInfoViewController.m
//  Lost
//
//  Created by Albert Pascual on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InputInfoViewController.h"

#import "UIViewController+ECSlidingViewController.h"
#import "MEDynamicTransition.h"
#import "METransitions.h"

@interface InputInfoViewController ()
@property (nonatomic, strong) METransitions *transitions;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@end

@implementation InputInfoViewController

@synthesize delegate = _delegate;
@synthesize line1 = _line1;
@synthesize line2 = _line2;
@synthesize line3 = _line3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ( [defaults objectForKey:@"line1"] != nil )
        self.line1.text = [defaults objectForKey:@"line1"];
    if ( [defaults objectForKey:@"line2"] != nil )
        self.line2.text = [defaults objectForKey:@"line2"];
    if ( [defaults objectForKey:@"line3"] != nil )
        self.line3.text = [defaults objectForKey:@"line3"];
        
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)nextPressed:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.line1.text forKey:@"line1"];
    [defaults setObject:self.line2.text forKey:@"line2"];
    [defaults setObject:self.line3.text forKey:@"line3"];
    [defaults synchronize];

    [self.delegate nextStep:1];
}

- (IBAction)cancelPressed:(id)sender {
    [self.delegate finishedAndDismissed];
}

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

@end
