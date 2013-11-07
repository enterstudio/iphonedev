//
//  MyScene.m
//  GameWithNoName
//
//  Created by mike.tihonchik on 10/31/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "MyScene.h"
#import "Geometry.h"
#import "Globals.h"

@implementation MyScene {
    
    SKSpriteNode *_player;
    NSArray *_movementFramesLeft;
    NSArray *_movementFramesRight;
    NSArray *_movementFramesUp;
    NSArray *_movementFramesDown;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];

        NSMutableArray *moveFramesLeft = [NSMutableArray array];
        NSMutableArray *moveFramesRight = [NSMutableArray array];
        NSMutableArray *moveFramesUp = [NSMutableArray array];
        NSMutableArray *moveFramesDown = [NSMutableArray array];
        SKTextureAtlas *playerAtlas = [SKTextureAtlas atlasNamed:@"nonamegame"];
        
        //int numImages = playerAtlas.textureNames.count;
        /* divide number of frames by 2, if there are iPad sized images - Mike T., 11/1/2013 */
        for (int i=1; i <= 4; i++) {
            
            NSString *textureName = [NSString stringWithFormat:@"walk_up_%d", i];
            SKTexture *temp = [playerAtlas textureNamed:textureName];
            [moveFramesUp addObject:temp];

            textureName = [NSString stringWithFormat:@"walk_down_%d", i];
            temp = [playerAtlas textureNamed:textureName];
            [moveFramesDown addObject:temp];

            textureName = [NSString stringWithFormat:@"walk_left_%d", i];
            temp = [playerAtlas textureNamed:textureName];
            [moveFramesLeft addObject:temp];
            
            textureName = [NSString stringWithFormat:@"walk_right_%d", i];
            temp = [playerAtlas textureNamed:textureName];
            [moveFramesRight addObject:temp];
        }
        _movementFramesLeft = moveFramesLeft;
        _movementFramesRight = moveFramesRight;
        _movementFramesUp = moveFramesUp;
        _movementFramesDown = moveFramesDown;
        
        /* Setting initial position */
        SKTexture *temp = _movementFramesDown[0];
        _player = [SKSpriteNode spriteNodeWithTexture:temp];
        _player.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_player];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {

}

-(void)movingCharacter:(NSString *)move {
    if([@"up" isEqualToString:move]) {
        [_player runAction:[SKAction animateWithTextures:_movementFramesUp
                                            timePerFrame:0.3f
                                                  resize:NO
                                                 restore:YES] withKey:@"movingUp"];
    } else if([@"down" isEqualToString:move]) {
        [_player runAction:[SKAction animateWithTextures:_movementFramesDown
                                            timePerFrame:0.3f
                                                  resize:NO
                                                 restore:YES] withKey:@"movingDown"];
    } else if([@"left" isEqualToString:move]) {
        [_player runAction:[SKAction repeatActionForever:
                            [SKAction animateWithTextures:_movementFramesLeft
                                             timePerFrame:0.3f
                                                   resize:NO
                                                  restore:YES]] withKey:@"movingLeft"];
    } else if([@"right" isEqualToString:move]) {
        [_player runAction:[SKAction repeatActionForever:
                            [SKAction animateWithTextures:_movementFramesRight
                                             timePerFrame:0.3f
                                                   resize:NO
                                                  restore:YES]] withKey:@"movingRight"];
    }
    return;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint location = [[touches anyObject] locationInNode:self];
    CGSize screenSize = self.frame.size;
    float playerVelocity = screenSize.width / 5.0;
//    CGPoint moveDifference = CGPointMake(location.x - _player.position.x, location.y - _player.position.y);
//    float distanceToMove = sqrtf(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y);
    float distanceToMove = 50.0f;
    float moveDuration = distanceToMove / playerVelocity;

    if ([_player actionForKey:@"characterMoving"]) {
        [_player removeActionForKey:@"characterMoving"];
    }

    NSString *movement = [self determinePointPosition:location.x currentY:location.y];
    [self movingCharacter:movement];
    float newPositionX, newPositionY;
    if( [@"left" isEqualToString:movement]) {
        newPositionX = _player.position.x - 30;
        newPositionY = _player.position.y;
    } else if( [@"right" isEqualToString:movement]) {
        newPositionX = _player.position.x + 30;
        newPositionY = _player.position.y;
    } else if( [@"up" isEqualToString:movement]) {
        newPositionX = _player.position.x;
        newPositionY = _player.position.y + 30;
    } else {
        newPositionX = _player.position.x;
        newPositionY = _player.position.y - 30;
    }
    
    CGPoint newLocation = CGPointMake(newPositionX, newPositionY);
    SKAction *moveAction = [SKAction moveTo:newLocation duration:moveDuration];
//    SKAction *moveAction = [SKAction moveTo:location duration:moveDuration];
    SKAction *doneAction = [SKAction runBlock:(dispatch_block_t)^() {
        [self playerMoveEnded];
    }];
    SKAction *moveActionWithDone = [SKAction sequence:@[moveAction,doneAction]];
    
    [_player runAction:moveActionWithDone withKey:@"characterMoving"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)playerMoveEnded {
    [_player removeAllActions];
}

/*
 * line is (x1,y1) to (x2,y2), point is (x3,y3)
 * return (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1);
 */
-(NSString *)determinePointPosition:(float) currentPositionX currentY:(float) currentPositionY {
    float endpointX, endpointY;
    float startX = NON_IPHONE_5/2;
    if(IS_IPHONE_5) {
        startX = IPHONE_5/2;
    }
    float startY = 160;
    int quadrant;
    NSString *direction;
    
    if(currentPositionX < startX && currentPositionY > startY) {
        endpointX = 0;
        endpointY = 320;
        quadrant = 1;
    } else if(currentPositionX > startX && currentPositionY > startY) {
        endpointX = IPHONE_5;
        endpointY = 320;
        quadrant = 2;
    } else if(currentPositionX > startX && currentPositionY < startY) {
        endpointX = IPHONE_5;
        endpointY = 0;
        quadrant = 3;
    } else {
        endpointX = 0;
        endpointY = 0;
        quadrant = 4;
    }
    
    float result = (endpointX - startX) * (currentPositionY - startY) - (endpointY - startY) * (currentPositionX - startX);

    if(quadrant == 1) {
        if(result > 0) {
            direction = @"left";
        } else {
            direction = @"up";
        }
    } else if(quadrant == 2) {
        if(result > 0) {
            direction = @"up";
        } else {
            direction = @"right";
        }
    } else if(quadrant == 3) {
        if(result > 0) {
            direction = @"right";
        } else {
            direction = @"down";
        }
    } else {
        if(result > 0) {
            direction = @"down";
        } else {
            direction = @"left";
        }
    }
    return direction;
}

@end
