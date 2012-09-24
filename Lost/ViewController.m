//
//  ViewController.m
//  Lost
//
//  Created by Albert Pascual on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize menu = _menu;
@synthesize imageMoving = _imageMoving;
@synthesize movingTimer = _movingTimer;
@synthesize mover = _mover;
@synthesize bBack = _bBack;
@synthesize inputView = _inputView;
@synthesize imageLibrary = _imageLibrary;
@synthesize timer = _timer;
@synthesize lastMenu = _lastMenu;
@synthesize about = _about;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mover = 1;
	
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    //UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_20.png"]
                                                               highlightedImage:nil 
                                                                   ContentImage:nil 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_40.png"]
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:nil 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem3 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_55.png"]
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:nil 
                                                        highlightedContentImage:nil];
//    QuadCurveMenuItem *starMenuItem4 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_37.png"]
//                                                               highlightedImage:storyMenuItemImagePressed 
//                                                                   ContentImage:nil 
//                                                        highlightedContentImage:nil];
//    QuadCurveMenuItem *starMenuItem5 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_50.png"]
//                                                               highlightedImage:storyMenuItemImagePressed 
//                                                                   ContentImage:nil
//                                                        highlightedContentImage:nil];
//    
    
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, nil];
    
    CGFloat fX = 160;
    CGFloat fY = 300;
    if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        fX = 400;
        fY = 680;
    }
    
    self.menu =[[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus startPoint:CGPointMake(fX,fY)];    
    
	// customize menu	
    //self.menu.rotateAngle = M_PI/4 ;
    //self.menu.menuWholeAngle = M_PI;
    //self.menu.timeOffset = 0.2f;
    //self.menu.farRadius = 180.0f;
    //self.menu.endRadius = 100.0f;
    //self.menu.nearRadius = 50.0f;
    
    
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
    
    // Start timer to animate image
    self.movingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                                      selector:@selector(requestTimerReady) userInfo:nil repeats:YES];
}

- (void)requestTimerReady {
    // Animate the image
    //self.imageMoving.frame.origin.y = self.imageMoving.frame.origin.y + 1;
    
    if ( self.mover == 100 && self.bBack == NO)        
        self.bBack = YES;
    
    if ( self.mover == 0 && self.bBack == YES )
        self.bBack = NO;
    
    if ( self.bBack == NO)
        self.imageMoving.transform = CGAffineTransformMakeTranslation(0, self.mover++);
    else
        self.imageMoving.transform = CGAffineTransformMakeTranslation(0, self.mover--);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    if ( idx == 0 ) {
        //Home
        self.inputView = [[InputInfoViewController alloc] initWithNibName:@"InputInfoViewController" bundle:nil];
        
        if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
            self.inputView.modalPresentationStyle = UIModalPresentationFormSheet;
        
        self.inputView.delegate = self;
        [self presentModalViewController:self.inputView animated:YES];
        
    }
    else if ( idx == 1 ) {
        // World
        self.imageLibrary = [[ImageLibraryViewController alloc] initWithNibName:@"ImageLibraryViewController" bundle:nil];
        
        if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
            self.inputView.modalPresentationStyle = UIModalPresentationFormSheet;
        
        self.imageLibrary.delegate = self;
        [self presentModalViewController:self.imageLibrary animated:YES];
    }
    
    else if (idx == 2 ) {
        //Last
        if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad )
            self.about = [[AboutViewController alloc] initWithNibName:@"AboutViewController_iPad" bundle:nil];
            
        else
            self.about = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
        
        if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
            self.inputView.modalPresentationStyle = UIModalPresentationFormSheet;
        
        self.about.delegate = self;
        [self presentModalViewController:self.about animated:YES];
    }
}

- (void) finishedAndDismissed
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) nextStep:(NSInteger)screen
{
    [self dismissModalViewControllerAnimated:YES]; 
    self.lastMenu = screen;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                                selector:@selector(changeMenu) userInfo:nil repeats:NO];      
}

-(void) changeMenu {
    [self quadCurveMenu:nil didSelectIndex:self.lastMenu]; 
}

@end
