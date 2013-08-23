//
//  IconView.m
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "IconView.h"


@interface IconView ()
@property(strong)UIButton*deleteBUtton;
@end
@implementation IconView


#define DeleteButtonFrame CGRectMake(0, 0, self.bounds.size.width, 30)
#define ZeroFrame CGRectMake(0, 0, self.bounds.size.width, 0)
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGestures];
        [self addADeleteButton];
        
        // Initialization code
    }
    return self;
}
-(void)addADeleteButton{
    _deleteBUtton=[[UIButton alloc]initWithFrame:DeleteButtonFrame];
    [_deleteBUtton setAlpha:0];
    [_deleteBUtton setBackgroundColor:[UIColor redColor]];
    [_deleteBUtton setTitle:NSLocalizedString(@"delete", Nil) forState:UIControlStateNormal];
    [_deleteBUtton addTarget:self action:@selector(deleteButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  
}
-(void)setupGestures{
    
    UITapGestureRecognizer *_tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTappedSigngleTime:)];
    [_tapGesture setNumberOfTapsRequired:1];
    
    [self addGestureRecognizer:_tapGesture];
    
    
    UILongPressGestureRecognizer *_longPressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(ButtonTapped:)];
    
    [self addGestureRecognizer:_longPressGesture];
    
  
    
}
-(void)deleteButtonTapped:(id)sender{
    NSLog(@"delete button Tapped");
    [[NSNotificationCenter defaultCenter]postNotificationName:iconDeletedNotification    object:@(self.tag)];

}
-(void)buttonTappedSigngleTime:(UITapGestureRecognizer*)recognizer{
    NSLog(@"button Tapped");
    
    [[NSNotificationCenter defaultCenter]postNotificationName:iconTappedNotification    object: self ];
    
    if (_delegate && [_delegate respondsToSelector:@selector(iconButton:TappedAtIndex:)]) {
        [_delegate iconButton:self TappedAtIndex:@(self.tag)];
    }
}
-(void)ButtonTapped:(UILongPressGestureRecognizer*)gesture{
    
    if (gesture.state==UIGestureRecognizerStateBegan) {
        NSLog(@"gesture began");
          [self insertSubview:_deleteBUtton atIndex:10];
        [_deleteBUtton setFrame:ZeroFrame];
        [UIView animateWithDuration:.25 animations:^{
            [_deleteBUtton setAlpha:1];

            [_deleteBUtton setFrame:DeleteButtonFrame];
        }];
        
        if (_delegate &&[_delegate respondsToSelector:@selector(iconButton:PressedLonglyAtIndex:)]) {
            [_delegate iconButton:Nil PressedLonglyAtIndex:0];
        }
        
    }
    if (gesture.state==UIGestureRecognizerStateRecognized) {
        NSLog(@"recognized");
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(NSString *)description{
    return @"view index"    ;
}
 

@end
