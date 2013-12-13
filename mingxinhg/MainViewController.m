//
//  MainViewController.m
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import "MainViewController.h"
#import "FindViewController.h"
#import "StarViewController.h"
#import "PleasureViewController.h"
#import "MeViewController.h"
#import "TabBarItem.h"
@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    
  //  self.tabBar.hidden=YES;
    
    [self initViewControllers];
    [self initTabBarView];
    

}
-(void)initViewControllers{
    
    FindViewController *findVC=[[FindViewController alloc]init];
    StarViewController *starVC=[[StarViewController alloc]init];
    PleasureViewController *pleasureVC=[[PleasureViewController alloc]init];
    MeViewController *meVC=[[MeViewController alloc]init];
    
    
    
    
    
    UINavigationController *firstNav=[[UINavigationController alloc]initWithRootViewController:findVC];
    firstNav.delegate=self;
    [findVC release];
    UINavigationController *seconeNav=[[UINavigationController alloc]initWithRootViewController:starVC];
    [starVC release];
    UINavigationController *threeNav=[[UINavigationController alloc]initWithRootViewController:pleasureVC];
    [pleasureVC release];
    UINavigationController *fourNav=[[UINavigationController alloc]initWithRootViewController:meVC];
    [meVC release];
    
    NSArray *navsArray=@[firstNav,seconeNav,threeNav,fourNav];
    
    self.viewControllers=navsArray;
    for (UINavigationController *nav in navsArray) {
        [nav release];
    }
}
-(void)initTabBarView{
    _tabBarView=[[UIView alloc]initWithFrame:CGRectMake(0,UIScreenHeight-TabBarViewHight, UIScreenWidth, TabBarViewHight)];
    /*---------------------------------TabBarItem 按钮------------------------------------------------*/
    float coordinateX=0;
    for (int i=0; i<4; i++) {
        TabBarItem *tabBarItem=[[TabBarItem alloc]initWithFrame:CGRectMake(coordinateX,0,80, TabBarViewHight)];
        if (i==0) {
            selectButton=tabBarItem.button;
            tabBarItem.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"selecttabbar_%d",i+1]];
            tabBarItem.textLabel.textColor=[UIColor redColor];
            
        }else{
            tabBarItem.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",i+1]];
            tabBarItem.textLabel.textColor=[UIColor darkGrayColor];
            
        }
        
        [tabBarItem.button addTarget:self action:@selector(changeNav:) forControlEvents:UIControlEventTouchUpInside];
        tabBarItem.button.tag=i;
        /*---------------------------------TabBarItem 文字------------------------------------------------*/
        switch (i) {
            case 0:
            {
                tabBarItem.textLabel.text=@"发现";
            }
                break;
            case 1:
            {
                tabBarItem.textLabel.text=@"明星";
            }
                break;
            case 2:
            {
                tabBarItem.textLabel.text=@"娱乐圈";
            }
                break;
            case 3:
            {
                tabBarItem.textLabel.text=@"我";
            }
                break;
            default:
                break;
        }
        
        [_tabBarView addSubview:tabBarItem];
        [tabBarItem release];
        
        coordinateX+=80;
    }
    
    
    [self.view addSubview:_tabBarView];
    
}
-(void)dealloc{
    [_tabBarView release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changeNav:(UIButton *)button{
    int tag=button.tag;
    if (selectButton!=button) {
        TabBarItem *selecTabbarItem=(TabBarItem *)[button superview];
        selecTabbarItem.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"selecttabbar_%d",tag+1]];
        selecTabbarItem.textLabel.textColor=[UIColor redColor];
        TabBarItem *olderTabbarItem=(TabBarItem *)[selectButton superview];
        olderTabbarItem.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",selectButton.tag+1]];
        olderTabbarItem.textLabel.textColor=[UIColor darkGrayColor];
        
    }
    
    
    self.selectedIndex=tag;
    selectButton=button;
}

#pragma mark - UINavigationBarDelegate

@end
