//
//  InfoNoticeViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "InfoNoticeViewController.h"
#import "MainViewController.h"
#define CornerRadio 6
@interface InfoNoticeViewController ()

@end

@implementation           InfoNoticeViewController

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
    _dongtaiNumLabel.layer.cornerRadius=CornerRadio;
_guanzhuNumLabel.layer.cornerRadius=CornerRadio;
    _pinglunNumLabel.layer.cornerRadius=CornerRadio;
    _liwuNumLabel.layer.cornerRadius=CornerRadio;
    _xitongNumLabel.layer.cornerRadius=CornerRadio;
}
-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed=YES;
    
    MainViewController *mainVC=(MainViewController *)self.tabBarController;
    
    UIView *tabBarView=mainVC.tabBarView;
    tabBarView.frame=CGRectMake(0, UIScreenHeight, tabBarView.frame.size.width, tabBarView.frame.size.height);
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_dongtaiNumLabel release];
    [_guanzhuNumLabel release];
    [_pinglunNumLabel release];
    [_liwuNumLabel release];
    [_xitongNumLabel release];
    [super dealloc];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
