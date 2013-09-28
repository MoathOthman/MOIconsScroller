//
//  IconNode.h
//  iMusicPlayer
//
//  Created by moath othman on 8/9/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//
static float dimension=100;
#pragma unused(dimension)
#import "IconView.h"
@interface IconNode : NSObject
@property(assign)int tag;
@property(strong,readonly)NSString*name;
@property(assign,readonly)CGRect frame;
@property(strong)IconNode *prev ;
@property(strong)IconNode *next ;
@property(strong,nonatomic)IconView *iconArea;

-(id)initWithXPoint:(CGFloat)XPoint YPoint:(CGFloat)YPoint tag:(int)tag;
@end
