//
//  ViewController.h
//  Lost
//
//  Created by Albert Pascual on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QuadCurveMenu.h"
#import "QuadCurveMenuItem.h"
#import "InputInfoViewController.h"
#import "LostDelegate.h"

@interface ViewController : UIViewController <QuadCurveMenuDelegate, LostDelegate>

@property (nonatomic,strong) QuadCurveMenu *menu;
@property (nonatomic,strong) IBOutlet UIImageView *imageMoving;
@property (nonatomic,strong) NSTimer *movingTimer;
@property (nonatomic) CGFloat mover;
@property (nonatomic) BOOL bBack;
@property (nonatomic,strong) InputInfoViewController *inputView;

@end
