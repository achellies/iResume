//
//  RootViewController.h
//  Resume
//
//  Created by capricorn on 12-1-9.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat kContainerWidth = 320.0f;
static const CGFloat kContainerHeight = 416.0f;

@interface RootViewController : UIViewController <UIScrollViewDelegate> {
	NSMutableArray *_controllers;
	
	UINavigationBar *_navigationBar;
	
	UINavigationItem *_titleItem;
	
	UIPageControl *_pageControl;
	
	UIScrollView *_scrollView;
	
	NSUInteger _currentPage;		
}

@property (nonatomic, retain) NSMutableArray *controllers;

@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UINavigationItem *titleItem;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end

@protocol ChildContent

- (NSString *)getTitleText;

@end

