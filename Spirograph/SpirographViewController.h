//
//  SpirographViewController.h
//  Spirograph
//
//  Created by Krystle on 2/23/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpirographView.h"
#import "HarmonigraphView.h"

@interface SpirographViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet SpirographView *spirographView;
@property (weak, nonatomic) IBOutlet HarmonigraphView *harmonigraphView;

@property (weak, nonatomic) IBOutlet UITextField *numberOfSteps;
@property (weak, nonatomic) IBOutlet UITextField *stepSize;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *kSlider;
@property (weak, nonatomic) IBOutlet UIScrollView *sv;

- (IBAction)kChange:(id)sender;

- (IBAction)lChange:(id)sender;

- (IBAction)redraw:(id)sender;






@end
