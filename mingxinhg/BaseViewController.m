//
//  BaseViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "BaseViewController.h"
#import "MainViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=YES;
     //
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)HideTabBar:(BOOL)hidden{
    
    self.tabBarController.tabBar.hidden=YES;
    self.hidesBottomBarWhenPushed=YES;
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0];
    for(UIView *view in self.tabBarController.view.subviews){
   
        if([view isKindOfClass:[UITabBar class]]){   //处理UITabBar视图
            
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, UIScreenHeight, view.frame.size.width,view.frame.size.height)];
                
            } else {
                
            //    [view setFrame:CGRectMake(view.frame.origin.x,UIScreenHeight-48, view.frame.size.width,view.frame.size.height)];
                
            }       
        }else{   //处理其它视图
    }
    
    }
    
    [UIView commitAnimations];
    
    }

@end
