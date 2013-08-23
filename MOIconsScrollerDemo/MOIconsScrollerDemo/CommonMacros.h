//
//  CommonMacros.h
//  iMusicPlayer
//
//  Created by moath othman on 8/17/13.
//  Copyright (c) 2013 moath othman. All rights reserved.
//

#ifndef iMusicPlayer_CommonMacros_h
#define iMusicPlayer_CommonMacros_h


#define iconTappedNotification @"iconTapped"
#define iconDeletedNotification @"IconDeleted"
#define AddNewIconNotification @"AddNewIconNotification"
#define CURRENT_PLAY_LIST_NAME @"currentPLayListName"

#define iosVersion  [[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0]intValue]



#define IS_IPHONE ( [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] )
#define IS_IPOD   ( [[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"])
#define IS_HEIGHT_GTE_568 [[UIScreen mainScreen ] bounds].size.height >= 568.0f
#define IS_IPHONE_5 ( IS_IPHONE && IS_HEIGHT_GTE_568 )

#define recordedAudioFilesDir [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/recordedSounds"]
#define jsonFilesDirectory    [NSHomeDirectory() stringByAppendingPathComponent:@"Library/jsonPages"]

 
 
#define SETUSERDEFAULTS(X,Y) { [[NSUserDefaults standardUserDefaults]setObject:X forKey:Y ];}
#define GETUSERDEFAULTFORKEY(X) [[NSUserDefaults standardUserDefaults]objectForKey:X]


#define currentLanguageBundle [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[[NSLocale preferredLanguages] objectAtIndex:0] ofType:@"lproj"]]
#define NSlocalizehack(X) NSLocalizedStringFromTableInBundle(X, nil, currentLanguageBundle, @"")

#endif
