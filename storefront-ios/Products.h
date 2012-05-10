//
//  Products.h
//  Unisport-iOs
//
//  Created by Feisal Adur on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UNIItem;

@protocol PayloadComplete <NSObject>

@required
-(void) processSuccessful:(BOOL)success;

@end
@interface Products : NSObject
{
    id <PayloadComplete> delegate;
    NSMutableArray *payload;
}

@property (nonatomic, strong) id delegate;
-(void)getResource:(NSString *)uri;


@property (nonatomic, copy) NSMutableArray *productItems;

@end
