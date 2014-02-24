//
//  SpirographViewController.m
//  Spirograph
//
//  Created by Krystle on 2/23/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "SpirographViewController.h"
#import "HarmonigraphView.h"
#import "SpirographView.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    static float total;
    static float kTotal;
    total = lSlider.value;
    NSString *labelText = [NSString stringWithFormat:@ "%f", total];
    [lLabel setText: labelText];
    
    kTotal = kSlider.value;
    NSString *kLabelText = [NSString stringWithFormat:@ "%f", kTotal];
    [kLabel setText: kLabelText];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(fixKeyboard:) name:nil object:nil];
    
}
-(void) fixKeyboard: (NSNotification *)note{
    NSNotification *show = [NSNotification notificationWithName:nil object:UIKeyboardDidShowNotification];
    NSNotification *hide = [NSNotification notificationWithName:nil object:UIKeyboardDidHideNotification];
    
    if (show) {
        CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        CGRect newFrame = self.view.frame;
        newFrame.origin.y -= keyboardSize.height;
        self.view.frame = newFrame;
    }else if (hide) {
        
    }
}

-(void) viewDidLayoutSubviews
{
   
    [sv setPagingEnabled:YES];
    sv.contentSize = CGSizeMake(560, 290);
  

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redraw:(id)sender {
    
    SpirographView *spv;
    HarmonigraphView *hv;
    
    [spv setNeedsDisplay];
    [hv setNeedsDisplay];
}
    



- (IBAction)lSlider:(id)sender {
    static float total;
    [lSlider setMinimumValue:0.01];
    [lSlider setMaximumValue:0.99];
    total = lSlider.value;
   
    
    NSString *labelText = [NSString stringWithFormat:@ "%f", total];
    [lLabel setText: labelText];
}

- (IBAction)kSlider:(id)sender {
    static float kTotal;
    [kSlider setMinimumValue:0.01];
    [kSlider setMaximumValue:0.99];
    kTotal = kSlider.value;
    NSString *kLabelText = [NSString stringWithFormat:@ "%f", kTotal];
    [kLabel setText: kLabelText];
}
@end
