//
//  InputInfoViewController.m
//  Lost
//
//  Created by Albert Pascual on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InputInfoViewController.h"

@interface InputInfoViewController ()

@end

@implementation InputInfoViewController

@synthesize delegate = _delegate;
@synthesize textToSave = _textToSave;

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
    if ( [defaults objectForKey:@"textToSave"] != nil )
        self.textToSave.text = [defaults objectForKey:@"textToSave"];
        
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)nextPressed:(id)sender {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.textToSave.text forKey:@"textToSave"];
    [defaults synchronize];

    [self.delegate nextStep:1];
}

- (IBAction)cancelPressed:(id)sender {
    [self.delegate finishedAndDismissed];
}

@end
