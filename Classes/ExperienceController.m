    //
//  ExperienceController.m
//  Resume
//
//  Created by capricorn on 12-1-27.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import "ExperienceController.h"
#import "Util.h"

static const NSInteger kCellLabelTag = 1;
static const NSInteger kCellSeparatorTag = 2;

static NSArray *Experiences;

@implementation ExperienceController

+ (void)initialize {
	Experiences = [[NSArray alloc] initWithObjects:NSLocalizedString(@"EX_Experience0", nil), 
					 NSLocalizedString(@"EX_Experience1", nil), nil];
}

#pragma mark -
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.separatorStyle = NO;
}

#pragma mark -
#pragma mark ChildContent delegate

- (NSString *)getTitleText {
	return NSLocalizedString(@"EX_Title", nil);
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [Experiences count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	UILabel *label;
	UIView *separator;
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		label = [[[UILabel alloc] init] autorelease];
		label.tag = kCellLabelTag;
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.numberOfLines = 0;
		label.font = [UIFont systemFontOfSize:15];
		[cell.contentView addSubview:label];
		
		separator = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, kContainerWidth, 2)] autorelease];
		separator.tag = kCellSeparatorTag;
		separator.backgroundColor = [Util getSeparatorColor];
		[cell.contentView addSubview:separator];
	}
	else {
		label = (UILabel *)[cell.contentView viewWithTag:kCellLabelTag];
		separator = [cell.contentView viewWithTag:kCellSeparatorTag];
	}
	
	CGFloat cellHeight = [tableView rectForRowAtIndexPath:indexPath].size.height;

	label.frame = CGRectMake(20, 10, kContainerWidth - 30, cellHeight - 20);
	label.text = [Experiences objectAtIndex:indexPath.row];
		
	separator.hidden = indexPath.row == 0 ? YES : NO;
	
	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [Util computeHeight4Text:[Experiences objectAtIndex:indexPath.row] 
						  withWidth:kContainerWidth - 30
							andFont:[UIFont systemFontOfSize:15]] + 20;
}

@end
