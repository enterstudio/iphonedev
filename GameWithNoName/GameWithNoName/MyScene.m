//
//  MyScene.m
//  GameWithNoName
//
//  Created by mike.tihonchik on 10/31/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        [self loadSpriteSheet];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void)update:(CFTimeInterval)currentTime {
}

-(void)loadSpriteSheet {
    // "sprites.png" is a 192x128 picture containing two rows of three 64x64 sprites each
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spy_sheet.png" ofType:nil];
    CGImageRef img = [UIImage imageWithContentsOfFile:path].CGImage;
    CALayer *imgLayer = [CALayer layer];
    imgLayer.contents = (__bridge id)img;
    // Frame defines the position of your sprite inside your view
    imgLayer.frame = CGRectMake(0, 0, 64, 64);
    imgLayer.contentsRect = CGRectMake(0, 0, 64, 64); // The size of an individual sprite
    // Pick the sprite from the top row, left column
    imgLayer.contentsRect = CGRectMake(0, 0, 1.0/3.0, 1.0/2.0);
    // Top row, middle column
    // imgLayer.contentsRect = CGRectMake(1.0/3, 0, 1.0/3.0, 1.0/2.0);
    // Top row, right column
    // imgLayer.contentsRect = CGRectMake(2.0/3, 0, 1.0/3.0, 1.0/2.0);
    // Bottom row, left column
    // imgLayer.contentsRect = CGRectMake(0, 1.0/2, 1.0/3.0, 1.0/2.0);
    // Bottom row, middle column
    // imgLayer.contentsRect = CGRectMake(1.0/3, 1.0/2, 1.0/3.0, 1.0/2.0);
    // Bottom row, right column
    // imgLayer.contentsRect = CGRectMake(2.0/3, 1.0/2, 1.0/3.0, 1.0/2.0);
    [self.layer addSublayer:imgLayer];
}
@end
