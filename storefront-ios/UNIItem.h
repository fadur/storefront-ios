//
//  UNIItem.h
//  Unisport-iOs
//
//  Created by Feisal Adur on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UNIAsyncImage.h"

@protocol ItemComplete <NSObject>

@required
-(void)processImageComplete:(BOOL)suceess;

@end

@interface UNIItem : NSObject <ImageLoaded>
{
    NSString *productId;
    NSString *productName;
    NSString *productPrice;
    NSString *expectedDelivery;
    NSArray *availableSizes;
    UIImage *img;
    UNIAsyncImage *async;
    id <ItemComplete> delegate;
}

@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *productDescription;
@property (nonatomic, copy) NSString *productPrice;
@property (nonatomic, copy) NSString *expectedDelivery;
@property (nonatomic, copy) NSArray *availableSizes;
@property (nonatomic, copy) UIImage *Image;
@property (strong, nonatomic) id delegate;

-(id)initWithDict:(NSDictionary *)obj;
-(void)productImage;



@end
