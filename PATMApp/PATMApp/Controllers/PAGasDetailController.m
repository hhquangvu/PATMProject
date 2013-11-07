//
//  PAGasDetailController.m
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAGasDetailController.h"

@interface PAGasDetailController ()
- (IBAction)onNoticeButtonDidTouch:(id)sender;

@end

@implementation PAGasDetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Init data
    [self initDataToView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMapItem:(MapItem *)mapItem
{
    _mapItem = mapItem;
}

- (void)initDataToView
{
    // Set name gas station
    UILabel *nameLabel = (UILabel*)[self.view viewWithTag:1];
    nameLabel.text = _mapItem.name;

    // Set address gas station
    UILabel *addressLabel = (UILabel*)[self.view viewWithTag:2];
    addressLabel.text = _mapItem.address;
    
    // Set image gas station
    UIImageView *imageView = (UIImageView*)[self.view viewWithTag:3];
    // Check rate of gas station
    if ([_mapItem.rate intValue] < -10) {
        imageView.image = [UIImage imageNamed:@"ico_gas_bad"];
    } else {
        imageView.image = [UIImage imageNamed:@"ico_gas_ok"];
    }
    
}
- (IBAction)onNoticeButtonDidTouch:(id)sender {
    UnitOfWork *unitOfWork = [UnitOfWork sharedInstance];
    
    [_mapItem setValue:[NSNumber numberWithInt:9999] forKey:@"rate"];

    [unitOfWork savedChanges];

}
@end
