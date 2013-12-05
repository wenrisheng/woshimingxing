//
//  StarCell.h
//  woshimingxing
//
//  Created by athudong on 13-12-2.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *personImageView;
@property (retain, nonatomic) IBOutlet UIImageView *orderImageView;
@property (retain, nonatomic) IBOutlet UILabel *orderLabel;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *contentLabel;
@property (retain, nonatomic) IBOutlet UILabel *numberLabel;
@property (retain, nonatomic) IBOutlet UILabel *numberTypeLabel;
@property (retain, nonatomic) IBOutlet UIButton *rightButton;
@property (retain, nonatomic) IBOutlet UIImageView *rightButtonImageView;
@property (retain, nonatomic) IBOutlet UILabel *rightButtonLabel;

@end
