//
//  GameLogic.m
//  GiveMeCandy
//
//  Created by ohtaisao on 2014/11/14.
//  Copyright (c) 2014年 VLADU BOGDAN DANIEL PFA. All rights reserved.
//

#import "GameLogic.h"

@implementation GameLogic

+(id)scene {
    return [[GameLogic alloc] initWithContentOfFile:@"publishResources/bambooForest_level1.lhplist"];
}
-(void)handleCandy:(SKNode *)candy collisionWithNode:(SKNode *)other
{
    if ([other conformsToProtocol:@protocol(LHNodeProtocol)]) {
        LHNode* n = (LHNode *)other;
        if ([[n tags] containsObject:@"STAR"]) {
            [n removeFromParent];
        }
    }
    if ([[other name] isEqualToString:@"win"]) {
        [candy removeFromParent];
    }
    else {
        NSLog(@"WE HAVE FAILED");
    }
}

-(void)didBeginContactBetweenNodeA:(SKNode *)a andNodeB:(SKNode *)b atLocation:(CGPoint)scenePt withImpulse:(float)impulse {
    if ([[a name] isEqualToString:@"candy"]) {
        [self handleCandy:a collisionWithNode:b];
    }
    else if ([[b name] isEqualToString:@"candy"]) {
        [self handleCandy:b collisionWithNode:a];
    }
}

@end
