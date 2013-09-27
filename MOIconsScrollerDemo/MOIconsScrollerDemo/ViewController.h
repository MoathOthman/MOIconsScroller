//
//  ViewController.h
//  MOIconsScrollerDemo
//
//  Created by moath othman on 8/23/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#import "MOIconsScroller.h"
@interface ViewController : UIViewController<MOIconsScrollerDataSource,MOIconsScrollerDelegate>
@property (weak, nonatomic) IBOutlet MOIconsScroller *iconScroller;
-(IBAction )AddANewIcon:(UIBarButtonItem*)sender;
@end
