//
//  UIImage+Compress.m
//  mingxinhg
//
//  Created by athudong on 13-12-6.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)
+(UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize{
    // Create a graphics image context
    
    UIGraphicsBeginImageContext(newSize);
    
 [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
  
    
UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
UIGraphicsEndImageContext();

    return newImage;
}
@end
