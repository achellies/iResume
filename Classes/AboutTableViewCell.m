//
//  AboutTableViewCell.m
//  Resume
//
//  Created by capricorn on 12-2-5.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import "AboutTableViewCell.h"
#import "RootViewController.h"
#import "Util.h"

static const CGFloat kFixedPartHeight = 34.0f;
static const CGFloat kMarginBottom = 15.0f;

@implementation AboutTableViewCell

@synthesize titleLabel = _titleLabel, contentLabel = _contentLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIView *contentView = self.contentView;
		
		_titleLabel = [[[UILabel alloc] init] autorelease];
		_titleLabel.font = [UIFont systemFontOfSize:17];
		[contentView addSubview:_titleLabel];
		
		_separator = [[[UIView alloc] init] autorelease];
        _separator.backgroundColor = [Util getSeparatorColor];
		[contentView addSubview:_separator];
		
		_contentLabel = [[[UILabel alloc] init] autorelease];
		_contentLabel.font = [UIFont systemFontOfSize:15];
		_contentLabel.lineBreakMode = UILineBreakModeWordWrap;
		_contentLabel.numberOfLines = 0;
		[contentView addSubview:_contentLabel];
	}
	
	return self;
}

- (void)layoutSubviews {	
    [super layoutSubviews];
	
	// getting the cell size
    CGRect contentRect = self.contentView.bounds;
	
	// In this example we will never be editing, but this illustrates the appropriate pattern
    if (!self.editing) {
		CGRect frame;
		
		frame = CGRectMake(0, 0, kContainerWidth, 21);
		_titleLabel.frame = frame;
		
		frame = CGRectMake(0, 24, kContainerWidth, 2);
		_separator.frame = frame;
		
		frame = CGRectMake(20, 34, kContainerWidth - 30, 
						   contentRect.size.height - kFixedPartHeight - kMarginBottom);
		_contentLabel.frame = frame;
	}
}

- (void)dealloc {
    [super dealloc];
	
	[_titleLabel release];
	[_separator release];
	[_contentLabel release];
}

+ (CGFloat)computeHeight:(NSString *)contentText {
	return kFixedPartHeight + kMarginBottom + [Util computeHeight4Text:contentText 
															 withWidth:(kContainerWidth - 30) 
															   andFont:[UIFont systemFontOfSize:15]];
}

@end
