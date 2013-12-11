//
//  LoginViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-9.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_topImageView release];
    [_accountTextField release];
    [_passwordTextField release];
    [super dealloc];
}
- (IBAction)loginAction:(id)sender {
    [self startAnimation];
}

- (IBAction)qqLoginAction:(id)sender {
}

- (IBAction)weiboLoginAction:(id)sender {
}

- (IBAction)renrenLoginAction:(id)sender {
}
-(void)startAnimation{
    //旋转动画
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(-6 * M_PI)];
    rotationAnimation.repeatCount=NSNotFound;
    
    rotationAnimation.duration = AnimationDuration;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]; //缓入缓出
    [_topImageView.layer addAnimation:rotationAnimation forKey:Nil];
}

@end
