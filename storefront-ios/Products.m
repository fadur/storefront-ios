//
//  Products.m
//  Unisport-iOs
//
//  Created by Feisal Adur on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Products.h"
#import "UNIItem.h"

@implementation Products
@synthesize productItems;
@synthesize delegate;

-(void)getResource:(NSString *)uri
{
    payload = [[NSMutableArray alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:uri];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
    
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSError* error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    for (NSDictionary *p in [json objectForKey:@"products"]) {
        [ payload addObject:p];
    }
    
    
    //NSLog(@"%@", payload);

}

-(void)processSuccessfull{
    [[self delegate] processSuccessful:YES];

}

-(void)connectionDidFinishLoading:(NSConnection *)connection{
    self.productItems = [[NSMutableArray alloc] init];
    self.productItems = payload;
    [self processSuccessfull];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error);

}


@end
