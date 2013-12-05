//
//  ProfileCell.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _personImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 90, 60)];
        _playImageView=[[UIImageView alloc]initWithFrame:CGRectMake(23, 7, 45,45)];
        _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 60, 90, 30)];
        [_bgView setBackgroundColor:[UIColor blackColor]];
        _contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 90, 15)];
        _contentLabel.textColor=[UIColor whiteColor];
        _contentLabel.font=[UIFont fontWithName:@"Arial" size:10];
        _xingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(7, 75, 15, 15)];
        _xingImageView.image=[UIImage imageNamed:@"1111111-30.png"];
        _xingLabel=[[UILabel alloc]initWithFrame:CGRectMake(25, 75, 90, 15)];
        _xingLabel.textColor=[UIColor whiteColor];
        _xingLabel.font=[UIFont fontWithName:@"Arial" size:10];
        _infoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(45, 75, 15, 15)];
        _infoImageView.image=[UIImage imageNamed:@"1111111-31.png"];
        _infoLabel=[[UILabel alloc]initWithFrame:CGRectMake(65, 75, 90, 15)];
        _infoLabel.textColor=[UIColor whiteColor];
        _infoLabel.font=[UIFont fontWithName:@"Arial" size:10];
        
        [self addSubview:_personImageView];
        [self addSubview:_playImageView];
        [self addSubview:_bgView];
        [self addSubview:_contentLabel];
        [self addSubview:_xingImageView];
        [self addSubview:_xingLabel];
        [self addSubview:_infoImageView];
        [self addSubview:_infoLabel];
        
        [self setBackgroundColor:[UIColor whiteColor]];
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
    [_playImageView release];
    [_bgView release];
    [_contentLabel release];
    [_xingImageView release];
    [_xingLabel release];
    [_infoImageView release];
    [_infoLabel release];
 
    [super dealloc];
}
@end
