//
//  ImageLibraryViewController.m
//  Lost
//
//  Created by Albert Pascual on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageLibraryViewController.h"

@interface ImageLibraryViewController ()

@end

@implementation ImageLibraryViewController

@synthesize label1 = _label1;
@synthesize label2 = _label2;
@synthesize label3 = _label3;
@synthesize selectImageButton = _selectImageButton;
@synthesize selectedImage = _selectedImage;
@synthesize saveButton = _saveButton;
@synthesize cancelButton = _cancelButton;
@synthesize delegate = _delegate;
@synthesize photo = _photo;

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
    if ( [defaults objectForKey:@"line1"] != nil )
        self.label1.text = [defaults objectForKey:@"line1"];
    if ( [defaults objectForKey:@"line2"] != nil )
        self.label2.text = [defaults objectForKey:@"line2"];
    if ( [defaults objectForKey:@"line3"] != nil )
        self.label3.text = [defaults objectForKey:@"line3"];
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

- (IBAction)clickLibraryButton:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"returned from library");
    
    self.photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.selectedImage.hidden = NO;
    self.selectedImage.image = self.photo;
    self.saveButton.hidden = NO;
    self.cancelButton.hidden = NO;
    self.label1.hidden = YES;
    self.label2.hidden = YES;
    self.label3.hidden = YES;
    self.selectImageButton.hidden = YES;
    
    [self dismissModalViewControllerAnimated:YES];
    
    self.photo = [self addText:self.photo line1:self.label1.text line2:self.label2.text line3:self.label3.text];
    self.selectedImage.image = self.photo;
}

//Add text to UIImage
-(UIImage *)addText:(UIImage *)img line1:(NSString *)text1 line2:(NSString*)text2 line3:(NSString*)text3{
    int w = img.size.width;
    int h = img.size.height; 
    //lon = h - lon;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    
    //create the rect zone that we draw from the image
//    CGRect imageRect;
//    
//    if(img.imageOrientation==UIImageOrientationUp 
//       || img.imageOrientation==UIImageOrientationDown) 
//    {
//        imageRect = CGRectMake(0, 0, w, h); 
//    }
//    else 
//    {
//        imageRect = CGRectMake(0, 0, h, w); 
//    }
//
//    CGContextDrawImage(context, imageRect, img.CGImage);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
   
    //Do stupid stuff to draw the image correctly
//    CGContextTranslateCTM(context, 0, h);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    
//    if(img.imageOrientation==UIImageOrientationLeft) 
//    {
//        CGContextRotateCTM(context, M_PI / 2);
//        CGContextTranslateCTM(context, 0, -w);
//    }
//    else if(img.imageOrientation==UIImageOrientationRight) 
//    {
//        CGContextRotateCTM(context, - M_PI / 2);
//        CGContextTranslateCTM(context, -h, 0);
//    } 
//    else if(img.imageOrientation==UIImageOrientationUp) 
//    {
//        
//        //DO NOTHING
//        
//    }
    
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1);
	
    char* chartext1	= (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];
<<<<<<< HEAD
    CGContextSelectFont(context, "Futura-Medium", 44, kCGEncodingMacRoman);    
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    char* chartext2	= (char *)[text2 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Futura-Medium", 44, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    char* chartext3	= (char *)[text3 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Futura-Medium", 44, kCGEncodingMacRoman);
=======
    CGContextSelectFont(context, "Arial", 90, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    char* chartext2	= (char *)[text2 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Arial", 90, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    char* chartext3	= (char *)[text3 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Arial", 90, kCGEncodingMacRoman);
>>>>>>> see how it works
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
	
    
    //rotate text
    //CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
	
    CGContextShowTextAtPoint(context, 4, h-100, chartext1, strlen(chartext1));
    CGContextShowTextAtPoint(context, 4, h-200, chartext2, strlen(chartext2));
    CGContextShowTextAtPoint(context, 4, h-300, chartext3, strlen(chartext3));
	
	
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
	
    return [UIImage imageWithCGImage:imageMasked];
}

- (IBAction)saveImage:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.photo forKey:@"image"];
    [defaults synchronize];
    
    [self.delegate nextStep:2];
}

- (IBAction)cancelButton:(id)sender {
     [self.delegate finishedAndDismissed];
}

@end
