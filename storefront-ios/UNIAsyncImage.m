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
@synthesize imView;

-(id)init{
    self = [super init];
    if (self) {
        //_path = [[NSIndexPath alloc] init];
    }
    
    return self;
}


-(void)ImageWithUri:(NSURL *)uri atThisView:(UIImageView *)imgView{
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:uri];
    connect = [[NSURLConnection alloc] initWithRequest:request  delegate:self];
    [connect start];
    self.imView = imgView; 
    
    

}

-(void)processImageLoaded:(BOOL)success{
    [[self delegate] processImageLoaded:YES];
    

}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    UIImage *payLoadimg = [[UIImage alloc] initWithData:data];
    self.img = payLoadimg;
    [self processImageLoaded:YES];

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
    
}
@end
