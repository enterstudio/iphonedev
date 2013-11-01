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
    NSArray *_movementFrames;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];

        NSMutableArray *moveFrames = [NSMutableArray array];
        SKTextureAtlas *playerAtlas = [SKTextureAtlas atlasNamed:@"nonamegame"];
        
        int numImages = playerAtlas.textureNames.count;
        /* divide number of frames by 2, if there are iPad sized images - Mike T., 11/1/2013 */
        for (int i=1; i <= numImages; i++) {
            NSString *textureName;
            if(i<10) {
                textureName = [NSString stringWithFormat:@"slice0%d_0%d", i, i];
            } else {
                textureName = [NSString stringWithFormat:@"slice%d_%d", i, i];
            }
            SKTexture *temp = [playerAtlas textureNamed:textureName];
            [moveFrames addObject:temp];
        }
        _movementFrames = moveFrames;
        
        SKTexture *temp = _movementFrames[0];
        _player = [SKSpriteNode spriteNodeWithTexture:temp];
        _player.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_player];
        [self movingCharacter];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {

}

-(void)movingCharacter {
    // This is our general runAction method to make our bear walk.
    [_player runAction:[SKAction repeatActionForever:
                      [SKAction animateWithTextures:_movementFrames
                                       timePerFrame:0.3f
                                             resize:NO
                                            restore:YES]] withKey:@"inplaceMovement"];
    return;
}
@end
