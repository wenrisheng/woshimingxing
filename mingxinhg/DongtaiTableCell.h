//
//  DongtaiTableCell.h
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DongtaiTableCell : UITableViewCell

-(void)addTapGuesture;
@property(assign,nonatomic)BOOL isDown;
@property (retain, nonatomic) IBOutlet UIImageView *personImageView;

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;

@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UILabel *xingLabel;
@property (retain, nonatomic) IBOutlet UILabel *infoLabel;
@property (retain, nonatomic) IBOutlet UIImageView *bigImageView;
@property (retain, nonatomic) IBOutlet UILabel *contentLabel;

@end
