//
//  DongtaiCell.m
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "DongtaiCell.h"
#import "UIView+toCircle.h"
@implementation DongtaiCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        
        _personImageView=[[UIImageView alloc]initWithFrame:CGRectMake(7, 3,40,40)];
        [_personImageView toCircle];
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 3, 83, 16)];
       
        _timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(55, 22, 115, 21)];
        _timeLabel.font=[UIFont fontWithName:@"Arial" size:10];
        _timeLabel.textColor=[UIColor darkGrayColor];
        _xingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(174, 24, 15, 15)];
        _xingImageView.image=[UIImage imageNamed:@"heart"];
        _xingLabel=[[UILabel alloc]initWithFrame:CGRectMake(195, 20, 28, 28)];
        _xingLabel.font=[UIFont fontWithName:@"Arial" size:10];
        _xingLabel.textColor=[UIColor darkGrayColor];
        _infoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(223, 24, 15, 15)];
        _infoImageView.image=[UIImage imageNamed:@"info"];
        _infoLabel=[[UILabel alloc]initWithFrame:CGRectMake(246, 20, 28, 28)];
        _infoLabel.font=[UIFont fontWithName:@"Arial" size:10];
        _infoLabel.textColor=[UIColor darkGrayColor];
        _sanjiaoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(-15, 25,310,50)];
        _sanjiaoImageView.image=[UIImage imageNamed:@"heng"];
        _bigImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 280, 165)];
        _bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 170, 280, 30)];
        [_bgView setBackgroundColor:[UIColor blackColor]];

        
        _contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 180, 280, 30)];
       
        [_contentLabel setBackgroundColor:[UIColor blackColor]];
        _contentLabel.textColor=[UIColor whiteColor];
        _contentLabel.alpha=0.7;
//        self.userInteractionEnabled=YES;
//        _bgView.userInteractionEnabled=YES;
        _contentLabel.userInteractionEnabled=YES;
//        _bigImageView.userInteractionEnabled=YES;
        
        [self addSubview:_personImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_timeLabel];
        [self addSubview:_xingImageView];
        [self addSubview:_xingLabel];
        [self addSubview:_infoImageView];
        [self addSubview:_infoLabel];
       
        [self addSubview:_bigImageView];
         [self addSubview:_sanjiaoImageView];
       // [self addSubview:_bgView];
        [self addSubview:_contentLabel];
        
        [self clipsToBounds];
        down=YES;
    }
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    UIView *view=touch.view;
    if ([view isEqual:_contentLabel]) {
        if (down) {
            down=NO;
            _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y-120, _contentLabel.frame.size.width, 150);
        }else{
            down=YES;
            _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y+120, _contentLabel.frame.size.width, 30);
        }

    }
    NSLog(@"%@",NSStringFromClass([view class]));
}
-(void)labelAction:(UITapGestureRecognizer *)tapGesture{
    if (down) {
        down=NO;
        _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y+100, _contentLabel.frame.size.width, _contentLabel.frame.size.height);
    }else{
        down=YES;
                _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y-100, _contentLabel.frame.size.width, _contentLabel.frame.size.height);
    }
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
    [_nameLabel release];
    [_timeLabel release];
    [_xingImageView release];
    [_xingLabel release];
    [_infoImageView release];
    [_infoLabel release];
    [_sanjiaoImageView release];
    [_bigImageView release];
    [_bgView release];
    [_contentLabel release];
    [super dealloc];
}
@end
