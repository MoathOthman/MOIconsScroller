//
//  IconsScroller.m
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "IconsScroller.h"
#import "IconView.h"
#import "iconsLayoutLL.h"
@implementation IconsScroller

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
        [self addNewIcon:self withName:[notification object]];
        
    }else  if ([notification.name isEqualToString:iconTappedNotification]) {
        if (_iconDelegate &&[_iconDelegate respondsToSelector:@selector(iconView:didTappedAtIndex:)]) {
            [_iconDelegate iconView:[notification object] didTappedAtIndex:1];
        }
    }
    
}
-(void)addNewIcon:(IconsScroller*)scroller withName:(NSString*)name{
    NSLog(@"number of icons is %i",[_dataSource numberOfIcons]);
    
    FolderIconView *_iconView=[[FolderIconView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
    [_iconView setBackgroundColor:[UIColor greenColor]];
    _iconView.titleLAbel.text=name;
    [scroller performSelector:@selector(addIcon:) withObject:_iconView afterDelay:1];
    
}
 -(void)addIcon:(FolderIconView*)icon{
    
    [_layoutLL addAnode];
     
      [self setContentSize:CGSizeMake(320, _layoutLL->lastNode.frame.origin.y+_layoutLL->lastNode.frame.size.height)];
     
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
    _layoutLL =[[iconsLayoutLL alloc]initWithScrollerSize:self.bounds.size ];
    [_layoutLL insertFirstNode];
      //for first Time
     for (int i=0; i<_numberOfNodes; i++ ) {
         IconNode *currentNode=[_layoutLL getNodeWithTag:i];
         currentNode.iconArea = [self createNewIconWithFrame:_layoutLL ];         
         [self insertSubview:currentNode.iconArea  atIndex:currentNode.tag];
         if (i!=(_numberOfNodes-1)) {
             [_layoutLL addAnode];
         }
    }
     
    return 1;
}

-(void)print{
    [_layoutLL printOutLL];
}
@end
