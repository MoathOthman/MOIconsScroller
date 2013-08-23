//
//  IconsScroller.h
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//
#import "IconView.h"
#import "IconsScrollerDataSource.h"
@class iconsLayoutLL;
@interface MOIconsScroller : UIScrollView<MOIconsScrollerDataSource,MOIconsScrollerDelegate>{
    iconsLayoutLL *_layoutLL;

}
@property(nonatomic,assign)int numberOfNodes;
@property(assign,nonatomic)id<MOIconsScrollerDataSource>dataSource;
@property(assign,nonatomic)id<MOIconsScrollerDelegate>iconDelegate;

-(void)insertIcon:(UIView*)icon atIndex:(int)i;

- (int)AddingIcons;
-(void)addIcon:(UIView*)icon;
-(void)print;


@end
