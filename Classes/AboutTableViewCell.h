//
//  AboutTableViewCell.h
//  Resume
//
//  Created by capricorn on 12-2-5.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AboutTableViewCell : UITableViewCell {
  @private	
	UILabel *_titleLabel;
	UIView *_separator;
	UILabel *_contentLabel;
}

@property (nonatomic, readonly, retain) UILabel *titleLabel;
@property (nonatomic, readonly, retain) UILabel *contentLabel;

+ (CGFloat)computeHeight:(NSString *)contentText;

@end
