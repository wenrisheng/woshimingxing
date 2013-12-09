//
//  ApplyEnterViewController.m
//  woshimingxing
//
//  Created by athudong on 13-11-27.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

enum ResourceType{
    Image,
    Vedio,
    Audio
};

typedef enum ResourceType ResourceType;

enum ResourceSource{
    Make,
    Phone
};
typedef enum ResourceSource ResourceSource;
#import "ApplyEnterViewController.h"
#import "MainViewController.h"
#import "UIImage+Compress.h"
#import "RecordAudioViewController.h"
#import "UIAlertView+ShowShortMessage.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#define CornerRadius 6
@interface ApplyEnterViewController ()

@end

@implementation ApplyEnterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImage *image=[UIImage imageNamed:@"middle_7"];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        NSString *vedioPath=[[NSBundle mainBundle]pathForResource:@"MTV" ofType:@"mp4"];
     BOOL sa=   UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(vedioPath);
        if (sa) {
            NSLog(@"保存视频成功");
        }else{
              NSLog(@"保存视频失败");
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _xianyanTextView.layer.cornerRadius=8;
    
    _profileView.layer.cornerRadius=CornerRadius;
    _vedioView.layer.cornerRadius=CornerRadius;
    _audioView.layer.cornerRadius=CornerRadius;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_xianyanTextView resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {

    [_profileView release];
    [_vedioView release];
    [_audioView release];
    [_xianyanTextView release];
    [super dealloc];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)uploadImageAction:(id)sender {
    actionSheet=[[UIActionSheet alloc]initWithTitle:@"图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:Nil otherButtonTitles:@"相册",@"拍照", nil];
    actionSheet.tag=Image;
    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];

}

- (IBAction)uploadVedioAction:(id)sender {
    actionSheet=[[UIActionSheet alloc]initWithTitle:@"视频" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:Nil otherButtonTitles:@"本地",@"录制", nil];
    actionSheet.tag=Vedio;
    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}
- (IBAction)uploadMp3Action:(id)sender {
    actionSheet=[[UIActionSheet alloc]initWithTitle:@"音频" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:Nil otherButtonTitles:@"本地",@"录制", nil];
    actionSheet.tag=Audio;
    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet_ clickedButtonAtIndex:(NSInteger)buttonIndex{
    ResourceType resourceType=actionSheet_.tag;
    switch (resourceType) {
        case Image:
        {
            //相片
            
            
            switch (buttonIndex) {
                case 0:
                {//相册
                    NSLog(@"%d",buttonIndex);
                  
                    imagePickerController=[[UIImagePickerController alloc]init];
                    imagePickerController.delegate=self;
                    imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    imagePickerController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
        
                }
                    break;
                case 1:
                {//照相
                    
                    //检查相机模式是否可用
                    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                        [UIAlertView showMessageWithTitle:nil message:@"相机模式不可用" timeInterval:2];
                        
                        return;
                        
                    }
                    
                    //获得相机模式下支持的媒体类型
                    
                    NSArray* availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
                    
                    BOOL canTakePicture = NO;
                    for (NSString* mediaType in availableMediaTypes) {
                        if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
                            //支持拍照
                            canTakePicture = YES;
                            
                            break;
                            
                        }
                        
                    }
                    
                    //检查是否支持拍照
                    
                    if (!canTakePicture) {
                        
                       [UIAlertView showMessageWithTitle:nil message:@"你的设备不支持拍照" timeInterval:2];
                        return;
                        
                    }
                    imagePickerController=[[UIImagePickerController alloc]init];
                    imagePickerController.delegate=self;
                    imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
                    //设置图像选取控制器的类型为静态图像
                    
                    imagePickerController.mediaTypes = [[[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil] autorelease];
                    imagePickerController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];

                }
                    break;
                case 2:
                {//取消
                    NSLog(@"%d",buttonIndex);
                }
                    break;
                default:
                    break;
            }
   
        }
            break;
        case Vedio:
        { //视频
            switch (buttonIndex) {
                case 0:
                {//本地
                    imagePickerController=[[UIImagePickerController alloc]init];
                    imagePickerController.delegate=self;
                    imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    imagePickerController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                     // imagePickerController.mediaTypes = [[[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie,(NSString*)kUTTypeVideo,(NSString*)kUTTypeQuickTimeMovie,(NSString*)kUTTypeMPEG4, nil] autorelease];
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
  
                }
                    break;
                case 1:
                {//录制
                    //检查相机模式是否可用
                    
                    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
              [UIAlertView showMessageWithTitle:nil message:@"相机模式不可用" timeInterval:2];
                        return;
                        
                    }
                    
                    //获得相机模式下支持的媒体类型
                    
                    NSArray* availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
                    
                    BOOL canTakeVideo = NO;
                    
                    for (NSString* mediaType in availableMediaTypes) {
                        
                        if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
                            
                            //支持摄像
                            
                            canTakeVideo = YES;
                            
                            break;
                            
                        }
                        
                    }
                    
                    //检查是否支持摄像
                    
                    if (!canTakeVideo) {
                        
                      [UIAlertView showMessageWithTitle:nil message:@"你的设备不支持录影" timeInterval:2];
                        
                        return;
                        
                    }
                    
                 imagePickerController = [[UIImagePickerController alloc] init];
                    
                    //设置图像选取控制器的来源模式为相机模式
                    
                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    
                    //设置图像选取控制器的类型为动态图像
                    
                    imagePickerController.mediaTypes = [[[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie, nil] autorelease];
                    
                    //设置摄像图像品质
                    
                    imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
                    
                    //设置最长摄像时间
                    
                    imagePickerController.videoMaximumDuration = 30;
                    
                    //允许用户进行编辑
                    
                    imagePickerController.allowsEditing = YES;
                    
                    //设置委托对象
                    
                    imagePickerController.delegate = self;
                    
                    //以模式视图控制器的形式显示
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
                    }
                    break;
                case 2:
                {//取消
                    NSLog(@"%d",buttonIndex);
                }
                    break;
                default:
                    break;
            }
            
        }
            break;
        
            case Audio:
        {//音频
            switch (buttonIndex) {
                case 0:
                {//本地
                    NSLog(@"%d",buttonIndex);
                    imagePickerController=[[UIImagePickerController alloc]init];
                    imagePickerController.delegate=self;
                    imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    imagePickerController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
                    
                }
                    break;
                case 1:
                {//录制
                    RecordAudioViewController *recordAudio=[[RecordAudioViewController alloc]init];
                    [self.navigationController pushViewController:recordAudio animated:YES];
                    [recordAudio release];
                }
                    break;
                case 2:
                {//取消
                    NSLog(@"%d",buttonIndex);
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    [actionSheet_ release];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    NSLog(@"didFinishPickingImage");
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //获取媒体类型
    
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    //判断是静态图像还是视频
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        
        //获取用户编辑之后的图像
        
        UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        //将该图像保存到媒体库中
        image=[UIImage imageWithImageSimple:image scaledToSize:CGSizeMake(120.0, 120.0)];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
        
    {
        
        //获取视频文件的url
        
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        
        //创建ALAssetsLibrary对象并将视频保存到媒体库
        
        ALAssetsLibrary* assetsLibrary = [[ALAssetsLibrary alloc] init];
    
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL, NSError *error) {
            
            if (!error) {
                
                [UIAlertView showMessageWithTitle:nil message:@"视频保存成功" timeInterval:2];
                
            }else
                
            {
                
            [UIAlertView showMessageWithTitle:nil message:@"视频保存失败" timeInterval:2];            }
            
        }];
        
        [assetsLibrary release];
        
    }

    [picker dismissViewControllerAnimated:YES completion:^{
 
    }];
    [picker release];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"imagePickerControllerDidCancel");
    }];
    [picker release];
}
@end
