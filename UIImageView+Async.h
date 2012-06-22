//
//  UIImageView+Async.h
//  Clossit
//
//  Created by Lion User on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Async)

+ (UIImageView*) imageWithUrl:(NSString*)url Frame:(CGRect)frame;

- (void) imageWithUrl:(NSString*)url;

@end
