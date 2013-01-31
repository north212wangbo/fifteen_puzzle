//
//  FifteenBoard.m
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/29/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import "FifteenBoard.h"

@implementation FifteenBoard {
    int location[4][4];
}

-(id)init{
    self = [super init];
    if (self) {
        int i = 1;
        for (int r = 0; r < 4; r++)
            for (int c = 0; c < 4; c++)
                location[r][c] = i++;
        location[3][3] = 0;
    }
    return self;
}

//-(void)scramble:(int)n

//-(int)getTileAtRow:(int)row Column:(int)col

-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile{
    for(int i=0; i<4; ++i){
        for(int j=0; j<4; ++j){
            //if (location[i][j] == tile){
                //NSLog(@"location[i][j] = %d", location[i][j]);
            //}
        }
    }
}

//-(BOOL)isSolved

/*-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col{
    if (row > 0) {
        if (location[row-1][col] == 0)
            return YES;
        else
            return NO;
    }
    return NO;
}*/

//-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col

//-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col

//-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col

//-(void)slideTileAtRow:(int)row Column:(int)col{
//    if([self canSlideTileUpAtRow:row Column:col]){
        
//    }
//}

@end
