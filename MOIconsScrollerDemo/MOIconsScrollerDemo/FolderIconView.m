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

#import "FolderIconView.h"
#import <QuartzCore/QuartzCore.h>


@interface FolderIconView ()

@end

@implementation FolderIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self SetupLayout];
    }
    return self;
}

- (UIImageView *)iconButtonSetup {
    UIImageView *iconButton=[[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-20)];
    iconButton.layer.cornerRadius=20;
    iconButton.backgroundColor=[UIColor clearColor];
     [self addSubview:iconButton];
    
        
    return iconButton;
}


-(void)SetupLayout{

    self.layer.borderColor=[UIColor blackColor].CGColor;
    self.backgroundColor=[UIColor clearColor];
    self.layer.cornerRadius=20;
    
    
 
    _iconImageView = [self iconButtonSetup];
    
    
   _titleLAbel=[[UILabel alloc]initWithFrame:CGRectMake(0, _iconImageView.bounds.size.height, self.bounds.size.width, 20)];
    _titleLAbel.backgroundColor=[UIColor clearColor];
    _titleLAbel.textColor=[UIColor blackColor];
    _titleLAbel.textAlignment=NSTextAlignmentCenter;
    _titleLAbel.text=@"shared"    ;
    [_titleLAbel setAdjustsFontSizeToFitWidth:YES];
    
    [self addSubview:_titleLAbel];
    
    
    
}
-(NSString *)description{
    return @"folderIcon";
}
 
@end
