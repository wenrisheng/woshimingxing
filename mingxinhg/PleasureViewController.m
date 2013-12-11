//
//  PleasureViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "PleasureViewController.h"
#import "DongtaiTableCell.h"
#import "UIView+toCircle.h"

#import "DongtaiCell.h"
#import "GuanzhuCell.h"
#import "MainViewController.h"
#import "PublishDynaticViewController.h"
@interface PleasureViewController ()

@end

@implementation PleasureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        imageNameArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        nameArray=[[NSArray alloc]initWithObjects:@"ANNIE",@"kate",@"倩倩",@"小妹",@"李莉",@"Joke",@"贲贲",@"Jim", nil];
        genderArray=[[NSArray alloc]initWithObjects:@"女",@"女",@"女",@"男",@"男",@"女",@"女",@"女", nil];
        ageArray=[[NSArray alloc]initWithObjects:@"23", @"21",@"20",@"18",@"29",@"16",@"26",@"23",nil];
        fansArray=[[NSArray alloc]initWithObjects:@"1234",@"3465",@"43523",@"2345",@"754g",@"8967",@"346",@"222", nil];
        
        currentPosition=Dongtai;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_collectionView1 registerClass:[DongtaiCell class] forCellWithReuseIdentifier:@"dongtaicell"];
      _collectionView1.tag=Dongtai;
    [_collectionView2 registerClass:[GuanzhuCell class] forCellWithReuseIdentifier:@"guanzhuCell"];
    _collectionView2.tag=Guanzhu;
    self.hidesBottomBarWhenPushed=YES;
    
    [_publicDynaticButton setEnlargeEdge:ButtonEnargeEdge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageNameArray release];
    [nameArray release];
    [genderArray release];
    [ageArray release];
    [fansArray release];
    
    [_collectionView1 release];


 
    [_topButbgImageView release];
    [_collectionView2 release];
    [_scrollView release];
    [_label1 release];
    [_label2 release];
    [_label3 release];
    [_publicDynaticButton release];
    [super dealloc];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return imageNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int row=indexPath.row;
    static NSString *identify=@"cell";
    DongtaiTableCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==nil) {
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"DongtaiTableCell" owner:nil options:nil];
        cell=[array objectAtIndex:0];
    }
    cell.personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:row]];
    cell.nameLabel.text=[nameArray objectAtIndex:row];
    [cell.personImageView toCircle];
    cell.isDown=YES;
    cell.contentLabel.userInteractionEnabled=YES;
    cell.contentLabel.text=@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧";
    [cell addTapGuesture];
    UIView *bgView=[[UIView alloc]init];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    cell.selectedBackgroundView=bgView;
    [bgView release];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imageNameArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    int row=indexPath.row;
    PositionStatus type=collectionView.tag;
    switch (type) {
        case Dongtai:
        {
             static NSString *identify=@"dongtaicell";
            DongtaiCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            cell.personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:row]];
            cell.timeLabel.text=@"13:02:12  15分钟前";
            cell.xingLabel.text=@"231";
            cell.infoLabel.text=@"421";
            cell.bigImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:row]];
            cell.contentLabel.text=@"微笑在你我之间传递，歌声在你我心中回肠，我要当明星，选我吧";
          
            return cell;
        }
            break;
        case Guanzhu:
        {
            static NSString *identify=@"guanzhuCell";
            GuanzhuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
            cell.personImageView.image=[UIImage imageNamed:[imageNameArray objectAtIndex:indexPath.row]];
            if (indexPath.row%2==0) {
                cell.vImageView.image=[UIImage imageNamed:@"pxing"];
            }
            cell.nameLabel.text=[nameArray objectAtIndex:row];
            if (row>=0&&row<4) {
                cell.vImageView.image=[UIImage imageNamed:@"bulexing"];
            }
            return cell;
  
        }
            break;
        case Xihuan:
        {
            
        }
            break;
        default:
        {
            return Nil;
        }
            break;
    }
    
}


- (IBAction)leftbuttonAction:(id)sender{
    if (currentPosition!=Dongtai)
    {
        currentPosition=Dongtai;
        _topButbgImageView.image=[UIImage imageNamed:@"leftbut"];
        [self changePosition];
        _label1.textColor=[UIColor whiteColor];
        _label2.textColor=[UIColor redColor];
        _label3.textColor=[UIColor redColor];
    }
}

- (IBAction)middleButtonAction:(id)sender {
    if (currentPosition!=Guanzhu) {
        currentPosition=Guanzhu;
        _topButbgImageView.image=[UIImage imageNamed:@"midbut"];
          [self changePosition];
        _label2.textColor=[UIColor whiteColor];
        _label1.textColor=[UIColor redColor];
        _label3.textColor=[UIColor redColor];
    }
}

- (IBAction)rightButtonAction:(id)sender {
    if (currentPosition!=Xihuan) {
        currentPosition=Xihuan;
        _topButbgImageView.image=[UIImage imageNamed:@"rightbut"];
          [self changePosition];
        _label3.textColor=[UIColor whiteColor];
        _label2.textColor=[UIColor redColor];
        _label1.textColor=[UIColor redColor];
    }
}
-(void)changePosition{
    switch (currentPosition) {
        case Dongtai:
        {
            _scrollView.contentOffset=CGPointMake(0, 0);
        }
            break;
        case Guanzhu:
        {
            _scrollView.contentOffset=CGPointMake(320, 0);
  
        }
            break;
        case Xihuan:
        {
            _scrollView.contentOffset=CGPointMake(640, 0);

        }
            break;
        default:
            break;
    }
}
- (IBAction)publicDynaticAction:(id)sender {
    PublishDynaticViewController *publishDynaticVC=[[PublishDynaticViewController alloc]init];
    [self.navigationController pushViewController:publishDynaticVC animated:YES];
    [publishDynaticVC release];
}
@end
