//
//  LostDelegate.h
//  Lost
//
//  Created by Albert Pascual on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LostDelegate <NSObject>

- (void) finishedAndDismissed;
- (void) nextStep:(NSInteger)screen;

@end
