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

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    //UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_20.png"]
                                                               highlightedImage:nil 
                                                                   ContentImage:nil 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_37.png"]
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:nil 
                                                        highlightedContentImage:nil];
//    QuadCurveMenuItem *starMenuItem3 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_40.png"]
//                                                               highlightedImage:storyMenuItemImagePressed 
//                                                                   ContentImage:nil 
//                                                        highlightedContentImage:nil];
//    QuadCurveMenuItem *starMenuItem4 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_50.png"]
//                                                               highlightedImage:storyMenuItemImagePressed 
//                                                                   ContentImage:nil 
//                                                        highlightedContentImage:nil];
//    QuadCurveMenuItem *starMenuItem5 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"001_55.png"]
//                                                               highlightedImage:storyMenuItemImagePressed 
//                                                                   ContentImage:nil
//                                                        highlightedContentImage:nil];
//    
    
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, nil];
    
    CGFloat fX = 160;
    CGFloat fY = 300;
    if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        fX = 400;
        fY = 650;
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
    self.movingTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                                      selector:@selector(requestTimerReady) userInfo:nil repeats:NO];
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

@end
