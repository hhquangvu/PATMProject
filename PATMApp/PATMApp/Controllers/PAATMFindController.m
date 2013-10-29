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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self getATMFromServer];
    
    _banks = @[@"DongA Bank",@"Vietcombank",@"Techcombank"];
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
    return _banks.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_banks objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@", [_banks objectAtIndex:row]);
}

#pragma mark - User Defide
/****************************************************
 Get Map Item from server (ATM)
 ****************************************************/
-  (void)getATMFromServer
{
    PALocationService *locationService = [PALocationService defaultService];
    NSArray *mapItems = [locationService getAnnotationViewWithType:2];
    for (PALocationItem *item in mapItems) {
        [self.mapView addAnnotation:item];
    }
}
#pragma mark - IBAction
- (IBAction)onFilterButtonDidTouch:(id)sender {
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.frame = CGRectMake(0, 500, pickerView.frame.size.width, pickerView.frame.size.height);
    [UIView beginAnimations:nil context:NULL];    [UIView setAnimationDuration:.50];
    [UIView setAnimationDelegate:self];
    pickerView.frame = CGRectMake(0, 200, pickerView.frame.size.width, pickerView.frame.size.height);
    [self.view addSubview:pickerView];
    [UIView commitAnimations];
    pickerView.delegate = self;

}
@end
