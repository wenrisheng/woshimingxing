//
//  BigSelectViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BigSelectViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "UIView+toCircle.h"
#import "ProfileViewController.h"
@interface BigSelectViewController ()

@end

@implementation BigSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        imageNameArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        nameArray=[[NSArray alloc]initWithObjects:@"annie",@"张小妹",@"路红",@"彩霞",@"Jone",@"小龙女",@"Kate",@"夏利", nil];
        contentArray=[[NSArray alloc]initWithObjects:@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧",@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧", nil];
        totalNum=10;
        currentIndex=0;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [_piaoshuView toCircle];
}

-(void)viewWillAppear:(BOOL)animated{
    if (!_isFirstVC) {
        self.hidesBottomBarWhenPushed=YES;
        MainViewController *mainVC=(MainViewController *)self.tabBarController;

        UIView *tabBarView=mainVC.tabBarView;
        tabBarView.frame=CGRectMake(0, UIScreenHeight, tabBarView.frame.size.width, tabBarView.frame.size.height);
    }


    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    if (!_isFirstVC) {
        self.hidesBottomBarWhenPushed=NO;

        MainViewController *mainVC=(MainViewController *)self.tabBarController;

        UIView *tabBarView=mainVC.tabBarView;
        tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);
    }

    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (void)dealloc {

    [imageNameArray release];
    [nameArray release];
    [contentArray release];
    
    [_nameLabel release];
    [_personImageView release];
    [_contentLabel release];
    [_piaoshuView release];
    [_piaoshuLabel release];
   
    [super dealloc];
}
- (IBAction)huanyigeButtonAction:(id)sender {
    int actullIndex=currentIndex%8;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:AnimationDuration];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_personImageView cache:YES];
    _personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:actullIndex]];
    _nameLabel.text=[nameArray objectAtIndex:actullIndex];
    _contentLabel.text=[contentArray objectAtIndex:actullIndex];
    [UIView commitAnimations];
    currentIndex++;
    
    
}


- (IBAction)touyipiaoButtonAction:(id)sender {
    if (totalNum>0) {
        totalNum--;
        _piaoshuLabel.text=[NSString stringWithFormat:@"%d",totalNum];
    }
    int actullIndex=currentIndex%8;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:AnimationDuration];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_personImageView cache:YES];
    _personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:actullIndex]];
    _nameLabel.text=[nameArray objectAtIndex:actullIndex];
    _contentLabel.text=[contentArray objectAtIndex:actullIndex];
    [UIView commitAnimations];
    currentIndex++;
    
}


- (IBAction)backAction:(id)sender {
    if (_isFirstVC) {

        AppDelegate *appDelate=[[UIApplication sharedApplication] delegate];
        MainViewController *root=[[MainViewController alloc]init];
        appDelate.window.rootViewController=root;
        [root release];

    }else{

     
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)profileAction:(id)sender {
    ProfileViewController *profileVC=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:profileVC animated:YES];
}
@end
