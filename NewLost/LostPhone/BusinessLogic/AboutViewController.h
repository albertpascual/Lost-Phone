//
//  AboutViewController.h
//  Lost
//
//  Created by Albert Pascual on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LostDelegate.h"

@interface AboutViewController : UIViewController

@property (nonatomic,strong) id <LostDelegate> delegate;

@end
