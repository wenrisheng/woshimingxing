//
//  StarCityViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "StarCityViewController.h"
#import "DetailPropViewController.h"
#define AnimationDuration 0.5
@interface StarCityViewController ()

@end

@implementation StarCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isLeftPosition=YES;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [_backButton setEnlargeEdge:ButtonEnargeEdge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)datailPropAction:(id)sender {
    DetailPropViewController *detailPropVC=[[DetailPropViewController alloc]init];
    [self.navigationController pushViewController:detailPropVC animated:YES];
    [detailPropVC release];
}
- (void)dealloc {
    [_scrollView release];
    [_leftLabel release];
    [_rightLabel release];
    [_topButBgImageView release];
    [_backButton release];
    [super dealloc];
}
- (IBAction)leftButtonAction:(id)sender {
    if (!isLeftPosition) {
         _topButBgImageView.image=[UIImage imageNamed:@"lefttopbutbg.png"];
        isLeftPosition=YES;
        [UIView beginAnimations:Nil context:Nil];
        [UIView setAnimationDuration:AnimationDuration];
        _scrollView.contentOffset=CGPointMake(0, 0);
        [UIView commitAnimations];
        _leftLabel.textColor=[UIColor whiteColor];
        _rightLabel.textColor=[UIColor redColor];
       
    }
}
- (IBAction)rightButtonAction:(id)sender {
    if (isLeftPosition) {
        isLeftPosition=NO;
        _rightLabel.textColor=[UIColor whiteColor];
        _topButBgImageView.image=[UIImage imageNamed:@"righttopbutbg.png"];
        [UIView beginAnimations:Nil context:Nil];
        [UIView setAnimationDuration:AnimationDuration];
        _scrollView.contentOffset=CGPointMake(320, 0);
                [UIView commitAnimations];
        _leftLabel.textColor=[UIColor redColor];
        _rightLabel.textColor=[UIColor whiteColor];
    }
}
@end
