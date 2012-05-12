//
//  UNIItemViewController.m
//  storefront-ios
//
//  Created by Feisal Adur on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNIItemViewController.h"


@implementation UNIItemViewController
@synthesize image = _image;
@synthesize name = _name;
@synthesize thisItem = _thisItem;


-(id)initWithItem:(UNIItem *)item{
    
    self = [super init];
    if (self) {}
   
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = _thisItem.productName;
    [_name setText:_thisItem.productName];
    
    NSString *src = [[NSString alloc] initWithString:@"http://s3-eu-west-1.amazonaws.com/product-img/"];
    NSString *extension = [[NSString alloc] initWithString:@"_maxi_0.jpg"];
    NSString *uri = [[NSString alloc] initWithFormat:@"%@%@%@",src, _thisItem.productId, extension];
    NSURL *url = [NSURL URLWithString:uri];
    async = [[UNIAsyncImage alloc] init];
    [async setDelegate:self];

    [async ImageWithUri:url];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)processImageLoaded:(BOOL)success{
    [_image setImage:async.img];
   
}

- (void)viewDidUnload
{
    [self setImage:nil];
    [self setName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
