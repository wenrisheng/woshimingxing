//
//  RecordAudioViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-6.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"
#import "lame.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface RecordAudioViewController : BaseViewController<AVAudioPlayerDelegate>
{
    
    NSString *recordedFilePath;
    
    BOOL isRecording;
    BOOL isPlaying;
    BOOL hasCAFFile;
    AVAudioRecorder*                recorder;
    MPMoviePlayerController *moviePlayer;

    NSTimer *timer;
}
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UILabel *sizeLabel;

@property (retain, nonatomic) IBOutlet UIButton *startOrStopButton;
- (IBAction)startOrStopAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *pauseOrResumeButton;

- (IBAction)pauseOrResumeAction:(id)sender;
- (IBAction)playAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *playButton;

@end
