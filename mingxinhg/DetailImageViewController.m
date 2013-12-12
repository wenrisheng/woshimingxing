//
//  DetailImageViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "DetailImageViewController.h"
#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface DetailImageViewController ()

@end

@implementation DetailImageViewController

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
    _contentView.layer.cornerRadius=4;
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
}
-(void)viewWillAppear:(BOOL)animated{

        self.hidesBottomBarWhenPushed=YES;
        MainViewController *mainVC=(MainViewController *)self.tabBarController;
        
        UIView *tabBarView=mainVC.tabBarView;

        tabBarView.frame=CGRectMake(0, UIScreenHeight, tabBarView.frame.size.width, tabBarView.frame.size.height);

    
    
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{

        self.hidesBottomBarWhenPushed=NO;
        
        MainViewController *mainVC=(MainViewController *)self.tabBarController;
        
        UIView *tabBarView=mainVC.tabBarView;
        tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);

    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [_contentView release];
    [_backButton release];
    [super dealloc];
}
@end
