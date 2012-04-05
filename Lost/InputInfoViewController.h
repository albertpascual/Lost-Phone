//
//  InputInfoViewController.h
//  Lost
//
//  Created by Albert Pascual on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LostDelegate.h"

@interface InputInfoViewController : UIViewController

@property (nonatomic,strong) id <LostDelegate> delegate;
@property (nonatomic,strong) IBOutlet UITextView *textToSave;

@end
