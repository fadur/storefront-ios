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
@synthesize path = _path;

-(id)init{
    self = [super init];
    if (self) {
        self.path = [[NSIndexPath alloc] init];
    }
    
    return self;
}


-(void)ImageWithUri:(NSURL *)uri withIndexPath:(NSIndexPath *)indexPath{
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:uri];
    connect = [[NSURLConnection alloc] initWithRequest:request  delegate:self];
    [connect start];
    _path = indexPath;
    
    

}

-(void)processImageLoaded:(BOOL)success{
    [[self delegate] processImageLoaded:YES];
    

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    UIImage *payLoadimg = [[UIImage alloc] initWithData:data];
    self.img = payLoadimg;
    NSLog(@"%@", _path);
    [self processImageLoaded:YES];

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
    
}
@end
