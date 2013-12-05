//
//  MyWalletViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface MyWalletViewController : BaseViewController<UIScrollViewDelegate>

- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;
@end
