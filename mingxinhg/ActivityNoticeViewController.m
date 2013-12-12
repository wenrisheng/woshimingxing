//
//  ActivityNoticeViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "ActivityNoticeViewController.h"
#import "DetailActivityNoticeViewController.h"
#import "MainViewController.h"
@interface ActivityNoticeViewController ()

@end

@implementation ActivityNoticeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        bigImageNameArray=[[NSArray alloc]initWithObjects:@"qqq-01",@"qqq-02",@"qqq-03",@"qqq-01",@"qqq-02",@"qqq-03",@"qqq-01",@"qqq-02",@"qqq-03", nil];
        
        isLeft=YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
    
    UINib *cellNib = [UINib nibWithNibName:@"ActivityNoticeCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"ActivityNoticeCell"];
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
    [bigImageNameArray release];
    [_collectionView release];
    [_topButtonbgImageView release];
    [_leftButton release];
    [_rightButton release];

    [_leftLabel release];
    [_rightLabel release];
    [_backButton release];
    [super dealloc];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return bigImageNameArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
        
   
    int row=indexPath.row;
    static NSString *identify=@"ActivityNoticeCell";
  
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];

    UIImageView *bigImageView=(UIImageView *)[cell viewWithTag:1];
    UIImageView *statusImageView=(UIImageView *)[cell viewWithTag:2];
    if (isLeft) {
        bigImageView.image=[UIImage imageNamed:[bigImageNameArray objectAtIndex:indexPath.row]];

    }else{
        bigImageView.image=[UIImage imageNamed:[bigImageNameArray objectAtIndex:bigImageNameArray.count-indexPath.row-1]];
    }
     if (row%2==0) {
       statusImageView.image=[UIImage imageNamed:@"yijieshu"];
    }else{
        statusImageView.image=[UIImage imageNamed:@"baomingzhong"];
    }
  
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailActivityNoticeViewController *detailVC=[[DetailActivityNoticeViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)leftButtonAction:(id)sender {
    if (!isLeft) {
        isLeft=YES;
        [_collectionView reloadData];
        _topButtonbgImageView.image=[UIImage imageNamed:@"lefttopbutbg"];
        
        [_leftLabel setTextColor:[UIColor colorWithWhite:1.000 alpha:1.000]];
        [_rightLabel setTextColor:[UIColor colorWithRed:0.782 green:0.000 blue:0.023 alpha:1.000]];
    }
}

- (IBAction)rightButtonAction:(id)sender {
    if (isLeft) {
        isLeft=NO;
        [_collectionView reloadData];
        _topButtonbgImageView.image=[UIImage imageNamed:@"righttopbutbg"];
       
        [_leftLabel setTextColor:[UIColor colorWithRed:0.768 green:0.000 blue:0.022 alpha:1.000]];
        [_rightLabel setTextColor:[UIColor colorWithWhite:1.000 alpha:1.000]];

      
    }
}
@end
