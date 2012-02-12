//
//  Util.h
//  Resume
//
//  Created by capricorn on 12-2-1.
//  Copyright 2012 Capricorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject {

}

+ (CGFloat)computeHeight4Text:(NSString *)text withWidth:(CGFloat)width andFont:(UIFont *)font;
+ (UIColor *)getSeparatorColor;

@end
