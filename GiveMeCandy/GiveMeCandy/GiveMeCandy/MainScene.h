//
//  MainScene.h
//  GiveMeCandy
//
//  Created by ohtaisao on 2014/11/14.
//  Copyright (c) 2014年 VLADU BOGDAN DANIEL PFA. All rights reserved.
//

#import "LevelHelper2API.h"

@interface MainScene : LHScene

+(id)scene;
-(id)initWithContentOfFile:(NSString *)levelPlistFile;
-(void)didFinishedPlayingAnimation:(LHAnimation *)anim;
@end
