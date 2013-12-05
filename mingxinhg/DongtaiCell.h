//
//  DongtaiCell.h
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DongtaiCell : UICollectionViewCell
{
    BOOL down;
}
@property (retain, nonatomic)  UIImageView *personImageView;
@property (retain, nonatomic)  UILabel *nameLabel;
@property (retain, nonatomic)  UILabel *timeLabel;
@property (retain, nonatomic)  UIImageView *xingImageView;
@property (retain, nonatomic)  UIImageView *infoImageView;
@property (retain, nonatomic)  UILabel *xingLabel;
@property (retain, nonatomic)  UILabel *infoLabel;
@property (retain, nonatomic)  UIImageView *sanjiaoImageView;
@property (retain, nonatomic)  UIImageView *bigImageView;
@property (retain, nonatomic)  UIView *bgView;
@property (retain, nonatomic)  UILabel *contentLabel;
@end
