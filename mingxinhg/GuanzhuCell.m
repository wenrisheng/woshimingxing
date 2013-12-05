//
//  PleasureCollectionCell.m
//  woshimingxing
//
//  Created by athudong on 13-11-22.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "GuanzhuCell.h"

@implementation GuanzhuCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        _personImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 95, 95)];
        _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 85, 95, 20)];
        _bgView.alpha=0.6;
        [_bgView setBackgroundColor:[UIColor darkGrayColor]];
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(11, 85, 50, 20)];
        _nameLabel.textColor=[UIColor whiteColor];
        _vImageView=[[UIImageView alloc]initWithFrame:CGRectMake(60, 70, 30, 30)];
        
        [self addSubview:_personImageView];
        [self addSubview:_bgView];
        [self addSubview:_nameLabel];
        [self addSubview:_vImageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
   
    [_personImageView release];
    [_bgView release];
    [_vImageView release];
     [_nameLabel release];
    [super dealloc];
}
@end
