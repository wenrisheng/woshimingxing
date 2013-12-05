//
//  MeViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface MeViewController : BaseViewController{
    
    NSArray *iconNameArray;
    NSArray *nameArray;
    
}

@property (retain, nonatomic) IBOutlet UIImageView *personImageView;
@property (retain, nonatomic) IBOutlet UILabel *personLabel;
- (IBAction)accountManageAction:(id)sender;
- (IBAction)infoNoticeAction:(id)sender;
- (IBAction)starCityAction:(id)sender;
- (IBAction)myWalletAction:(id)sender;
- (IBAction)generlSettingAction:(id)sender;

- (IBAction)logoutAction:(id)sender;
@end
