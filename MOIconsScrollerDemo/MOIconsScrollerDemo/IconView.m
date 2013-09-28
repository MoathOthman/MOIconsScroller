 
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

#import "IconView.h"


@interface IconView ()
@property(strong)UIButton*deleteBUtton;
@end
@implementation IconView


#define DeleteButtonFrame CGRectMake( 5, 0, self.bounds.size.width-10, 30)
#define ZeroFrame CGRectMake(  5, 0, self.bounds.size.width-10, 0)
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
