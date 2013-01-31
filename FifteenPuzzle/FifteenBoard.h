//
//  FifteenBoard.h
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/29/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FifteenBoard : NSObject
@property (strong, nonatomic) NSMutableArray *location;


-(id)init; //Initialize a new 15-puzzle board with the tiles in the solved configuration (only called once when the puzzle is instantialted)
-(void)scramble:(int)n; //Choose one of the "slidable" tiles at random and slide it into the empty space
-(int)getTileAtRow:(int)row Column:(int)col; //Fetch the tile at the given position (0 is used for the space).
-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile; //Find the position of the given tile
-(BOOL)isSolved; //Determine if puzzle is in solved configuration
-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col; //Determine if the specied tile can be slid up into the empty space
-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col;
-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col;
-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col;
-(void)slideTileAtRow:(int)row Column:(int)col; //Slide the tile into the empty space

@end
