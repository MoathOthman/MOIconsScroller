//
//  IconsScroller.m
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "MOIconsScroller.h"
@implementation MOIconsScroller

- (id)init
{
    self = [super init];
    if (self) {
         
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _numberOfNodes=[_dataSource numberOfIcons];
        _numberOfNodesInEachRow=[_dataSource MaxumberOfIconsInEachRow];
        
        [self AddingIcons];
        
        for (int i=0; i<_numberOfNodes; i++) {
            FolderIconView *_iconView=[_dataSource viewForIconAtIndex:i];
            
            [self insertIcon :_iconView atIndex:i];
        }
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iconTappedNotificationRecieved:) name:iconTappedNotification object:nil];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iconTappedNotificationRecieved:) name:AddNewIconNotification   object:nil];
    });
  

}
-(void)iconTappedNotificationRecieved:(NSNotification*)notification{
    NSLog(@"tap icon notification recieved with tag %@,notoficatio %@",[notification object], notification  );
    
    if ([notification.name isEqualToString:AddNewIconNotification]){
        [self addNewIcon:self withView:[notification object]];
        
    }else  if ([notification.name isEqualToString:iconTappedNotification]) {
        if (_iconDelegate &&[_iconDelegate respondsToSelector:@selector(iconView:didTappedAtIndex:)]) {
            [_iconDelegate iconView:[notification object] didTappedAtIndex:1];
        }
    }
    
}
-(void)addNewIcon:(MOIconsScroller*)scroller withView:(FolderIconView*)_View{
    
    [scroller performSelector:@selector(addIcon:) withObject:_View afterDelay:0];
    
}
 -(void)addIcon:(FolderIconView*)icon{
    
    [_layoutLL addAnode];
     
     
     NSLog(@"sscroller width is %f",self.frame.size.width);

      [self setContentSize:CGSizeMake(self.frame.size.width, _layoutLL->lastNode.frame.origin.y+_layoutLL->lastNode.frame.size.height)];
     
     if (self.contentSize.height>self.bounds.size.height) {
         CGPoint bottomOffset = CGPointMake(0, self.contentSize.height - self.bounds.size.height);
         [self setContentOffset:bottomOffset animated:YES]; 
     }
          
     IconNode *lastNode=_layoutLL->lastNode;

     lastNode.iconArea = [self createNewIconWithFrame:_layoutLL  ];
     lastNode.iconArea.folderIconView=icon;
     [lastNode.iconArea addSubview:icon];
     
    [self insertSubview:lastNode.iconArea  atIndex:lastNode.tag+1];
    
 
}
-(void)insertIcon:(FolderIconView *)icon atIndex:(int)i{
 
    for (UIView *view in self.subviews) {
            if ([view respondsToSelector:@selector(ViewIndex)]) {
                IconView*xview=(IconView*)view;
            if (xview.tag==i ) {
                [xview addSubview:icon ];
                xview.folderIconView=icon;

            }
        }
    }
    
 }

 
- (IconView *)createNewIconWithFrame:(iconsLayoutLL*)Layout
{
    IconNode *currentNode=_layoutLL->lastNode;
    currentNode.iconArea.tag=Layout->tagTracker;
    [currentNode.iconArea setBackgroundColor:[UIColor clearColor]];
    return currentNode.iconArea;
}

- (int)AddingIcons
{
    _layoutLL =[[iconsLayoutLL alloc]initWithScrollerSize:self.bounds.size MaxNumberOFNodesInEachRow:_numberOfNodesInEachRow ];
    [_layoutLL insertFirstNode ];
      //for first Time
     for (int i=0; i<_numberOfNodes; i++ ) {
         IconNode *currentNode=[_layoutLL getNodeWithTag:i];
         currentNode.iconArea = [self createNewIconWithFrame:_layoutLL ];         
         [self insertSubview:currentNode.iconArea  atIndex:currentNode.tag];
         if (i!=(_numberOfNodes-1)) {
             [_layoutLL addAnode];
         }
    }
    NSLog(@"sscroller width is %f",self.frame.size.width);

    [self setContentSize:CGSizeMake(self.frame.size.width, _layoutLL->lastNode.frame.origin.y+_layoutLL->lastNode.frame.size.height)];

    return 1;
}

-(void)print{
    [_layoutLL printOutLL];
}
@end
