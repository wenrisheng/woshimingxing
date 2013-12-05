//
//  AccountManagerViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "AccountManagerViewController.h"
#import "UIView+toCircle.h"
#import "MainViewController.h"
@interface AccountManagerViewController ()

@end

@implementation AccountManagerViewController

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

    [_personImageView toCircle];
    _editorButton.layer.borderColor=[[UIColor redColor] CGColor];
    _editorButton.layer.borderWidth=2;
    _editorButton.layer.cornerRadius=8;
}
-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed=YES;
    
    MainViewController *mainVC=(MainViewController *)self.tabBarController;
    
    UIView *tabBarView=mainVC.tabBarView;
    tabBarView.frame=CGRectMake(0, UIScreenHeight, tabBarView.frame.size.width, tabBarView.frame.size.height);
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    _scrollView.contentSize=CGSizeMake(_scrollView.frame.size.width, 550);
    NSLog(@"scrollView contentSize:%@",NSStringFromCGSize(_scrollView.contentSize));

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [_personImageView release];
    [_editorButton release];
    [super dealloc];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)editAction:(id)sender {
}
@end
