//
//  StarCell.m
//  woshimingxing
//
//  Created by athudong on 13-12-2.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "StarCell.h"

@implementation StarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_personImageView release];
    [_orderImageView release];
    [_orderLabel release];
    [_nameLabel release];
    [_contentLabel release];
    [_numberLabel release];
    [_numberTypeLabel release];
    [_rightButton release];
    [_rightButtonImageView release];
    [_rightButtonLabel release];
    [super dealloc];
}
@end
