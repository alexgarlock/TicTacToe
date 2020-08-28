//
//  ViewController.m
//  TicTacToe
//
//  Created by Alexandr Garlock on 4/13/13.
//  Copyright (c) 2013 Alexandr Garlock. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController
@synthesize oImg,xImg,PlayersTurn,board;
@synthesize box1,box2,box3,box4,box5,box6,box7,box8,box9;
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    switch (playerToken){
        case 1:
            IMG = xImg;
            break;
        case 2:
            IMG = oImg;
            break;
    }
    UITouch *touch = [[event allTouches] anyObject];
	wasBoxUsed = NO;
    if(CGRectContainsPoint([box1 frame], [touch locationInView:self.view]) & (box1.image == NULL)){
		wasBoxUsed = YES;
		box1.image = IMG;
	}
    if(CGRectContainsPoint([box2 frame], [touch locationInView:self.view]) & (box2.image == NULL)){
		wasBoxUsed = YES;
		box2.image = IMG;
	}
	if(CGRectContainsPoint([box3 frame], [touch locationInView:self.view]) & (box3.image == NULL)){
		wasBoxUsed = YES;
		box3.image = IMG;
	}
	if(CGRectContainsPoint([box4 frame], [touch locationInView:self.view]) & (box4.image == NULL)){
		wasBoxUsed = YES;
		box4.image = IMG;
	}
	if(CGRectContainsPoint([box5 frame], [touch locationInView:self.view]) & (box5.image == NULL)){
		wasBoxUsed = YES;
		box5.image = IMG;
	}
	if(CGRectContainsPoint([box6 frame], [touch locationInView:self.view]) & (box6.image == NULL)){
		wasBoxUsed = YES;
		box6.image = IMG;
	}
	if(CGRectContainsPoint([box7 frame], [touch locationInView:self.view]) & (box7.image == NULL)){
		wasBoxUsed = YES;
		box7.image = IMG;
	}
	if(CGRectContainsPoint([box8 frame], [touch locationInView:self.view]) & (box8.image == NULL)){
		wasBoxUsed = YES;
		box8.image = IMG;
	}
	if(CGRectContainsPoint([box9 frame], [touch locationInView:self.view]) & (box9.image == NULL)){
		wasBoxUsed = YES;
		box9.image = IMG;
	}
	[self processLogic];
    
	if (wasBoxUsed){
		[self updatePlayerInfo];
    }
}
-(void)processLogic{
    if([self checkForWin])
    {
		if(playerToken==1){
            UIAlertView *alert = [[UIAlertView alloc] init];
            [alert setTitle:@"Player X Wins!"];
            [alert setMessage:@"Reset Game"];
            [alert setDelegate:self];
            [alert addButtonWithTitle:@"Yes"];
            [alert show];
            
		}if(playerToken==2){
            UIAlertView *alert = [[UIAlertView alloc] init];
            [alert setTitle:@"Player O Wins!"];
            [alert setMessage:@"Reset Game"];
            [alert setDelegate:self];
            [alert addButtonWithTitle:@"Yes"];
            [alert show];
            
		}
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		[self resetBoard];
	}
}

-(BOOL) checkForWin{
	if((box1.image == box2.image) & (box2.image == box3.image) & (box1.image != NULL)) { return YES; }
    if((box4.image == box5.image) & (box5.image == box6.image) & (box4.image != NULL)) { return YES; }
	if((box7.image == box8.image) & (box8.image == box9.image) & (box7.image != NULL)) { return YES; }
	if((box1.image == box4.image) & (box4.image == box7.image) & (box1.image != NULL)) { return YES; }
	if((box2.image == box5.image) & (box5.image == box8.image) & (box2.image != NULL)) { return YES; }
	if((box3.image == box6.image) & (box6.image == box9.image) & (box3.image != NULL)) { return YES; }
	if((box1.image == box5.image) & (box5.image == box9.image) & (box1.image != NULL)) { return YES; }
	if((box3.image == box5.image) & (box5.image == box7.image) & (box3.image != NULL)) { return YES; }
	return NO;
}

-(IBAction) buttonReset{
	[self resetBoard];
}
-(void) resetBoard{
	box1.image = NULL;
	box2.image = NULL;
	box3.image = NULL;
	box4.image = NULL;
	box5.image = NULL;
	box6.image = NULL;
	box7.image = NULL;
	box8.image = NULL;
	box9.image = NULL;
	playerToken= 1;
	PlayersTurn.text = @"X can go";
	numberOfPlays = 0;
}
- (void) updatePlayerInfo{
	numberOfPlays++;
	if(playerToken == 1){
		playerToken = 2;
		PlayersTurn.text = @"O can go";
	}
    else {
		playerToken = 1;
		PlayersTurn.text =@"X can go";
	}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    oImg = [UIImage imageNamed:@"O.png"];
	xImg = [UIImage imageNamed:@"X.png"];
	playerToken = 1;
	PlayersTurn.text =@"X can go";
	numberOfPlays = 0;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:NO];
}
- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:NO];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

@end