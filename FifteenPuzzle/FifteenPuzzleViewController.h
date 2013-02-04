//
//  FifteenPuzzleViewController.h
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/28/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FifteenBoard.h"

@interface FifteenPuzzleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *boardView;
@property (weak, nonatomic) IBOutlet UIButton *buttonView;

- (IBAction)tileSelected:(UIButton *)sender;
- (IBAction)scrambleTiles:(id)sender;

@end
