//
//  UIButton+EnlargeEdge.h
//  sss
//
//  Created by athudong on 13-12-11.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
