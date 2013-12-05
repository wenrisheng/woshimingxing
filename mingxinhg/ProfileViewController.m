//
//  ProfileViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIView+toCircle.h"
#import "DetailImageViewController.h"
#import "ProfileCell.h"
#import "MainViewController.h"
#define MovieHeight 350
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        imageNameArray=[[NSArray alloc]initWithObjects:@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", @"head_0.png",@"head_1.png",nil];
        vedioNameArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        contentArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        xingArray=[[NSArray alloc]initWithObjects:@"12",@"12",@"12",@"12",@"12",@"12",@"12",@"12", nil];
        infoArray=[[NSArray alloc]initWithObjects:@"12",@"12",@"12",@"12",@"12",@"12",@"12",@"12", nil];
        currentPosition=ImagePosition;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_personImageView toCircle];
    

    [_collectionView1 registerClass:[ProfileCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView1.tag=Image;
    [_collectionView2 registerClass:[ProfileCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView2.tag=Vedio;
   
    
    

    
    
    //视频通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didPlayMovieFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _bigScrollView.contentSize=CGSizeMake(320, 500);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_personImageView release];
    [_collectionView1 release];
    [_collectionView2 release];
    [_smallScrollView release];
    [_bigScrollView release];
    [_midImageView release];
    
    [_button1 release];
    [_button2 release];
    [_button3 release];
    
    [super dealloc];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    CollectionViewType type=collectionView.tag;
    switch (type) {
        case Image:
        {
            return imageNameArray.count;
        }
            break;
        case Vedio:
        {
            return vedioNameArray.count;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify=@"cell";
    CollectionViewType type=collectionView.tag;
    switch (type) {
        case Image:
        {
            ProfileCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            
            cell.personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:indexPath.row]];
            
            cell.contentLabel.text=[contentArray objectAtIndex:indexPath.row];
            
            cell.xingLabel.text=[xingArray objectAtIndex:indexPath.row];
            cell.infoLabel.text=[infoArray objectAtIndex:indexPath.row];
            return cell;
        }
            break;
        case Vedio:
        {
            ProfileCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            cell.personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:indexPath.row]];
            
            cell.contentLabel.text=[contentArray objectAtIndex:indexPath.row];
            
            cell.xingLabel.text=[xingArray objectAtIndex:indexPath.row];
            cell.infoLabel.text=[infoArray objectAtIndex:indexPath.row];
            cell.playImageView.image=[UIImage imageNamed:@"play"];
            return cell;
            
        }
            break;
        default:
        {
            return nil;
        }
            break;
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewType type=collectionView.tag;
    switch (type) {
        case Image:
        {
            DetailImageViewController *detailImageVC=[[DetailImageViewController alloc]init];
            [self.navigationController pushViewController:detailImageVC animated:YES];
            [detailImageVC release];
        }
            break;
        case Vedio:
        {
            NSString *moviePath=[[NSBundle mainBundle ]pathForResource:@"MTV" ofType:@"mp4"];
            moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:moviePath]];;
            [moviePlayer play];
            moviePlayer.view.frame=CGRectMake(0, (UIScreenHeight-MovieHeight)*0.5, UIScreenWidth, MovieHeight);
            [self.view addSubview:moviePlayer.view];
        }
            break;
        default:
        {
            
        }
            break;
    }
    
}
#pragma mark - 视频通知
-(void)didPlayMovieFinish:(NSNotification *)notification{
    MPMoviePlayerController *player=[notification object];
    [player.view removeFromSuperview];
    [player release];
}
#pragma mark - 按钮事件
- (IBAction)button1Action:(id)sender {
    if (currentPosition!=ImagePosition) {
        currentPosition=ImagePosition;
        [self changDownView];
    }
    
}
- (IBAction)button2Action:(id)sender {
    if (currentPosition!=VedioPosition) {
        
        currentPosition=VedioPosition;
        [self changDownView];
        
    }
}
- (IBAction)button3Action:(id)sender {
    if (currentPosition!=XingPosition) {
        currentPosition=XingPosition;
        [self changDownView];
        
    }
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)changDownView{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:AnimationDuration];
    switch (currentPosition) {
        case ImagePosition:
        {
            _midImageView.center=CGPointMake(_button1.center.x, _midImageView.center.y);
            _smallScrollView.contentOffset=CGPointMake(0, 0);
        }
            break;
        case VedioPosition:
        {
            
            _midImageView.center=CGPointMake(_button2.center.x, _midImageView.center.y);
            _smallScrollView.contentOffset=CGPointMake(320, 0);
            
        }
            break;
        case XingPosition:
        {
            
            
            _midImageView.center=CGPointMake(_button3.center.x, _midImageView.center.y);
            _smallScrollView.contentOffset=CGPointMake(640, 0);
            
        }
            break;
        default:
            break;
    }
    [UIView commitAnimations];
}

@end
