//
//  MainScene.m
//  GiveMeCandy
//
//  Created by ohtaisao on 2014/11/14.
//  Copyright (c) 2014年 VLADU BOGDAN DANIEL PFA. All rights reserved.
//

#import "MainScene.h"
#import "GameLogic.h"

@implementation MainScene : LHScene

+(id)scene {
     return LH_AUTORELEASED([[self alloc] initWithContentOfFile:@"publishResources/mainScene_new.lhplist"]);
}

-(id)initWithContentOfFile:(NSString *)levelPlistFile {
    self = [super initWithContentOfFile:levelPlistFile];
    if(self){
        //INIT YOUR CONTENT HERE
    }
    return self;
}

-(void)didFinishedPlayingAnimation:(LHAnimation *)anim{
    LHNode* node = (LHNode*)[anim node];
    if(node &&
       ([[node name] isEqualToString:@"topLeafs"] || [[node name] isEqualToString:@"bottomLeafs"]))
    {
        NSArray* allAnimations = [node animations];
        int newAnimIdx = arc4random() % [allAnimations count];
        LHAnimation* newAnim = [allAnimations objectAtIndex:newAnimIdx];
        [node setActiveAnimation:newAnim];
        [newAnim restart];
    }
}

-(void)goToPlayMenu {
    NSLog(@"PLAY MENU");
    [[self view] presentScene:[GameLogic scene]];
}

-(void)goToAboutMenu {
    NSLog(@"ABOUT MENU");
}

#if TARGET_OS_IPHONE

-(void)handleTouchNodesAtLocation:(CGPoint)location {
    SKNode *node = [[self gameWorldNode] nodeAtPoint:location];
    NSString *node_name = [node name];
    if( [node_name isEqualToString:@"playButton"]) {
        [self goToPlayMenu];
    }
    else if ( [node_name isEqualToString:@"aboutButton"]) {
        [self goToAboutMenu];
    }
    
}

#else



#endif

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:[self gameWorldNode]];
        [self handleTouchNodesAtLocation:location];
    }
    [super touchesEnded:touches withEvent:event];
}

@end
