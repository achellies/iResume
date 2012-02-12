//
//  AboutController.m
//  Resume
//
//  Created by capricorn on 12-2-5.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import "AboutController.h"
#import "AboutTableViewCell.h"

@interface InfoItem : NSObject {
	NSString *_title;
	NSString *_content;
}

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *content;

@end

@implementation InfoItem

@synthesize title = _title, content = _content;

- (id)initWithTitle:(NSString *)title andContent:(NSString *)content {
	self = [super init];
	
    if (self) {
		_title = title;
		_content = content;
	}
	
	return self;
}

@end

static NSArray *Infos;

@implementation AboutController

+ (void)initialize {
	InfoItem *item0 = [[[InfoItem alloc] initWithTitle:NSLocalizedString(@"About_SubTitle0", nil) 
											andContent:NSLocalizedString(@"About_Content0", nil)] autorelease];
	InfoItem *item1 = [[[InfoItem alloc] initWithTitle:NSLocalizedString(@"About_SubTitle1", nil) 
											andContent:NSLocalizedString(@"About_Content1", nil)] autorelease];
	InfoItem *item2 = [[[InfoItem alloc] initWithTitle:NSLocalizedString(@"About_SubTitle2", nil) 
											andContent:NSLocalizedString(@"About_Content2", nil)] autorelease];
	Infos = [[NSArray alloc] initWithObjects:item0, item1, item2, nil];
}

#pragma mark -
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.separatorStyle = NO;
}

#pragma mark -
#pragma mark ChildContent Delegate

- (NSString *)getTitleText {
	return NSLocalizedString(@"About_Title", nil);
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Infos count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    AboutTableViewCell *cell = (AboutTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[AboutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	InfoItem *item = (InfoItem *)[Infos objectAtIndex:indexPath.row];
    cell.titleLabel.text = item.title;
	cell.contentLabel.text = item.content;
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	InfoItem *item = (InfoItem *)[Infos objectAtIndex:indexPath.row];
    return [AboutTableViewCell computeHeight:item.content];
}

@end

