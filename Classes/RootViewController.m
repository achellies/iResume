//
//  RootViewController.m
//  Resume
//
//  Created by capricorn on 12-1-9.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "BasicInfoController.h"
#import "ExperienceController.h"
#import "AboutController.h"

static NSArray *childControllClasses;

@interface RootViewController ()
- (void)setUpViews;
- (void)showPageInfo:(NSUInteger)page;
+ (void)add:(UIView*)container childView:(UIView*)view withFrame:(CGRect)frame;
@end


@implementation RootViewController

@synthesize controllers = _controllers;
@synthesize navigationBar = _navigationBar, titleItem = _titleItem, scrollView = _scrollView;

+ (void)initialize {
    if (childControllClasses == nil) {
        childControllClasses = [[NSArray alloc] initWithObjects:[BasicInfoController class], 
								[ExperienceController class], [AboutController class], nil];
    }
}

+ (void)add:(UIView*)container childView:(UIView*)view withFrame:(CGRect)frame {
	view.frame = frame;
	[container addSubview:view];
}

#pragma mark -
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setUpViews];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	self.controllers = nil;
	
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.navigationBar = nil;
	self.titleItem = nil;
	self.scrollView = nil;
}

- (void)dealloc {
	[_controllers release];
	
	[_navigationBar release];
	[_titleItem release];
	[_scrollView release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark View presentation

- (void)setUpViews {		
	const NSUInteger childCount = [childControllClasses count];
	
	UIScrollView *scrollView = (UIScrollView *)self.scrollView;
	scrollView.delegate = self;
	scrollView.contentSize = CGSizeMake(kContainerWidth * childCount, kContainerHeight);
	
	NSMutableArray *controllerArray = [[[NSMutableArray alloc] init] autorelease];
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	for (int i = 0; i < childCount; i++) {
		Class class = (Class)[childControllClasses objectAtIndex:i];
		UIViewController *controller = [[[class alloc] init] autorelease];
		[controllerArray addObject:controller];
		
		[RootViewController add:scrollView 
					  childView:controller.view 
					  withFrame:CGRectMake(i * kContainerWidth, 0, kContainerWidth, kContainerHeight)];
	}
	
	[pool drain];
	
	self.controllers = controllerArray;
	
	UIPageControl *pageControl = _pageControl = [[[UIPageControl alloc] init] autorelease];
	pageControl.frame = CGRectMake(0, 20, kContainerWidth, 36);
	pageControl.numberOfPages = childCount;
	pageControl.currentPage = _currentPage;
	pageControl.userInteractionEnabled = NO;
	[self.view addSubview:pageControl];
	
	[self showPageInfo:_currentPage];
}

- (void)showPageInfo:(NSUInteger)page {
	NSString *titleText = [[_controllers objectAtIndex:page] getTitleText];
	[_titleItem setTitle:titleText];
}

#pragma mark -
#pragma mark UIScrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	const NSUInteger page = scrollView.contentOffset.x / kContainerWidth;
	if (page != _currentPage) {
		_currentPage = page;
		_pageControl.currentPage = page;
		[self showPageInfo:page];
	}
}

@end
