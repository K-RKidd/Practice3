//
//  SpirographViewController.h
//  Spirograph
//
//  Created by Krystle on 2/23/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpirographViewController : UIViewController
{
    __weak IBOutlet UILabel *lLabel;
 
    __weak IBOutlet UILabel *kLabel;
    
    __weak IBOutlet UISlider *lSlider;
    __weak IBOutlet UISlider *kSlider;
    
    __weak IBOutlet UIScrollView *sv;
}

- (IBAction)redraw:(id)sender;
- (IBAction)lSlider:(id)sender;
- (IBAction)kSlider:(id)sender;





@end
