//
//  Common.h
//  msnbc
//
//  Created by Gavin Miller on 12-03-19.
//  Copyright (c) 2012 RandomType. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define UIAppDelegate                   ((AppDelegate *)[UIApplication sharedApplication].delegate)