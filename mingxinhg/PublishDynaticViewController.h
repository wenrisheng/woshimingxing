//
//  PublishDynaticViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-9.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface PublishDynaticViewController : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UITextView *textView;
- (IBAction)addImageAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *addImageButton;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end
