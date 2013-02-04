//
//  FifteenPuzzleViewController.m
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/28/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import "FifteenPuzzleViewController.h"
#import "FifteenBoard.h"

@interface FifteenPuzzleViewController ()

@property (strong, nonatomic) FifteenBoard *board;

@end

@implementation FifteenPuzzleViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.board = [[FifteenBoard alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.board = [[FifteenBoard alloc] init];
    //[self.board scramble:NUM_SHUFFLES];
    //[self arrangeBoardView];
    
    /*Pretty Buttons
    UIImage* image = [UIImage imageNamed:@"shiny-button.png"];
    UIImage* stretchyShinyImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    for (int tile = 1; tile <= 15; tile ++) {
        UIButton *button = (UIButton *)[self.boardView viewWithTag:tile];
        [button setBackgroundImage:stretchyShinyImage forState:UIControlStateNormal];
    }*/
    
    UIImage* image = [UIImage imageNamed:@"shiny-button.png"];
    self.boardView.backgroundColor = [UIColor colorWithPatternImage:image];
    NSLog(@"board initiated");
    int NUM_SHUFFLES = 150;
    [self.board scramble:NUM_SHUFFLES];
    [self arrangeBoardView];
    [self.board isSolved];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tileSelected:(UIButton *)sender {
    const int tag = [sender tag];
    NSLog(@"tileSelected:%d",tag);
    int row=0, col=0;
    [self.board getRow:&row Column:&col ForTile:tag];
    NSLog(@"row= %d, col = %d", row,col);
    CGRect buttonFrame = sender.frame;
    if ([self.board canSlideTileUpAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.y = buttonFrame.origin.y - buttonFrame.size.height;
        [UIView animateWithDuration:0.5 animations:^{sender.frame = buttonFrame;}];
    }
    if ([self.board canSlideTileDownAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.y = buttonFrame.origin.y + buttonFrame.size.height;
        [UIView animateWithDuration:0.5 animations:^{sender.frame = buttonFrame;}];
    }
    if ([self.board canSlideTileLeftAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.x = buttonFrame.origin.x - buttonFrame.size.height;
        [UIView animateWithDuration:0.5 animations:^{sender.frame = buttonFrame;}];
    }
    if ([self.board canSlideTileRightAtRow:row Column:col]) {
        [self.board slideTileAtRow:row Column:col];
        buttonFrame.origin.x = buttonFrame.origin.x + buttonFrame.size.height;
        [UIView animateWithDuration:0.5 animations:^{sender.frame = buttonFrame;}];
    }
    if([self.board isSolved]){
    }
    
}

- (void)arrangeBoardView{
    const CGRect boardBounds = self.boardView.bounds;
    const CGFloat tileWidth = boardBounds.size.width / 4;
    const CGFloat tileHeight = boardBounds.size.height / 4;
    for (int row = 0; row < 4; row++)
        for(int col = 0; col < 4; col++){
            const int tile = [self.board getTileAtRow:row Column:col];
            if (tile > 0){
                UIButton *button = (UIButton *)[self.boardView viewWithTag:tile];
                button.frame = CGRectMake(col*tileWidth, row*tileHeight, tileWidth, tileHeight);
            }
        }
}

- (IBAction)scrambleTiles:(id)sender {
    NSLog(@"New game selected");
    int NUM_SHUFFLES = 150;
    [self.board scramble:NUM_SHUFFLES];
    [self arrangeBoardView];
}
@end
