//
//  ResumeAppDelegate.h
//  Resume
//
//  Created by capricorn on 12-1-9.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface ResumeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	RootViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

