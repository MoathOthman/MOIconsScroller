//
//  ViewController.m
//  MOIconsScrollerDemo
//
//  Created by moath othman on 8/23/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
     NSArray *imagesList;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    /*set delegate and datasource ..very necessary*/
    _iconScroller.dataSource=self;
    _iconScroller.iconDelegate=self;
    /*set titles and images names*/
     imagesList=@[@"something1",@"something2",@"vancouver",@"violin",@"crazygirl",@"waterSpout",@"mountain",@"likeme",@"sweet",@"dontCare",@"snow"];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iconTappedNotificationRecieved:) name:iconDeletedNotification object:nil];
    
    
}
-(IBAction )AddANewIcon:(UIBarButtonItem*)sender{
    static int x=1;
    NSString*name;
    name=[NSString stringWithFormat:@"icon#%i",x];
    x++;
    [[NSNotificationCenter defaultCenter]postNotificationName:AddNewIconNotification object:name];
}

-(void)iconTappedNotificationRecieved:(NSNotification*)notification{
    if ([[notification name]isEqualToString:iconDeletedNotification]) {
        [_iconScroller performSelector:@selector(removeIconAtIndex:) withObject: [notification object]  afterDelay:0];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iconsControllerDataSource
-(NSInteger)numberOfIcons{
    return imagesList.count;
}
-(NSInteger)MaxumberOfIconsInEachRow{
    return 3;
}

-(FolderIconView *)viewForIconAtIndex:(int)index{
    
    FolderIconView *_iconView=[[FolderIconView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    _iconView.tag   =index;
    
    _iconView.titleLAbel.text=imagesList[index];
    
    _iconView.iconImageView.image= [UIImage imageNamed:imagesList[index]];
    return _iconView;
}
-(void)iconView:(IconView *)iconView didTappedAtIndex:(NSInteger)index{
    NSLog(@"in did tapp iconView title is %@",iconView.folderIconView.titleLAbel.text);
    [[NSUserDefaults standardUserDefaults]setValue:iconView.folderIconView.titleLAbel.text forKey:CURRENT_PLAY_LIST_NAME];
    
}

@end
