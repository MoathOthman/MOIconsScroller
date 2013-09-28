//
//  iconsLayoutLL.m
//  iMusicPlayer
//
//  Created by moath othman on 8/9/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "iconsLayoutLL.h"


#define nodesnumber 1
@implementation iconsLayoutLL{
    int maxNumberOfNodesInEachRow;
    int startPoint;
    int widthOfEachLine;
    int xCounter;
}
- (id)initWithScrollerSize:(CGSize)size MaxNumberOFNodesInEachRow:(int)maxNumberOfNodes
{
    self = [super init];
    if (self) {
        lastNode=nil;
        firstNode=nil;
        sizeOFScroller=size;
        maxNumberOfNodesInEachRow=maxNumberOfNodes;
    }
    return self;
}
-(BOOL)isEmpty{
    return firstNode==nil;
}
void desplay( iconsLayoutLL *d){
    NSLog(@"current node data is {%i,%i,%i}",d->lastXpoint,d->lastYpoint,d->tagTracker);
}
-(void)insertFirstNode {
    
    widthOfEachLine=sizeOFScroller.width    ;
    
    startPoint=(widthOfEachLine-maxNumberOfNodesInEachRow*(dimension) )/2 +5;
    
    NSLog(@"Start Point %i",startPoint);

    lastXpoint= startPoint;
    lastYpoint=15;
    tagTracker=0;
    xCounter=1;
    [self insertFirstWithTag:tagTracker XPoint:lastXpoint YPoint:lastYpoint];
   // desplay(self);
}

-(void)addAnode{
    
    if (xCounter>=maxNumberOfNodesInEachRow) {
   //we hit the end of the row
        lastXpoint=startPoint;
        lastYpoint+=105;
        xCounter=1;
    }else{
        //same line
        lastXpoint+=95;
        xCounter++;
    }
    tagTracker+=1;
    
    [self insertLastWithTag:tagTracker XPoint:lastXpoint YPoint:lastYpoint];

  //  desplay(self);
}
-(IconNode*)deleteLast{
    IconNode *temp = lastNode;
    
    if (firstNode.next == NULL){
        firstNode = NULL;
    }else{
        lastNode.prev.next = NULL;
    }
    lastNode = lastNode.prev;
    
    if (lastXpoint>=startPoint ) {//\\x=120
        //we hit the end of the row
        lastXpoint-=95;
        xCounter --;
    }else  {
        
        lastXpoint+=210;
        lastYpoint-=105;
        
    }
    tagTracker-=1;
    
    return temp;
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
