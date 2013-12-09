//
//  PleasureViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
enum PositionStatus{
    Dongtai,
    Guanzhu,
    Xihuan
};
typedef enum PositionStatus PositionStatus;

@interface PleasureViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *imageNameArray;
    NSArray *nameArray;
    NSArray *genderArray;
    NSArray *ageArray;
    NSArray *fansArray;

    
    PositionStatus currentPosition;
}
- (IBAction)publicDynaticAction:(id)sender;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView1;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView2;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)leftbuttonAction:(id)sender;
- (IBAction)middleButtonAction:(id)sender;
- (IBAction)rightButtonAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *topButbgImageView;

@property (retain, nonatomic) IBOutlet UILabel *label1;
@property (retain, nonatomic) IBOutlet UILabel *label2;

@property (retain, nonatomic) IBOutlet UILabel *label3;

@end
