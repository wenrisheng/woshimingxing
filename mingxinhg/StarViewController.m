//
//  StarViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-12.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "StarViewController.h"
#import "MainViewController.h"
#import "UIView+toCircle.h"
#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#define NormalCellHeight 50




@interface StarViewController ()

@end

@implementation StarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        leftImageNameArray=[[NSArray alloc]initWithObjects:@"head_0.png",@"head_1.png",@"head_2.png",@"head_3.png",@"head_4.png",@"head_5.png",@"head_6.png",@"head_7.png", nil];
        leftNameArray=[[NSArray alloc]initWithObjects:@"aae",@"anie",@"eeie",@"nie",@"annaaie",@"ssadie",@"assnnie",@"annie", nil];
        leftContentArray=[[NSArray alloc]initWithObjects:@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩", nil];
        leftPiaoshuArray=[[NSArray alloc]initWithObjects:@"234121",@"12234",@"132",@"1312",@"34523",@"3463",@"23542",@"23542", nil];
        
        
        rightImageNameArray=[[NSArray alloc]initWithObjects:@"head_1.png",@"head_6.png",@"head_2.png",@"head_4.png",@"head_3.png",@"head_3.png",@"head_0.png",@"head_7.png", nil];
        rightNameArray=[[NSArray alloc]initWithObjects:@"annie",@"aaannie",@"aeeennie",@"anggnie",@"annaaie",@"annddie",@"assnnie",@"annie", nil];
        rightContentArray=[[NSArray alloc]initWithObjects:@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩",@"你是我天边最美的云彩", nil];
        rightPiaoshuArray=[[NSArray alloc]initWithObjects:@"234124321",@"12341234",@"123412",@"124312",@"34523",@"3463",@"23542",@"23542", nil];
        
        isJingcai=NO;
        isLeft=YES;

        upZhezhaoView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,10)];
        downZhezhaoView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,10)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tapGesture.numberOfTapsRequired=1;
    [_jingcaiBgView addGestureRecognizer:tapGesture];
    [tapGesture release];

}
-(void)viewWillAppear:(BOOL)animated{
      self.tabBarController.tabBar.hidden=YES;
     [super viewWillAppear:animated];
     [self HideTabBar:YES];
    MainViewController *mainVC=(MainViewController *)self.tabBarController;
    
    UIView *tabBarView=mainVC.tabBarView;
    tabBarView.frame=CGRectMake(0, UIScreenHeight-TabBarViewHight, tabBarView.frame.size.width,TabBarViewHight);
   
}
-(void)tapAction:(id)sender{
    _jingcaiView.alpha=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [upZhezhaoView release];
    [downZhezhaoView release];
    
    [leftImageNameArray release];
    [leftNameArray release];
    [leftContentArray release];
    [leftPiaoshuArray release];
    
    [rightImageNameArray release];
    [rightNameArray release];
    [rightContentArray release];
    [rightPiaoshuArray release];
    
    [_table release];

    [_topButtonbgImageView release];

    [_juesaiTimeView release];
    [_yuerbuzuView release];

    [_xingbibuzuView release];


    [_leftLabel release];
    [_rightLabel release];
    [_jingcaiView release];
    [_jingcaiPersonImageView release];
    [_jingcaiOrderImageView release];
    [_jingcaiOrderLabel release];
    [_jingcaiNameLabel release];
    [_jingcaiNumberLabel release];
    [_jingcaiContentLabel release];

    [_buttonbgView release];
    [_label1 release];
    [_label2 release];
    [_label3 release];
    [_label4 release];
    [_jingcaiButton release];
    [_jingcaiBgView release];
    [super dealloc];
}
#pragma mark - uitableDataSourceDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (isLeft) {
        return    leftImageNameArray.count;
    }else{
        return rightImageNameArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int row=indexPath.row;
    static NSString *identify=@"cell";
    StarCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell==nil) {
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"StarCell" owner:nil options:nil];
        cell=[array objectAtIndex:0];
    }
    //单双行的颜色不同
    if (row%2==0) {
        cell.contentLabel.textColor=[UIColor blackColor];
        cell.numberLabel.textColor=[UIColor darkGrayColor];
        cell.numberTypeLabel.textColor=[UIColor blackColor];
    }else{
        cell.contentLabel.textColor=[UIColor darkGrayColor];
        cell.numberLabel.textColor=[UIColor blackColor];
        cell.numberTypeLabel.textColor=[UIColor darkGrayColor];
    }
 //左边 票数榜
    if (isLeft) {
        cell.personImageView.image=[UIImage imageNamed:[leftImageNameArray objectAtIndex:indexPath.row]];
        cell.numberTypeLabel.text=@"票";
        cell.rightButtonImageView.image=[UIImage imageNamed:@"bi"];
        cell.rightButtonLabel.text=@"竞猜";
        cell.nameLabel.text=[leftNameArray objectAtIndex:indexPath.row];
        cell.contentLabel.text=[leftContentArray objectAtIndex:indexPath.row];
    }else{
      //右边 人气榜
        cell.personImageView.image=[UIImage imageNamed:[rightImageNameArray objectAtIndex:indexPath.row]];
        cell.nameLabel.text=[rightNameArray objectAtIndex:indexPath.row];
        cell.contentLabel.text=[rightContentArray objectAtIndex:indexPath.row];
        cell.numberTypeLabel.text=@"人气";
        cell.rightButtonImageView.image=[UIImage imageNamed:@"hua"];
        cell.rightButtonLabel.text=@"送花";

    }
    //button
    if (row==0) {
        cell.orderImageView.image=[UIImage imageNamed:@"jin"];
        cell.orderLabel.textColor=[UIColor colorWithRed:0.756 green:0.537 blue:0.176 alpha:1.000];
    }else if(row==1){
        cell.orderImageView.image=[UIImage imageNamed:@"yin"];
        cell.orderLabel.textColor=[UIColor colorWithWhite:0.665 alpha:1.000];
    }else if (row==2){
        cell.orderImageView.image=[UIImage imageNamed:@"tong"];
        cell.orderLabel.textColor=[UIColor colorWithRed:0.574 green:0.218 blue:0.047 alpha:1.000];
    }else{
        cell.orderImageView.image=[UIImage imageNamed:@"xing"];
        cell.orderLabel.textColor=[UIColor whiteColor];
    }
    

    [cell.personImageView toCircle];
    cell.orderLabel.text=[NSString stringWithFormat:@"%d",row+1];

    cell.rightButton.layer.cornerRadius=4;
    cell.rightButton.layer.borderColor=[[UIColor redColor] CGColor];
    cell.rightButton.layer.borderWidth=1;
    cell.rightButton.tag=row;
    [cell.rightButton addTarget:self action:@selector(rowButton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)rowButton:(UIButton *)button{
    _jingcaiButton.layer.cornerRadius=4;
    _jingcaiButton.layer.borderColor=[[UIColor redColor] CGColor];
    _jingcaiButton.layer.borderWidth=1;
    int row=button.tag;
    StarCell *cell=(StarCell *)[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    if (isLeft) {
        _jingcaiPersonImageView.image=cell.personImageView.image;
        _jingcaiOrderImageView.image=cell.orderImageView.image;
        _jingcaiOrderLabel.textColor=cell.orderLabel.textColor;
        _jingcaiOrderLabel.text=cell.orderLabel.text;
        _jingcaiNameLabel.text=cell.nameLabel.text;
        _jingcaiNumberLabel.textColor=cell.numberTypeLabel.textColor;
        _jingcaiNumberLabel.text=cell.numberLabel.text;
        self.jingcaiView.center=self.view.center;
        self.jingcaiView.alpha=1;
    }else{
        
    }
  
    
    
   }
#pragma mark - uitableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProfileViewController *profileVC=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:profileVC animated:YES];
    [profileVC release];
}
#pragma mark - button

- (IBAction)renqiButtonAction:(id)sender {
    if (isLeft) {
        isLeft=NO;
        [_table reloadData];
        _topButtonbgImageView.image=[UIImage imageNamed:@"righttopbutbg.png"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        _juesaiTimeView.frame=CGRectMake(-320, _juesaiTimeView.frame.origin.y, _juesaiTimeView.frame.size.width, _juesaiTimeView.frame.size.height);
        _table.frame=CGRectMake(_table.frame.origin.x, _table.frame.origin.y-42, _table.frame.size.width, _table.frame.size.height+42);
        [UIView commitAnimations];
        _leftLabel.textColor=[UIColor redColor];
        _rightLabel.textColor=[UIColor whiteColor];
    }
}

- (IBAction)piaoshuButtonAction:(id)sender {
    if (!isLeft) {
        [_table reloadData];
        isLeft=YES;
        _topButtonbgImageView.image=[UIImage imageNamed:@"lefttopbutbg.png"];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        _juesaiTimeView.frame=CGRectMake(0, _juesaiTimeView.frame.origin.y, _juesaiTimeView.frame.size.width, _juesaiTimeView.frame.size.height);
        _table.frame=CGRectMake(_table.frame.origin.x, _table.frame.origin.y+42, _table.frame.size.width, _table.frame.size.height-42);
        [UIView commitAnimations];
        _leftLabel.textColor=[UIColor whiteColor];
        _rightLabel.textColor=[UIColor redColor];
              }
}


- (IBAction)myJingcaiAction:(id)sender {
}

- (IBAction)jingcaiQuestionAction:(id)sender {
}

- (IBAction)rejectAction:(id)sender {
  [[[sender superview]superview] removeFromSuperview];    
}

- (IBAction)chongzhiAction:(id)sender {
     [[[sender superview]superview] removeFromSuperview];
}

- (IBAction)jingcaiButtonAction:(id)sender {
    _jingcaiView.alpha=0;
}
- (IBAction)button2Action:(id)sender {
    _buttonbgView.frame=CGRectMake(80, _buttonbgView.frame.origin.y, _buttonbgView.frame.size.width, _buttonbgView.frame.size.height);
    
    _label2.textColor=[UIColor whiteColor];
    _label1.textColor=[UIColor redColor];
    _label3.textColor=[UIColor redColor];
    _label4.textColor=[UIColor redColor];
}
- (IBAction)button3Action:(id)sender {
    _buttonbgView.frame=CGRectMake(160, _buttonbgView.frame.origin.y, _buttonbgView.frame.size.width, _buttonbgView.frame.size.height);
    
    _label3.textColor=[UIColor whiteColor];
    _label2.textColor=[UIColor redColor];
    _label1.textColor=[UIColor redColor];
    _label4.textColor=[UIColor redColor];
}
- (IBAction)button4Action:(id)sender {
    _buttonbgView.frame=CGRectMake(230, _buttonbgView.frame.origin.y, _buttonbgView.frame.size.width, _buttonbgView.frame.size.height);
    
    _label4.textColor=[UIColor whiteColor];
    _label2.textColor=[UIColor redColor];
    _label3.textColor=[UIColor redColor];
    _label1.textColor=[UIColor redColor];
}
- (IBAction)cancelJingcanAction:(id)sender {
    _jingcaiView.alpha=0;
}

- (IBAction)confirmJingcaiAction:(id)sender {
    UIButton *confirmButton=sender;
   // StarCell *selectCell=(StarCell *)[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:confirmButton.tag inSection:0]];
    
    self.xingbibuzuView.center=self.view.center;
    [self.view addSubview:self.xingbibuzuView];
}
- (IBAction)button1Action:(id)sender {
    _buttonbgView.frame=CGRectMake(10, _buttonbgView.frame.origin.y, _buttonbgView.frame.size.width, _buttonbgView.frame.size.height);
    
    _label1.textColor=[UIColor whiteColor];
    _label2.textColor=[UIColor redColor];
    _label3.textColor=[UIColor redColor];
    _label4.textColor=[UIColor redColor];
}
@end
