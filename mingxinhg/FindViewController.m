//
//  FindViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "FindViewController.h"
#import "BigSelectViewController.h"
#import "PKViewController.h"
#import "ActivityNoticeViewController.h"
#import "MainViewController.h"
@interface FindViewController ()

@end

@implementation FindViewController

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
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
    [super viewWillAppear:animated];
    // [self HideTabBar:YES];
    MainViewController *mainVC=(MainViewController *)self.tabBarController;
    UIView *tabBarView=mainVC.tabBarView;
    tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bigSelectAction:(id)sender {
    BigSelectViewController *bigSelectVC=[[BigSelectViewController alloc]init];
    bigSelectVC.isFirstVC=NO;
    [self.navigationController pushViewController:bigSelectVC animated:YES];
    [bigSelectVC release];
}

- (IBAction)pkAction:(id)sender {
    PKViewController *pkVC=[[PKViewController alloc]init];
    [self.navigationController pushViewController:pkVC animated:YES];
    [pkVC release];
}

- (IBAction)activityNoticeAction:(id)sender {
    ActivityNoticeViewController *acitvityNoticeVC=[[ActivityNoticeViewController alloc]init];
    [self.navigationController pushViewController:acitvityNoticeVC animated:YES];
    [acitvityNoticeVC release];
}

- (IBAction)enterAction:(id)sender {
    
}
@end
