/*
 The MIT License (MIT)
 
 Copyright (c) 2013 Moath othman
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
