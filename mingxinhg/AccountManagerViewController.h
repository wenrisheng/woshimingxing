//
//  AccountManagerViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface AccountManagerViewController : BaseViewController

- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *editorButton;
- (IBAction)editAction:(id)sender;

@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIImageView *personImageView;

@end
