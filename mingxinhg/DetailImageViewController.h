//
//  DetailImageViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface DetailImageViewController : BaseViewController
@property (retain, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *contentView;

@end
