//
//  IconsScroller+remover.m
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "IconsScroller+remover.h"
#import "IconView.h"
#import "iconsLayoutLL.h"
@implementation MOIconsScroller (remover)
 
 - (CGRect)SearchAndRemove:(NSNumber *)index {
    static CGRect preRect;
     //Modify the scroller size
     [self setContentSize:CGSizeMake(self.frame.size.width, _layoutLL->lastNode.prev.frame.origin.y+_layoutLL->lastNode.prev.frame.size.height)];

    [self.subviews enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        
        if ([view respondsToSelector:@selector(ViewIndex)]) {
            IconView *icon=(IconView*)view;
            if (icon.tag==index.intValue) {
                [_layoutLL deleteWithTag:icon.tag];

                [icon removeFromSuperview];
            }else if (icon.tag>index.intValue){
                //SWAPViews
                IconNode*currentNode=[_layoutLL getNodeWithTag:icon.tag];
                icon.frame=currentNode.prev.frame  ;
                 icon.tag-=1;
                [self insertSubview:icon atIndex:idx-1];
                
            }
        }
        
    }];
     
     [_layoutLL deleteLast];

    return preRect;
}

-(void)removeIconAtIndex:(NSNumber*)index{
    [UIView animateWithDuration:.25 animations:^{
        
        CGRect    preRect = [self SearchAndRemove:index];
#pragma unused(preRect)
    }];
 }
@end
