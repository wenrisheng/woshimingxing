//
//  InfoNoticeViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface InfoNoticeViewController : BaseViewController
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *backButton;


@property (retain, nonatomic) IBOutlet UILabel *dongtaiNumLabel;
@property (retain, nonatomic) IBOutlet UILabel *guanzhuNumLabel;
@property (retain, nonatomic) IBOutlet UILabel *pinglunNumLabel;
@property (retain, nonatomic) IBOutlet UILabel *liwuNumLabel;
@property (retain, nonatomic) IBOutlet UILabel *xitongNumLabel;

@end
