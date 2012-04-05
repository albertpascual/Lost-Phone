//
//  ImageLibraryViewController.h
//  Lost
//
//  Created by Albert Pascual on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLibraryViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) IBOutlet UILabel *label;
@property (nonatomic,strong) IBOutlet UIButton *selectImageButton;

@end
