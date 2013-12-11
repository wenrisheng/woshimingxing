//
//  ActivityNoticeViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface ActivityNoticeViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *bigImageNameArray;
    
    BOOL isLeft;
}
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;

@property (retain, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)backAction:(id)sender;
- (IBAction)leftButtonAction:(id)sender;
- (IBAction)rightButtonAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *topButtonbgImageView;
@property (retain, nonatomic) IBOutlet UIButton *leftButton;
@property (retain, nonatomic) IBOutlet UIButton *rightButton;
@property (retain, nonatomic) IBOutlet UILabel *leftLabel;
@property (retain, nonatomic) IBOutlet UILabel *rightLabel;


@end
