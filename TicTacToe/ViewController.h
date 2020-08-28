//
//  ViewController.h
//  TicTacToe
//
//  Created by Alexandr Garlock on 4/13/13.
//  Copyright (c) 2013 Alexandr Garlock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIImage *oImg, *xImg;
	IBOutlet UIImageView *box1;
    IBOutlet UIImageView *box2;
    IBOutlet UIImageView *box3;
    IBOutlet UIImageView *box4;
    IBOutlet UIImageView *box5;
    IBOutlet UIImageView *box6;
    IBOutlet UIImageView *box7;
    IBOutlet UIImageView *box8;
    IBOutlet UIImageView *box9;
	UIImage * IMG;
	NSInteger numberOfPlays;
	IBOutlet UIImage *resetBoard;
	IBOutlet UIImageView * board;
	IBOutlet UILabel * PlayersTurn;
	NSInteger playerToken;
	BOOL wasBoxUsed;
}

@property (nonatomic,retain) UIImage *oImg, *xImg;
@property (nonatomic,retain) UIImageView *board, *box1, *box2, *box3, *box4, *box5, *box6, *box7, *box8, *box9;
@property (nonatomic,retain) UILabel * PlayersTurn;

-(BOOL)checkForWin;
-(IBAction)buttonReset;
-(void)resetBoard;
-(void)processLogic;
-(void)updatePlayerInfo;

@end

