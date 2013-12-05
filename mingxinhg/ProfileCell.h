//
//  ProfileCell.h
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UICollectionViewCell
@property (retain, nonatomic)IBOutlet  UIImageView *personImageView;
@property (retain, nonatomic) IBOutlet UIImageView *playImageView;
@property (retain, nonatomic) IBOutlet UIView *bgView;
@property (retain, nonatomic) IBOutlet UILabel *contentLabel;
@property (retain, nonatomic) IBOutlet UILabel *xingLabel;
@property (retain, nonatomic) IBOutlet UILabel *infoLabel;
@property (retain, nonatomic) IBOutlet UIImageView *xingImageView;
@property (retain, nonatomic) IBOutlet UIImageView *infoImageView;

@end
