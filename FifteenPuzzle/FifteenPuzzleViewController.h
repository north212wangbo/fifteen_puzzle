//
//  FifteenPuzzleViewController.h
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/28/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FifteenPuzzleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *boardView;
- (IBAction)tileSelected:(UIButton *)sender;
- (IBAction)scrambleTiles:(id)sender;

@end
