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
    
    self.spirographView.l = 0.3;
    self.spirographView.k = 0.7;
    self.spirographView.numberOfSteps = 2000;
    self.spirographView.stepSize = 0.2;
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardUp:) name:UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardDown:) name:UIKeyboardWillHideNotification object:nil];
}
-(void) keyboardUp: (NSNotification *) note{
    CGSize keyboardSize =[[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
        CGRect newFrame = self.view.frame;
        newFrame.origin.y -= keyboardSize.height;
        self.view.frame = newFrame;
    
}
-(void) keyboardDown: (NSNotification *)note {
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame= newFrame;
    
    
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) viewDidLayoutSubviews
{
   
    [self.sv setPagingEnabled:YES];
     self.sv.contentSize = CGSizeMake(560, 290);
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)kChange:(id)sender {
    self.kSlider.minimumValue = 0.01;
    self.kSlider.maximumValue = 0.99;
    self.spirographView.k = self.kSlider.value;
    [self.spirographView setNeedsDisplay];
    
    
}

- (IBAction)lChange:(id)sender {
    self.lSlider.minimumValue = 0.01;
    self.lSlider.maximumValue = 0.99;
    self.spirographView.l = self.lSlider.value;
    [self.spirographView setNeedsDisplay];
    
}

- (IBAction)redraw:(id)sender {
    int kIntVal = self.kSlider.value;
    self.spirographView.k = kIntVal;
    int lIntVal = self.lSlider.value;
    self.spirographView.l = lIntVal;
    self.spirographView.numberOfSteps = [self.numberOfSteps.text intValue];
    self.spirographView.stepSize = [self.stepSize.text intValue];
    [self.spirographView setNeedsDisplay];
    
    
    
}
    

@end
