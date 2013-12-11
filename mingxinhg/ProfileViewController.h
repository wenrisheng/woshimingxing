//
//  ProfileViewController.h
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

enum CollectionViewType{
    Image,
    Vedio
};
typedef enum CollectionViewType CollectionViewType;
enum PositionStatus{
    ImagePosition,
    VedioPosition,
    XingPosition
};
typedef enum PositionStatus PositionStatus;
#import "BaseViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@class ASIHTTPRequest;
@interface ProfileViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    PositionStatus currentPosition;
    NSArray *imageNameArray;
    NSArray *vedioNameArray;
    
    NSArray *contentArray;
    NSArray *xingArray;
    NSArray *infoArray;
    
    MPMoviePlayerController *moviePlayer;
    ASIHTTPRequest *videoRequest;
    unsigned long long Recordull;
    BOOL isPlay;
}
@property (retain, nonatomic) IBOutlet UIImageView *personImageView;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView1;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView2;
@property (retain, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (retain, nonatomic) IBOutlet UIScrollView *bigScrollView;
@property (retain, nonatomic) IBOutlet UIImageView *midImageView;
@property (retain, nonatomic) IBOutlet UIButton *button1;
- (IBAction)button1Action:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *button2;
- (IBAction)button2Action:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *button3;

- (IBAction)button3Action:(id)sender;
- (IBAction)backAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *backButton;
@end
