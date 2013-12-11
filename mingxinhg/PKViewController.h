//
//  PKViewController.h
//  woshimingxing
//
//  Created by athudong on 13-11-12.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
enum Position{
    LeftPosition,
    MidPosition,
    RightPosition
};
typedef enum Position Position;
@interface PKViewController : BaseViewController

{
    NSArray *headImageArray;
    NSArray *middleImageArray;
    NSArray *nameArray;

    
    Position currentPosition;
    
    
    int currentIndex;
    
    MPMoviePlayerController *moviePlayer;
    AVAudioPlayer *audioPlayer;
    
    int currentTouPiaoNum;
}
@property (retain, nonatomic) IBOutlet UIView *mainView;

@property (retain, nonatomic) IBOutlet UIView *leftView;

@property (retain, nonatomic) IBOutlet UIView *rightView;


@property (retain, nonatomic) IBOutlet UILabel *leftNameLabel;

@property (retain, nonatomic) IBOutlet UILabel *rightNameLabel;



- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)leftButtonAction:(id)sender;
- (IBAction)rightButtonAction:(id)sender;
- (IBAction)personInfoAction:(id)sender;

- (IBAction)vedioAction:(id)sender;
- (IBAction)audioAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *leftToupiaoButton;
@property (retain, nonatomic) IBOutlet UIButton *rightToupiaoButton;
- (IBAction)leftToupiaoAction:(id)sender;
- (IBAction)rightToupiaoAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *leftButton;
@property (retain, nonatomic) IBOutlet UIButton *rightButton;
////////////////////

@property (retain, nonatomic) IBOutlet UIView *toupiaoEndView;

@end
