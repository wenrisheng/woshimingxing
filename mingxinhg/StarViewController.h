//
//  StarViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-12.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#import "StarCell.h"
@interface StarViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *leftImageNameArray;
    NSArray *leftNameArray;
    NSArray *leftContentArray;
    NSArray *leftPiaoshuArray;
    
    NSArray *rightImageNameArray;
    NSArray *rightNameArray;
    NSArray *rightContentArray;
    NSArray *rightPiaoshuArray;
    
    NSMutableArray *rowHeightArray;

    
    NSMutableArray *jingcaiRadioGroupArray;
    
    NSString *jingcaiValue;
    BOOL isLeft;
    BOOL isJingcai;
  
    UIView *upZhezhaoView;
    UIView *downZhezhaoView;
    
}
@property (retain, nonatomic) IBOutlet UITableView *table;
- (IBAction)renqiButtonAction:(id)sender;
- (IBAction)piaoshuButtonAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *topButtonbgImageView;
@property (retain, nonatomic) IBOutlet UIView *juesaiTimeView;
@property (retain, nonatomic) IBOutlet UIView *yuerbuzuView;

- (IBAction)rejectAction:(id)sender;
- (IBAction)chongzhiAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *xingbibuzuView;
@property (retain, nonatomic) IBOutlet UILabel *leftLabel;
@property (retain, nonatomic) IBOutlet UILabel *rightLabel;

@property (retain, nonatomic) IBOutlet UIView *jingcaiView;

@property (retain, nonatomic) IBOutlet UIImageView *jingcaiPersonImageView;

@property (retain, nonatomic) IBOutlet UIImageView *jingcaiOrderImageView;
@property (retain, nonatomic) IBOutlet UILabel *jingcaiOrderLabel;
@property (retain, nonatomic) IBOutlet UILabel *jingcaiNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *jingcaiNumberLabel;
@property (retain, nonatomic) IBOutlet UILabel *jingcaiContentLabel;
- (IBAction)jingcaiButtonAction:(id)sender;

@property (retain, nonatomic) IBOutlet UIView *buttonbgView;
- (IBAction)button1Action:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *label1;
- (IBAction)button2Action:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *label2;
- (IBAction)button3Action:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *label3;
- (IBAction)button4Action:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *label4;

- (IBAction)cancelJingcanAction:(id)sender;
- (IBAction)confirmJingcaiAction:(id)sender;
- (IBAction)myJingcaiAction:(id)sender;
- (IBAction)jingcaiQuestionAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *jingcaiButton;

@property (retain, nonatomic) IBOutlet UIView *jingcaiBgView;

@end
