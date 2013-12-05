//
//  TabBarItem.m
//  woshimingxing
//
//  Created by athudong on 13-11-16.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "TabBarItem.h"
#define ImageWidth 30
#define TextLabelHeight 20
@implementation TabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled=YES;
        

        _button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-ImageWidth)*0.5, 2, ImageWidth, ImageWidth)];
        _textLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-TextLabelHeight, frame.size.width, TextLabelHeight)];
        [_textLabel setBackgroundColor:[UIColor clearColor]];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [_textLabel setFont:[UIFont fontWithName:@"Arial" size:10]];

        [self addSubview:_imageView];
    [self addSubview:_button];
        [self addSubview:_textLabel];
    
        

 
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
-(void)dealloc{
    [_imageView release];
    [_textLabel release];
    [_button release];
    [super dealloc];
}
@end
