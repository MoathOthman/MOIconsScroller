//
//  iconsLayoutLL.m
//  iMusicPlayer
//
//  Created by moath othman on 8/9/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "iconsLayoutLL.h"
#define dimension 90
@implementation iconsLayoutLL
- (id)initWithScrollerSize:(CGSize)size
{
    self = [super init];
    if (self) {
        lastNode=nil;
        firstNode=nil;
        sizeOFScroller=size;
    }
    return self;
}
-(BOOL)isEmpty{
    return firstNode==nil;
}
void desplay( iconsLayoutLL *d){
    NSLog(@"current node data is {%i,%i,%i}",d->lastXpoint,d->lastYpoint,d->tagTracker);
}
-(void)insertFirstNode{
    lastXpoint=15;
    lastYpoint=15;
    tagTracker=0;
    
    [self insertFirstWithTag:tagTracker XPoint:lastXpoint YPoint:lastYpoint];
   // desplay(self);
}

-(void)addAnode{
    
    if ((lastXpoint>=225)) {
   //we hit the end of the row
        lastXpoint=15;
        lastYpoint+=105;
        
    }else{
        //same line
        lastXpoint+=105;
        
    }
    tagTracker+=1;
    
    [self insertLastWithTag:tagTracker XPoint:lastXpoint YPoint:lastYpoint];

  //  desplay(self);
}
 
-(void)insertFirstWithTag:(int)tag XPoint:(CGFloat)xpoint YPoint:(CGFloat)ypoint{
    IconNode *newNode=[[IconNode alloc]initWithXPoint:xpoint YPoint:ypoint tag:tag];
    
    if ([self isEmpty]) {
        lastNode=newNode;
    }else{
        firstNode.prev=newNode;
    }
    newNode.next=firstNode;
    firstNode=newNode;
    
}
-(void)insertLastWithTag:(int)tag XPoint:(CGFloat)xpoint YPoint:(CGFloat)ypoint{
    IconNode *newNode=[[IconNode alloc]initWithXPoint:xpoint YPoint:ypoint tag:tag];
    
    if ([self isEmpty]) {
        firstNode=newNode;
    }else{
        lastNode.next=newNode;
        newNode.prev=lastNode;
    }
    lastNode=newNode;
    
}
-(IconNode*)deleteFirst{
    IconNode *temp = firstNode;
    if (firstNode.next == NULL){
        lastNode = NULL;
    }else{
        firstNode.next.prev = NULL;
    }
    firstNode = firstNode.next;
    return temp;
}
-(IconNode*)deleteLast{
    IconNode *temp = lastNode;
    if (firstNode.next == NULL){
        firstNode = NULL;
    }else{
        lastNode.prev.next = NULL;
    }
    lastNode = lastNode.prev;
    
    

    if (lastXpoint>=15 ) {//\\x=120
        //we hit the end of the row
         lastXpoint-=105;

    }else  {
        
        lastXpoint+=210;
        lastYpoint-=105;
        
    }
    tagTracker-=1;

    return temp;
}

-(IconNode*)getNodeWithTag:(int)tag{
    IconNode *current =firstNode;
    
    while (current.tag!=tag) {
        current=current.next;
        if (current==NULL) {
            return NULL;
        }
    }
    return current;
}
-(IconNode*)deleteWithTag:(int)tag{
    NSLog(@"tag to be deleted %i",tag);
    IconNode *current =firstNode;
    
    while (current.tag!=tag) {
        current=current.next;
        if (current==NULL) {
            return NULL;
        }
    }
    while (current!=lastNode) {
        current=current.next;
    }
    
    
//    desplay(self);
    return current;
}


-(void)printOutLL{
    IconNode *current =lastNode;
    NSLog(@"\n*******LOG LL*******\n");
    while (current ) {
        
        NSLog(@"current node frame is %@,,%i",NSStringFromCGRect(current.frame),current.tag);
        current=current.prev;
         
    }
    NSLog(@"\n*******LOG END*******\n");

}

 @end
