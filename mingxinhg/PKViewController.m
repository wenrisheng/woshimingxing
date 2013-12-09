//
//  PKViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-12.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "PKViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "MainViewController.h"
#define AnimationDuation 0.5
#import "ProfileViewController.h"
@interface PKViewController ()

@end

@implementation PKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        headImageArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        middleImageArray=[[NSArray alloc]initWithObjects:@"middle_0.png",@"middle_1.png",@"middle_2.png",@"middle_3.png",@"middle_4.png",@"middle_5.png",@"middle_6.png",@"middle_7.png", nil];
        nameArray=[[NSArray alloc]initWithObjects:@"annie",@"张小妹",@"路红",@"彩霞",@"Jone",@"小龙女",@"Kate",@"夏利", nil];
        
        currentIndex=0;
        currentPosition=MidPosition;
        
        currentTouPiaoNum=0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //视频通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didPlayMovieFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    
    /////////////////////////
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

- (void)dealloc {
    
    [headImageArray release];
    [middleImageArray release];
    [nameArray release];
    
    
    
    
    [_leftToupiaoButton release];
    [_rightToupiaoButton release];
    [_leftButton release];
    [_rightButton release];
    [_leftView release];
    [_rightView release];
    
    
    
    [_mainView release];
    [_leftNameLabel release];
    [_rightNameLabel release];
    [_toupiaoEndView release];
    [super dealloc];
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)leftButtonAction:(id)sender {
    
    
    if (currentPosition==MidPosition) {
        currentPosition=LeftPosition;
        ///////////////
        [self showContentOfPositionWihtAnimation];
    }else{
        
        currentPosition=MidPosition;
        
        [self showContentOfPositionWihtAnimation];
    }
    
    
}

- (IBAction)rightButtonAction:(id)sender {
    
    if (currentPosition==MidPosition) {
        currentPosition=RightPosition;
        [self showContentOfPositionWihtAnimation];
    }else{
        currentPosition=MidPosition;
        [self showContentOfPositionWihtAnimation];
    }
    
    
}
-(void)showContentOfPositionWihtAnimation{
    [UIView beginAnimations:Nil context:nil];
    [UIView setAnimationDuration:AnimationDuation];
    [self showContentViewOfPositionWithoutAnimation];
    [UIView commitAnimations];
}
-(void)showContentViewOfPositionWithoutAnimation{
    
    switch (currentPosition) {
        case LeftPosition:
        {
            
            _mainView.frame=CGRectMake(0, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height);
            _leftToupiaoButton.alpha=1;
            
        }
            break;
        case MidPosition:
        {
            
            _mainView.frame=CGRectMake(-160, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height);
            _leftToupiaoButton.alpha=0;
            _rightToupiaoButton.alpha=0;
        }
            break;
        case RightPosition:
        {
            _mainView.frame=CGRectMake(-320, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height);
            _rightToupiaoButton.alpha=1;
            
        }
            break;
        default:
            break;
    }
    
}
- (IBAction)personInfoAction:(id)sender {
    ProfileViewController *profileVC=[[ProfileViewController alloc]init];
    if (currentPosition==LeftPosition) {
        
    }if (currentPosition==RightPosition) {
        
    }
    [self.navigationController pushViewController:profileVC animated:YES];
    [profileVC release];
}

- (IBAction)vedioAction:(id)sender {
    if (currentPosition==LeftPosition) {
        NSString *moviePath=[[NSBundle mainBundle ]pathForResource:@"MTV" ofType:@"mp4"];
        moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:moviePath]];;
        moviePlayer.fullscreen=YES;
        moviePlayer.view.frame=self.view.bounds;
        [moviePlayer play];
        [self.view addSubview:moviePlayer.view];
        
    }if (currentPosition==RightPosition) {
        
    }
    
}

- (IBAction)audioAction:(id)sender {
    UIButton *button=(UIButton *)sender;
    UIView *superView=button.superview;
    
    NSString *audioPath=nil;
    if (currentPosition==LeftPosition) {
        audioPath=[[NSBundle mainBundle ]pathForResource:@"daolang" ofType:@"mp3"];
        
    }if (currentPosition==RightPosition) {
        audioPath=[[NSBundle mainBundle ]pathForResource:@"daolang" ofType:@"mp3"];
    }
    moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:audioPath]];;
    moviePlayer.fullscreen=YES;
    if (currentPosition==LeftPosition) {
        moviePlayer.view.frame=CGRectMake(0, superView.frame.origin.y-50, 300, superView.frame.size.height);
        
    }if (currentPosition==RightPosition) {
        moviePlayer.view.frame=CGRectMake(340, superView.frame.origin.y-50, 300, superView.frame.size.height);
        
    }
    moviePlayer.view.alpha=0.7;
    moviePlayer.view.layer.cornerRadius=5;
    [_mainView addSubview:moviePlayer.view];
    [moviePlayer play];
}

#pragma mark - 视频通知
-(void)didPlayMovieFinish:(NSNotification *)notification{
    MPMoviePlayerController *player=[notification object];
    [player.view removeFromSuperview];
    [player release];
}
- (IBAction)leftToupiaoAction:(id)sender {
    currentPosition=MidPosition;
    currentIndex++;
    currentTouPiaoNum++;
    if (currentTouPiaoNum<10) {
        [self changStar:RightPosition];
    }else{
        currentPosition=MidPosition;
        [self showContentOfPositionWihtAnimation];
        _toupiaoEndView.alpha=1;
    }
    
    
}

- (IBAction)rightToupiaoAction:(id)sender {
    currentPosition=MidPosition;
    currentIndex++;
    currentTouPiaoNum++;
    if (currentTouPiaoNum<10) {
        [self changStar:LeftPosition];
    }else{
        currentPosition=MidPosition;
        [self showContentOfPositionWihtAnimation];
        _toupiaoEndView.alpha=1;
    }
    
}
-(void)changStar:(Position)position{
    
    
    
    int imageIndex=currentIndex%8;
    [UIView animateWithDuration:AnimationDuation animations:^{
        [self showContentViewOfPositionWithoutAnimation];
    } completion:^(BOOL finished) {
        //移走
        [UIView animateWithDuration:AnimationDuation animations:^{
            switch (position) {
                case LeftPosition:
                {
                    _leftView.frame=CGRectMake(-160, _leftView.frame.origin.y, _leftView.frame.size.width, _leftView.frame.size.height);
                }
                    break;
                case RightPosition:
                {
                    _rightView.frame=CGRectMake(480, _leftView.frame.origin.y, _leftView.frame.size.width, _leftView.frame.size.height);
                }
                    break;
                default:
                    break;
            }
            
        } completion:^(BOOL finished) {
            //换内容
            [UIView animateWithDuration:AnimationDuation animations:^{
                switch (position) {
                    case LeftPosition:
                    {
                        [_leftButton setBackgroundImage:[UIImage imageNamed:[headImageArray objectAtIndex:imageIndex]] forState:UIControlStateNormal];
                        _leftNameLabel.text=[nameArray objectAtIndex:imageIndex];
                    }
                        break;
                    case RightPosition:
                    {
                        [_rightButton setBackgroundImage:[UIImage imageNamed:[headImageArray objectAtIndex:imageIndex]] forState:UIControlStateNormal];
                        _rightNameLabel.text=[nameArray objectAtIndex:imageIndex];
                    }
                        break;
                    default:
                        break;
                }
                
            } completion:^(BOOL finished) {
                //移进
                [UIView animateWithDuration:AnimationDuation animations:^{
                    switch (position) {
                        case LeftPosition:
                        {
                            _leftView.frame=CGRectMake(0, _leftView.frame.origin.y, _leftView.frame.size.width, _leftView.frame.size.height);
                        }
                            break;
                        case RightPosition:
                        {
                            _rightView.frame=CGRectMake(320, _leftView.frame.origin.y, _leftView.frame.size.width, _leftView.frame.size.height);
                        }
                            break;
                        default:
                            break;
                    }
                    
                } completion:^(BOOL finished) {
                    
                }];
                
            }];
            
        }];
    }];
    
}



@end
