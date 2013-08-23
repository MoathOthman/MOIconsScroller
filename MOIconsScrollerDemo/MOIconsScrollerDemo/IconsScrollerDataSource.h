//
//  IconsScrollerDataSource.h
//  iMusicPlayer
//
//  Created by moath othman on 8/14/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

@class FolderIconView;
@class IconView;
@protocol MOIconsScrollerDataSource <NSObject>
@required
-(NSInteger)numberOfIcons;
-(NSInteger)MaxumberOfIconsInEachRow;
-(FolderIconView*)viewForIconAtIndex:(int)index;
 @end
@protocol MOIconsScrollerDelegate <NSObject>
@required
 -(void)iconView:(IconView* )iconView didTappedAtIndex:(NSInteger)index;
@end
