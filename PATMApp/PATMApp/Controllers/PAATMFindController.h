//
//  PAATMFindController.h
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAATMFindController : PABaseMapController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
