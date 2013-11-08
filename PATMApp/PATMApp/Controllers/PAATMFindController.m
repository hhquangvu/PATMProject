//
//  PAATMFindController.m
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAATMFindController.h"

@interface PAATMFindController (){
    @private
    NSArray *_banks;
    @private
    NSArray *_bankNames;
}
- (IBAction)onFilterButtonDidTouch:(id)sender;

@end

@implementation PAATMFindController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.pickerView.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    // Set delegate for map view, very important
    [self.mapView setDelegate:self];
    
    self.pickerView.delegate = self;
    
    [self getATMFromServer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - PickerView Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _bankNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_bankNames objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self filterBankWithName:[_bankNames objectAtIndex:row]];
}

#pragma mark - User Defide
/****************************************************
 Get Map Item from server (ATM)
 ****************************************************/
-  (void)getATMFromServer
{
    dispatch_queue_t myQueue = dispatch_queue_create("myapp", nil);
    
    dispatch_async(myQueue, ^{
        NSArray *mapItems = [self getAnnotationViewWithType:2];
        dispatch_async(dispatch_get_main_queue(), ^{
    
            _banks = mapItems;
            
            _bankNames = [self getBankNameList];
            [self.pickerView reloadAllComponents];
            
            for (PALocationItem *item in mapItems) {
                [self.mapView addAnnotation:item];
            }
        });
    });
}

/****************************************************
 Get list of name
 ****************************************************/
- (NSArray*)getBankNameList
{
    if (_banks.count == 0) return nil;
    
    NSMutableArray *returnData = [[NSMutableArray alloc]initWithCapacity:1];
    
    for (PALocationItem *item in _banks) {
        if ([returnData indexOfObject:item.getMapItem.corporation] > returnData.count) {
            [returnData addObject:item.getMapItem.corporation];
        }
    }
    
    return returnData;
}

/****************************************************
 Set annotation View for filtered Banks
 ****************************************************/
- (void)filterBankWithName:(NSString*)name
{
    [self.mapView removeAnnotations:_banks];
    for (PALocationItem *item in _banks) {
        if ([item.getMapItem.corporation isEqualToString:name]) {
            [self.mapView addAnnotation:item];
        }
    }
}

#pragma mark - IBAction
- (IBAction)onFilterButtonDidTouch:(id)sender {
    self.pickerView.hidden = NO;
}
@end
