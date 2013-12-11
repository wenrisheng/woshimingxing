//
//  MeViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "MeViewController.h"
#import "UIView+toCircle.h"
#import "AccountManagerViewController.h"
#import "InfoNoticeViewController.h"
#import "StarCityViewController.h"
#import "MyWalletViewController.h"
#import "GeneralSettingViewController.h"
#import "MainViewController.h"

#import <CoreGraphics/CoreGraphics.h>
@interface MeViewController ()

@end

@implementation MeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        iconNameArray=[[NSArray alloc]initWithObjects:@"me_0",@"me_1",@"me_2",@"me_3",@"me_4",@"me_5", nil];
        nameArray=[[NSArray alloc]initWithObjects:@"帐号管理",@"消息通知",@"明星商城",@"我的钱包",@"通用设置",@"退出登陆", nil];
          }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_personImageView toCircle];

}
-(void)viewWillAppear:(BOOL)animated{
      self.hidesBottomBarWhenPushed=YES;
    
    MainViewController *mainVC=(MainViewController *)self.tabBarController;
    
    UIView *tabBarView=mainVC.tabBarView;
    tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [iconNameArray release];
    [nameArray release];
    [_personImageView release];
    [_personLabel release];
    [super dealloc];
}

- (IBAction)accountManageAction:(id)sender {
    AccountManagerViewController *accountMangerVC=[[AccountManagerViewController alloc]init];
    [self.navigationController pushViewController:accountMangerVC animated:YES];
    [accountMangerVC release];
}

- (IBAction)infoNoticeAction:(id)sender {
    InfoNoticeViewController *infoNoticeVC=[[InfoNoticeViewController alloc]init];
    [self.navigationController pushViewController:infoNoticeVC animated:YES];
    [infoNoticeVC release];
}

- (IBAction)starCityAction:(id)sender {
    StarCityViewController *starCity=[[StarCityViewController alloc]init];
    [self.navigationController pushViewController:starCity animated:YES];
    [starCity release];
}

- (IBAction)myWalletAction:(id)sender {
    MyWalletViewController *myWalletVC=[[MyWalletViewController alloc]init];
    [self.navigationController pushViewController:myWalletVC animated:YES];
    [myWalletVC release];
}

- (IBAction)generlSettingAction:(id)sender {
    GeneralSettingViewController *generalSettingVC=[[GeneralSettingViewController alloc]init];
    [self.navigationController pushViewController:generalSettingVC animated:YES];
    [generalSettingVC release];
}

- (IBAction)logoutAction:(id)sender {
    
    }
@end
