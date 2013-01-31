//
//  FifteenPuzzleViewController.m
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/28/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import "FifteenPuzzleViewController.h"

@interface FifteenPuzzleViewController ()

@end

@implementation FifteenPuzzleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.board = [[FifteenBoard alloc] init];
    //[self.board scramble:NUM_SHUFFLES];
    //[self arrangeBoardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tileSelected:(UIButton *)sender {
    const int tag = [sender tag];
    NSLog(@"tileSelected:%d",tag);
    int row, col;
    [self.board getRow:&row Column:&col ForTile:tag];
    NSLog(@"row= %d, col = %d", row,col);
    CGRect buttonFrame = sender.frame;
//    if ([self.board canSlideTileUpAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.y = buttonFrame.origin.y - buttonFrame.size.height;
        [UIView animateWithDuration:0.5 animations:^{sender.frame = buttonFrame;}];
//    }
    
}

- (IBAction)scrambleTiles:(id)sender {
    NSLog(@"New game selected");
}
@end
