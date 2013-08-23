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
@interface IconsScroller : UIScrollView<IconsScrollerDataSource,IconsScrollerDelegate>{
    iconsLayoutLL *_layoutLL;

}
@property(nonatomic,assign)int numberOfNodes;
@property(assign,nonatomic)id<IconsScrollerDataSource>dataSource;
@property(assign,nonatomic)id<IconsScrollerDelegate>iconDelegate;

-(void)insertIcon:(UIView*)icon atIndex:(int)i;

- (int)AddingIcons;
-(void)addIcon:(UIView*)icon;
-(void)print;


@end
