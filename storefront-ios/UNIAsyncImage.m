//
//  UNIAsyncImage.m
//  storefront-ios
//
//  Created by Feisal Adur on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNIAsyncImage.h"

@implementation UNIAsyncImage
@synthesize delegate;
@synthesize img;

-(id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


-(void)ImageWithUri:(NSURL *)uri {
    NSData *data = [[NSData alloc] initWithContentsOfURL:uri];
    img = [[UIImage alloc] initWithData:data];
    [self setImg: img];
    [self processImageLoaded];
    

}

-(void)processImageLoaded{
    [[self delegate] processImageLoaded:YES];
    

}
@end
