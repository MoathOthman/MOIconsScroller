//
//  FolderIconView.m
//  iMusicPlayer
//
//  Created by moath othman on 8/8/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

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
    
    
    [self addSubview:_titleLAbel];
    
    
    
}
-(NSString *)description{
    return @"folderIcon";
}
 
@end
