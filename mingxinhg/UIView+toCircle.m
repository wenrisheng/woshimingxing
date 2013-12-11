//
//  UIView+toCircle.m
//  woshimingxing
//
//  Created by athudong on 13-11-28.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "UIView+toCircle.h"
#import <QuartzCore/QuartzCore.h>
#define CIRCLERADIO self.frame.size.width*0.5
@implementation UIView (toCircle)
-(void)toCircle{
    self.layer.cornerRadius=CIRCLERADIO;
    self.layer.masksToBounds=YES;
}
@end
