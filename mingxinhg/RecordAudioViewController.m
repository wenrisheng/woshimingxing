//
//  RecordAudioViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-6.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "RecordAudioViewController.h"
#import "UIAlertView+ShowShortMessage.h"
#import "lame.h"

#define Rate 44100.0

@interface RecordAudioViewController ()

@end

@implementation RecordAudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isRecording=NO;
        isPlaying=NO;
        hasCAFFile=NO;
        
        recordedFilePath=[[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile.caf"] retain];
        NSLog(@"RecordedFile filePath:%@",recordedFilePath);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_backButton setEnlargeEdge:ButtonEnargeEdge];
    //视频通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didPlayMovieFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    
       [[NSNotificationCenter defaultCenter]removeObserver:self];
    [recordedFilePath release];
    [_timeLabel release];
    [_sizeLabel release];
    [_startOrStopButton release];
    [_pauseOrResumeButton release];
    [_playButton release];
    [_backButton release];
    [super dealloc];
}
#pragma mark - 视频通知
-(void)didPlayMovieFinish:(NSNotification *)notification{
    NSLog(@"didPlayMovieFinish");
    MPMoviePlayerController *player=[notification object];
    [player.view removeFromSuperview];
    [player release];
}
-(void)timerUpdate{
    if (isRecording) {
        
  
    int m = recorder.currentTime / 60;
    int s = ((int) recorder.currentTime) % 60;
    int ss = (recorder.currentTime - ((int) recorder.currentTime)) * 100;
    
    _timeLabel.text = [NSString stringWithFormat:@"%.2d:%.2d %.2d", m, s, ss];
    NSInteger fileSize =  [self getFileSize:recordedFilePath];
    
    _sizeLabel.text = [NSString stringWithFormat:@"%d", fileSize/1024];
      }
   
}
- (NSInteger) getFileSize:(NSString*) path
{
    NSFileManager * filemanager = [[[NSFileManager alloc]init] autorelease];
    if([filemanager fileExistsAtPath:path]){
        NSDictionary * attributes = [filemanager attributesOfItemAtPath:path error:nil];
        NSNumber *theFileSize;
        if ( (theFileSize = [attributes objectForKey:NSFileSize]) )
            return  [theFileSize intValue];
        else
            return -1;
    }
    else
    {
        return -1;
    }
}
- (IBAction)startOrStopAction:(id)sender {
    if (!isRecording) {
              NSError* error;
        
        NSMutableDictionary *settings = [NSMutableDictionary dictionary];
        [settings setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM]
                    forKey:AVFormatIDKey];
        [settings setValue:[NSNumber numberWithFloat:44100.0]
                    forKey:AVSampleRateKey]; //采样率
        [settings setValue:[NSNumber numberWithInt:1]
                    forKey:AVNumberOfChannelsKey];//通道的数目
        [settings setValue:[NSNumber numberWithInt:16]
                    forKey:AVLinearPCMBitDepthKey];//采样位数  默认 16
        [settings setValue:[NSNumber numberWithBool:NO]
                    forKey:AVLinearPCMIsBigEndianKey];//大端还是小端 是内存的组织方式
        [settings setValue:[NSNumber numberWithBool:NO]
                    forKey:AVLinearPCMIsFloatKey];//采样信号是整数还是浮点数
        recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:recordedFilePath] settings:settings error:&error];
        NSLog(@"%@", [error description]);
        if (error) {
            [UIAlertView showMessageWithTitle:nil message:@"设备不支持" timeInterval:2];
            [recorder release];
            return;
        }
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord
                                               error:&error];
        [[AVAudioSession sharedInstance] setActive:YES error:&error];
        isRecording=YES;
        [recorder prepareToRecord];
        [recorder record];
        [_startOrStopButton setTitle:@"停止" forState:UIControlStateNormal];
        timer=[NSTimer scheduledTimerWithTimeInterval:.01f
                                               target:self
                                             selector:@selector(timerUpdate)
                                             userInfo:nil
                                              repeats:YES];
    }else{
        [_startOrStopButton setTitle:@"开始" forState:UIControlStateNormal];
        isRecording=NO;
        [timer invalidate];
        timer=nil;
        
        if (recorder!=nil) {
            hasCAFFile=YES;
            _playButton.enabled=YES;
            //////////转换成mp3格式
            [self toMp3];
        }
        [recorder stop];
        [recorder release];
        recorder=nil;
    }

}
- (IBAction)pauseOrResumeAction:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (isRecording) {
        [button setTitle:@"继续" forState:UIControlStateNormal];
        [recorder pause];
        isRecording=NO;
    }else{
         [button setTitle:@"暂停" forState:UIControlStateNormal];
        [recorder record];
        isRecording=YES;
    }
}

- (IBAction)playAction:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (isRecording) {
        return;
    }
    
        if (hasCAFFile) {
           moviePlayer= [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:recordedFilePath]];;
            [moviePlayer play];
            moviePlayer.view.frame=CGRectMake(0,button.frame.origin.y+50, 320, 100);
            [self.view addSubview:moviePlayer.view];
    }

           
    
}
#pragma mark - AVAudioPlayerDelegate
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{

        [_playButton setTitle:@"播放" forState:UIControlStateNormal];
        [timer invalidate];
        timer = nil;
        isPlaying = NO;
    
}
#pragma mark - toMP3
- (void) toMp3
{
    NSString *cafFilePath =[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile.caf"];
    
    NSString *mp3FileName = @"Mp3File";
    mp3FileName = [mp3FileName stringByAppendingString:@".mp3"];
    NSString *mp3FilePath = [[NSHomeDirectory() stringByAppendingFormat:@"/Documents/"] stringByAppendingPathComponent:mp3FileName];
            NSLog(@"mp3FilePath filePath:%@",mp3FilePath);
    @try {
        int read, write;
        
        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");  //source
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, Rate);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
    }
    @finally {
        NSLog(@"转换mp3格式完成");
    }
}
@end
