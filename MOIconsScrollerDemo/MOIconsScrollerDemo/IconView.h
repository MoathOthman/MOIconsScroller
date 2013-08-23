//
//  IconView.h
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

 #import "FolderIconView.h"
@protocol IconViewDelegate <NSObject>
@optional
-(void)iconButton:(UIView*)button PressedLonglyAtIndex:(NSNumber*)index;
-(void)iconButton:(UIView*)button TappedAtIndex:(NSNumber*)index;
@end



@interface IconView : UIView<IconViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)NSString *ViewIndex;
@property(strong)FolderIconView*folderIconView;
@property(assign)id<IconViewDelegate>delegate;

@end
