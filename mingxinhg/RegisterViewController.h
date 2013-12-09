//
//  RegisterViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"
enum GenderType{
    Man,
    wonan
};
typedef enum GenderType GenderType;
@interface RegisterViewController : BaseViewController
{
    GenderType genderType;
    double startAngle;
}
@property (retain, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *emailTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)menButtonAction:(id)sender;
- (IBAction)womanButtonAction:(id)sender;
- (IBAction)submitAction:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *qqButtonAction;
@property (retain, nonatomic) IBOutlet UIButton *renrenButtonAction;
@property (retain, nonatomic) IBOutlet UIButton *weiboButtonAction;
@property (retain, nonatomic) IBOutlet UIButton *manButton;
@property (retain, nonatomic) IBOutlet UIButton *womanButton;
@property (retain, nonatomic) IBOutlet UIImageView *topImageView;


@end
