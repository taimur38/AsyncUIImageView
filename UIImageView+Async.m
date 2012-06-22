//
//  UIImageView+Async.m
//  Clossit
//
//  Created by Lion User on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImageView+Async.h"

@implementation UIImageView (Async)

+ (UIImageView*) imageWithUrl:(NSString *)url Frame:(CGRect)frame
{
    UIImageView* res = [[UIImageView alloc] initWithFrame:frame];
    [res imageWithUrl:url];
    return res;
}

- (void) imageWithUrl:(NSString *)url
{
    UIActivityIndicatorView* spinny = [[UIActivityIndicatorView alloc] init];
    [spinny setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    spinny.hidesWhenStopped = TRUE;
    spinny.color = [UIColor blackColor];
    [self addSubview:spinny];
    [self bringSubviewToFront:spinny];
    [spinny startAnimating];
    
    NSURLRequest* request = [NSURLRequest 
                             requestWithURL:[NSURL URLWithString:url] 
                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                             timeoutInterval:30.0];
    
    [NSURLConnection sendAsynchronousRequest:request 
                     queue:[NSOperationQueue mainQueue] 
                     completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         [spinny stopAnimating];
         UIImage* hdImage = [UIImage imageWithData:data];
         [self setImage:hdImage];
     }];

}

@end
