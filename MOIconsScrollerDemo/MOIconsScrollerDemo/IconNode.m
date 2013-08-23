//
//  IconNode.m
//  iMusicPlayer
//
//  Created by moath othman on 8/9/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "IconNode.h"
#define dimension 90

@implementation IconNode
-(id)initWithXPoint:(CGFloat)XPoint YPoint:(CGFloat)YPoint tag:(int)tag{
    self = [super init];
    if (self) {
        _frame=CGRectMake(XPoint,YPoint, dimension, dimension);
        _tag=tag;
        _iconArea=[[IconView alloc]initWithFrame:_frame];
    }
    return self;
}

@end
