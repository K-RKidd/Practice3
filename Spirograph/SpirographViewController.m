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
    self.spirographView.numberOfSteps = 200;
    self.spirographView.stepSize = 0.2;
    
    self.kSlider.minimumValue = 0.01;
    self.kSlider.maximumValue = 0.99;
    self.lSlider.minimumValue = 0.01;
    self.lSlider.maximumValue = 0.99;
    
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


-(BOOL) textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    return YES;
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
    self.spirographView.k = self.kSlider.value;
    [self.spirographView setNeedsDisplay];
    
    
}


- (IBAction)lChange:(id)sender {
    self.spirographView.l = self.lSlider.value;
    [self.spirographView setNeedsDisplay];
    
}

- (IBAction)redraw:(id)sender {
    int i = self.kSlider.value *100;
    self.spirographView.k = i/100.0;
    i = self.lSlider.value *100;
    self.spirographView.l = i/100.0;
    self.spirographView.numberOfSteps = [self.numberOfSteps.text intValue];
    self.spirographView.stepSize = [self.stepSize.text floatValue];
    [self.spirographView setNeedsDisplay];
    [self.harmonigraphView setNeedsDisplay];
    
    
    
}
    

@end
