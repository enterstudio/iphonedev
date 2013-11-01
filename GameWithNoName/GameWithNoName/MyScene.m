//
//  MyScene.m
//  GameWithNoName
//
//  Created by mike.tihonchik on 10/31/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "MyScene.h"

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
    CGPoint moveDifference = CGPointMake(location.x - _player.position.x, location.y - _player.position.y);
    float distanceToMove = sqrtf(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y);
    float moveDuration = distanceToMove / playerVelocity;

    if ([_player actionForKey:@"characterMoving"]) {
        [_player removeActionForKey:@"characterMoving"];
    }

    if (moveDifference.x < 0) {
        if (![_player actionForKey:@"movingLeft"]) {
            [self movingCharacter:@"left"];
        }
    } else {
        if (![_player actionForKey:@"movingRight"]) {
            [self movingCharacter:@"right"];
        }
    }

    SKAction *moveAction = [SKAction moveTo:location duration:moveDuration];
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

@end
