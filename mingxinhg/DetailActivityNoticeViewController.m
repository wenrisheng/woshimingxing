//
//  DetailActivityNoticeViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "DetailActivityNoticeViewController.h"
#import "ApplyEnterViewController.h"
#import "MainViewController.h"
@interface DetailActivityNoticeViewController ()

@end

@implementation DetailActivityNoticeViewController

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
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
}
//-(void)viewWillAppear:(BOOL)animated{
//    self.hidesBottomBarWhenPushed=YES;
//    
//    MainViewController *mainVC=(MainViewController *)self.tabBarController;
//    
//    UIView *tabBarView=mainVC.tabBarView;
//    tabBarView.frame=CGRectMake(0, UIScreenHeight, tabBarView.frame.size.width, tabBarView.frame.size.height);
//    [super viewWillAppear:animated];
//}
//-(void)viewWillDisappear:(BOOL)animated{
//
//    MainViewController *mainVC=(MainViewController *)self.tabBarController;
//    
//    UIView *tabBarView=mainVC.tabBarView;
//    tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);
//    [super viewWillDisappear:animated];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)enterAction:(id)sender {
    ApplyEnterViewController *applyEnterVC=[[ApplyEnterViewController alloc]init];
    [self.navigationController pushViewController:applyEnterVC animated:YES];
    [applyEnterVC release];
}
- (void)dealloc {
    [_backButton release];
    [super dealloc];
}
@end
