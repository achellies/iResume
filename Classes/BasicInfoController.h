//
//  BasicInfoController.h
//  Resume
//
//  Created by capricorn on 12-1-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface BasicInfoController : UIViewController <ChildContent> {
	UITextView *_emailLink;
	
	UILabel *_skillDetails;
}

@property (nonatomic, retain) IBOutlet UITextView *emailLink;
@property (nonatomic, retain) IBOutlet UILabel *skillDetails;

@end
