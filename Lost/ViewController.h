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

@interface ViewController : UIViewController <QuadCurveMenuDelegate>

@property (nonatomic,strong) QuadCurveMenu *menu;
@property (nonatomic,strong) IBOutlet UIImageView *imageMoving;
@property (nonatomic,strong) NSTimer *movingTimer;

@end
