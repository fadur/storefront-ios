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
        //_path = [[NSIndexPath alloc] init];
    }
    
    return self;
}


-(void)ImageWithUri:(NSURL *)uri {

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:uri];
    connect = [[NSURLConnection alloc] initWithRequest:request  delegate:self];
    [connect start];

    
    

}

-(void)processImageLoaded:(BOOL)success{
    [[self delegate] processImageLoaded:YES];
    

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSData *d = [[NSData alloc] initWithData:data];
    UIImage *payLoadimg = [[UIImage alloc] initWithData:d];
    //if (payLoadimg != NULL) {
           // self.img = payLoadimg;
           // [self processImageLoaded:YES];
    //}
    NSLog(@"%@", payLoadimg);
    

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
    
}
@end
