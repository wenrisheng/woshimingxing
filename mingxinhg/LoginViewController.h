//
//  LoginViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-9.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (retain, nonatomic) IBOutlet UIImageView *topImageView;
@property (retain, nonatomic) IBOutlet UITextField *accountTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginAction:(id)sender;
- (IBAction)qqLoginAction:(id)sender;
- (IBAction)weiboLoginAction:(id)sender;

- (IBAction)renrenLoginAction:(id)sender;
@end
