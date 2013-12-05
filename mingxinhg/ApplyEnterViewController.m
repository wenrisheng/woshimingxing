//
//  ApplyEnterViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "ApplyEnterViewController.h"
#import "MainViewController.h"
#define CornerRadius 6
@interface ApplyEnterViewController ()

@end

@implementation ApplyEnterViewController

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
    _xuanyanView.layer.cornerRadius=8;
    
    _profileView.layer.cornerRadius=CornerRadius;
    _vedioView.layer.cornerRadius=CornerRadius;
    _audioView.layer.cornerRadius=CornerRadius;
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

- (void)dealloc {

    [_profileView release];
    [_vedioView release];
    [_audioView release];
    [_xuanyanView release];
    [super dealloc];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
