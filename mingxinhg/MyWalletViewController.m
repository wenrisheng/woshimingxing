//
//  MyWalletViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "MyWalletViewController.h"
#import "MainViewController.h"
@interface MyWalletViewController ()

@end

@implementation MyWalletViewController

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
    [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
}
-(void)viewDidAppear:(BOOL)animated{
    _scrollView.contentSize=CGSizeMake(320*4, _scrollView.frame.size.height);
    [super viewDidAppear:animated];
      _scrollView.contentSize=CGSizeMake(320*4, _scrollView.frame.size.height);
}
#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    int page = _scrollView.contentOffset.x / 320;//通过滚动的偏移量来判断目前页面所对应的小白点
    
    _pageControl.currentPage = page;//pagecontroll响应值的变化
    
}
-(void)pageControlAction:(UIPageControl *)pageControl{
    int page = pageControl.currentPage;//获取当前pagecontroll的值
    
    [_scrollView setContentOffset:CGPointMake(320 * page, 0)];//根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面
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

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [_scrollView release];
    [_pageControl release];
    [_backButton release];
    [super dealloc];
}
@end
