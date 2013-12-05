//
//  BigSelectViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface BigSelectViewController : BaseViewController


{
    NSArray *imageNameArray;
    NSArray *nameArray;
    NSArray *contentArray;
    int totalNum;
    int currentIndex;
}
@property(assign,nonatomic)BOOL isFirstVC;

@property (retain, nonatomic) IBOutlet UIImageView *personImageView;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *contentLabel;
- (IBAction)huanyigeButtonAction:(id)sender;
- (IBAction)touyipiaoButtonAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *piaoshuView;
@property (retain, nonatomic) IBOutlet UILabel *piaoshuLabel;

- (IBAction)backAction:(id)sender;

- (IBAction)profileAction:(id)sender;
@end
