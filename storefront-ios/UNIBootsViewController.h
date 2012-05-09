//
//  UNIBootsViewController.h
//  storefront-ios
//
//  Created by Feisal Adur on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Products.h"
#import "UNIItem.h"
#import "UNIAsyncImage.h"

@interface UNIBootsViewController : UITableViewController <PayloadComplete, ImageLoaded, UITableViewDelegate, UITableViewDataSource>
{

    NSMutableArray *objects;
    Products *storefront;
    UNIItem *productItem;
    UNIAsyncImage *async;
    UIImage *img;
    NSIndexPath *path;
}


@property (weak, nonatomic) IBOutlet UITableView *table;

-(void)fetchData;

@end
