//
//  DetailActivityNoticeViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface DetailActivityNoticeViewController : BaseViewController
@property (retain, nonatomic) IBOutlet UIButton *backButton;


- (IBAction)backAction:(id)sender;
- (IBAction)enterAction:(id)sender;

@end
