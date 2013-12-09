//
//  StarCityViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-5.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"

@interface StarCityViewController : BaseViewController
{
    BOOL isLeftPosition;
}
- (IBAction)backAction:(id)sender;
- (IBAction)datailPropAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)leftButtonAction:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *leftLabel;
- (IBAction)rightButtonAction:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *rightLabel;
@property (retain, nonatomic) IBOutlet UIImageView *topButBgImageView;

@end
