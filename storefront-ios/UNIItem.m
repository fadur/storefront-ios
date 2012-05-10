//
//  UNIItem.m
//  Unisport-iOs
//
//  Created by Feisal Adur on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNIItem.h"

@implementation UNIItem
@synthesize productId, productName, productPrice, productDescription, availableSizes, expectedDelivery, Image;
@synthesize delegate;

-(id)initWithDict:(NSDictionary *)obj
{
 
    self = [super init];
    if (self) {
        async = [[UNIAsyncImage alloc] init];
        UIImageView *imgView = [[UIImageView alloc] init];
        [imgView setImage:nil];
        [async setDelegate:self];
        [self setProductId:[obj objectForKey:@"id"]];
        [self setProductName:[obj objectForKey:@"name"]];
        [self setProductPrice:[obj objectForKey:@"price"]];
        [self setExpectedDelivery:[obj objectForKey:@"delivery_id"]];
        [self setAvailableSizes: nil];
        [self productImage];
    }
    
    return self;
}
-(void)processImageLoaded:(BOOL)success{
    if (async.img != NULL) {
        [self setImage: async.img];
        [self processImageComplete:YES];
    }
    
}

-(void)processImageComplete:(BOOL)suceess{
    [[self delegate] processImageComplete:YES];

}

-(void)productImage{

    NSString *src = [[NSString alloc] initWithString:@"http://s3-eu-west-1.amazonaws.com/product-img/"];
    NSString *extension = [[NSString alloc] initWithString:@"_maxi_0.jpg"];
    NSString *uri = [[NSString alloc] initWithFormat:@"%@%@%@",src, productId, extension];
    NSURL *url = [NSURL URLWithString:uri];
    [async ImageWithUri:url];
    
    
    
    
}

@end
