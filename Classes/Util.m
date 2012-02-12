//
//  Util.m
//  Resume
//
//  Created by capricorn on 12-2-1.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import "Util.h"

static UIColor *SeparatorColor;

@implementation Util

+ (void)initialize {
	if (SeparatorColor == nil) {
		SeparatorColor = [[UIColor alloc] initWithRed:31/255.0f green:73/255.0f blue:125/255.0f alpha:1.0f];
	}
}

+ (CGFloat)computeHeight4Text:(NSString *)text withWidth:(CGFloat)width andFont:(UIFont *)font {
	CGSize constraint = CGSizeMake(width, CGFLOAT_MAX);	
	CGSize size = [text sizeWithFont:font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];

	return size.height;
}

+ (UIColor *)getSeparatorColor {
	return SeparatorColor;
}

@end
