//
//  ApplyEnterViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface ApplyEnterViewController : BaseViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *imagePickerController;
    UIActionSheet *actionSheet;
}
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *profileView;
@property (retain, nonatomic) IBOutlet UIView *vedioView;
@property (retain, nonatomic) IBOutlet UIView *audioView;

@property (retain, nonatomic) IBOutlet UITextView *xianyanTextView;
- (IBAction)uploadImageAction:(id)sender;
- (IBAction)uploadVedioAction:(id)sender;

- (IBAction)uploadMp3Action:(id)sender;

@end
