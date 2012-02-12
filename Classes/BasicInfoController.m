    //
//  BasicInfoController.m
//  Resume
//
//  Created by capricorn on 12-1-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BasicInfoController.h"
#import "Util.h"

@interface BasicInfoController ()
- (void)setUpViews;
@end

@implementation BasicInfoController

@synthesize emailLink = _emailLink;
@synthesize skillDetails = _skillDetails;

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.emailLink = nil;
	self.skillDetails = nil;
}

- (void)dealloc {
	[_emailLink release];
	[_skillDetails release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark View presentation

- (void)setUpViews {	
	UILabel *label = self.skillDetails;	
	
	NSString *skillText = NSLocalizedString(@"BS_Skill", nil);
	label.text = skillText;
	
	const CGFloat labelHeight = [Util computeHeight4Text:skillText withWidth:label.bounds.size.width andFont:label.font];
	label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, labelHeight);
	
	UIScrollView *view = (UIScrollView *)self.view;
	CGFloat height = view.bounds.size.height + labelHeight + 10;
	view.contentSize = CGSizeMake(kContainerWidth, height);
	
	_emailLink.font = [UIFont systemFontOfSize:15];
}	

#pragma mark -
#pragma mark ChildContent delegate

- (NSString *)getTitleText {
	return NSLocalizedString(@"BS_Title", nil);
}

@end
