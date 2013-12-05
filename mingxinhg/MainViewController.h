//
//  MainViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController<UINavigationControllerDelegate>
{
    UIButton *selectButton;
}
@property(retain,nonatomic)UIView *tabBarView;
@end
