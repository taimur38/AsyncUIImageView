//
//  UIImageView+Async.h
//  Taimur Shah

#import <UIKit/UIKit.h>

@interface UIImageView (Async)

+ (UIImageView*) imageWithUrl:(NSString*)url Frame:(CGRect)frame;

- (void) imageWithUrl:(NSString*)url;

@end
