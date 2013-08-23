//
//  iconsLayoutLL.h
//  iMusicPlayer
//
//  Created by moath othman on 8/9/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//


#import "IconNode.h"
@protocol LLOperations <NSObject>

-(IconNode*)deleteWithTag:(int)tag;
-(void)insertFirstNode;
-(void)addAnode;
 -(void)printOutLL;
-(IconNode*)deleteLast;
-(IconNode*)getNodeWithTag:(int)tag;
@end


@interface iconsLayoutLL : NSObject<LLOperations>{
   @public
     IconNode *firstNode;
     IconNode *lastNode;
    CGSize sizeOFScroller;
    int tagTracker;

    @private
    int lastXpoint;
    int lastYpoint;
    
    
}
- (id)initWithScrollerSize:(CGSize)size;

@end
 