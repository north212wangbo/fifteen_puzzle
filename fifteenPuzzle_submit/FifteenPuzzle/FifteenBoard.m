//
//  FifteenBoard.m
//  FifteenPuzzle
//
//  Created by Bo Wang on 1/29/13.
//  Copyright (c) 2013 Bo Wang. All rights reserved.
//

#import "FifteenBoard.h"

@implementation FifteenBoard{
    int location[4][4];
}

-(id)init{
    self = [super init];
    if (self) {
        int i = 1;
        for (int r = 0; r < 4; r++)
            for (int c = 0; c < 4; c++){
                location[r][c] = i++;
            }
        location[3][3] = 0;
    }
    return self;
}

-(void)scramble:(int)n {
    for(int round = 0; round < n; round++){
        int row,col;
        do{
            int n = arc4random() % 15 + 1;
            [self getRow:&row Column:&col ForTile:n];
        } while (!([self canSlideTileDownAtRow:row Column:col]||[self canSlideTileLeftAtRow:row Column:col]||[self canSlideTileRightAtRow:row Column:col]||[self canSlideTileUpAtRow:row Column:col]));
        
        [self slideTileAtRow:row Column:col];
    }
    
}

-(int)getTileAtRow:(int)row Column:(int)col{
    return location[row][col];
}

-(void)getRow:(int*)row Column:(int*)col ForTile:(int)tile {
    for(int r=0; r<4; ++r){
        for(int c=0; c<4; ++c){
            if (location[r][c] == tile){
                *row = r;
                *col = c;
            }
        }
    }
}

-(BOOL)isSolved{
    int i = 1;
    for(int r = 0; r<4; r++)
        for(int c = 0; c<4; c++){
            if(location[r][c] != i % 16)
                return NO;
            i++;
        }
    NSLog(@"SOLVED!!!");
    return YES;
}

-(BOOL)canSlideTileUpAtRow:(int)row Column:(int)col{
    if (row > 0) {
        if (location[row-1][col] == 0)
            return YES;
        else
            return NO;
    }
    return NO;
}

-(BOOL)canSlideTileDownAtRow:(int)row Column:(int)col{
    if (row < 3) {
        if (location[row+1][col] == 0)
            return YES;
        else
            return NO;
    }
    return NO;
}

-(BOOL)canSlideTileLeftAtRow:(int)row Column:(int)col{
    if (col > 0) {
        if (location[row][col-1] == 0)
            return YES;
        else
            return NO;
    }
    return NO;
}

-(BOOL)canSlideTileRightAtRow:(int)row Column:(int)col{
    if (col < 3) {
        if (location[row][col+1] == 0)
            return YES;
        else
            return NO;
    }
    return NO;  
}

-(void)slideTileAtRow:(int)row Column:(int)col{
    int tile = [self getTileAtRow:row Column:col];
    if([self canSlideTileDownAtRow:row Column:col]){
        location[row+1][col] = tile;
        location[row][col] = 0;
    }
    
    if([self canSlideTileUpAtRow:row Column:col]){
        location[row-1][col] = tile;
        location[row][col] = 0;
    }
    
    if([self canSlideTileLeftAtRow:row Column:col]){
        location[row][col-1] = tile;
        location[row][col] = 0;
    }
    
    if([self canSlideTileRightAtRow:row Column:col]){
        location[row][col+1] = tile;
        location[row][col] = 0;
    }
}


@end
