//
//  PublishDynaticViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-9.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "PublishDynaticViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PublishDynaticViewController ()

@end

@implementation PublishDynaticViewController

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
    // Do any additional setup after loading the view from its nib.
    _textView.layer.cornerRadius=6;
    _scrollView.layer.cornerRadius=6;
    
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [_textView release];
    [_addImageButton release];
    [_scrollView release];
    [_backButton release];
    [super dealloc];
}
- (IBAction)addImageAction:(id)sender {
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    [_addImageButton setBackgroundImage:image forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    [picker release];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    [picker release];
}
@end
