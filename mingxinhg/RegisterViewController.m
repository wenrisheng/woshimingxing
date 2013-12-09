//
//  RegisterViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        genderType=Man;
        startAngle=90;
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
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_nickNameTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}
- (void)dealloc {
    [_nickNameTextField release];
    [_emailTextField release];
    [_passwordTextField release];
    [_qqButtonAction release];
    [_renrenButtonAction release];
    [_weiboButtonAction release];
    [_manButton release];
    [_womanButton release];
    [_topImageView release];
    [super dealloc];
}
- (IBAction)menButtonAction:(id)sender {
    if (genderType!=Man) {
        genderType=Man;
        [_manButton setBackgroundImage:[UIImage imageNamed:@"man-sel"] forState:UIControlStateNormal];
        [_womanButton setBackgroundImage:[UIImage imageNamed:@"woman-n"] forState:UIControlStateNormal];
    }
}

- (IBAction)womanButtonAction:(id)sender {
    if (genderType!=wonan) {
        genderType=wonan;
        [_manButton setBackgroundImage:[UIImage imageNamed:@"man-n"] forState:UIControlStateNormal];
        [_womanButton setBackgroundImage:[UIImage imageNamed:@"woman-sel"] forState:UIControlStateNormal];
    }

}

- (IBAction)submitAction:(id)sender {
  
    [self startAnimation];
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
