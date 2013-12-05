//
//  DongtaiTableCell.m
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "DongtaiTableCell.h"
#define ChangeLabelHeight 60
@implementation DongtaiTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)addTapGuesture{
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentLabelAction:)];
    [_contentLabel addGestureRecognizer:tapGesture];
    [tapGesture release];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)contentLabelAction:(UITapGestureRecognizer *)tapGesture{
    if (_isDown) {
        _isDown=NO;
        _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y-ChangeLabelHeight, _contentLabel.frame.size.width, _contentLabel.frame.size.height);
    }else{
        _isDown=YES;
        _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y+ChangeLabelHeight, _contentLabel.frame.size.width, _contentLabel.frame.size.height);
    }
}

- (void)dealloc {
    [_personImageView release];
    [_timeLabel release];
    [_xingLabel release];
    [_infoLabel release];
    [_bigImageView release];
    [_contentLabel release];
    [_nameLabel release];
    [super dealloc];
}
@end
