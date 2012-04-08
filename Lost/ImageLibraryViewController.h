//
//  ImageLibraryViewController.h
//  Lost
//
//  Created by Albert Pascual on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LostDelegate.h"

@interface ImageLibraryViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) IBOutlet UILabel *label1;
@property (nonatomic,strong) IBOutlet UILabel *label2;
@property (nonatomic,strong) IBOutlet UILabel *label3;
@property (nonatomic,strong) IBOutlet UIButton *selectImageButton;
@property (nonatomic,strong) IBOutlet UIImageView *selectedImage;
@property (nonatomic,strong) IBOutlet UIButton *saveButton;
@property (nonatomic,strong) IBOutlet UIButton *cancelButton;
@property (nonatomic,strong) UIImage *photo;
@property (nonatomic,strong) UIPopoverController * pop;

@property (nonatomic,strong) id <LostDelegate> delegate;

-(UIImage *)addText:(UIImage *)img line1:(NSString *)text1 line2:(NSString*)text2 line3:(NSString*)text3;

@end
