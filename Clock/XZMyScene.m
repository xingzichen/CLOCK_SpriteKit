//
//  XZMyScene.m
//  Clock
//
//  Created by Liang on 8/5/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZMyScene.h"

@implementation XZMyScene{
    SKSpriteNode *_pmin;
    SKSpriteNode *_phour;
    SKSpriteNode *_psecond;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//        
//        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        
//        myLabel.text = @"Hello, World!";
//        myLabel.fontSize = 30;
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                       CGRectGetMidY(self.frame));
//        
//        [self addChild:myLabel];
        
        SKSpriteNode *background = [[SKSpriteNode alloc] initWithImageNamed:@"background"];
        [background setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        NSLog(@"width : %f, height : %f", self.size.width, self.size.height);
        [self addChild:background];
        
        SKSpriteNode *dial = [[SKSpriteNode alloc] initWithImageNamed:@"dial"];
        dial.anchorPoint = CGPointMake(0.5, 0.5);
        [dial setPosition:CGPointMake(self.size.width/2, 300)];
        [self addChild:dial];
        
        _psecond = [[SKSpriteNode alloc] initWithImageNamed:@"psecond"];
        _psecond.anchorPoint = CGPointMake(91.0/101.0, 0.5);
        _psecond.zRotation = -M_PI/2;
        [_psecond setPosition:dial.position];
        [self addChild:_psecond];
        
        _pmin = [[SKSpriteNode alloc] initWithImageNamed:@"pmin"];
        _pmin.anchorPoint = CGPointMake(10.0/102.0, 0.5);
        _pmin.zRotation = M_PI/2;
        [_pmin setPosition:dial.position];
        NSLog(@"dial achor point : (%f,%f)", dial.anchorPoint.x, dial.anchorPoint.y);
        [self addChild:_pmin];
        
        _phour = [[SKSpriteNode alloc] initWithImageNamed:@"phour"];
        _phour.anchorPoint = CGPointMake(10.0/62.0, 0.5);
        _phour.zRotation = M_PI/2;
        [_phour setPosition:dial.position];
        [self addChild:_phour];
        
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    NSDate *now = [NSDate date];
//    NSLog(@"date is %@", now);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int hour = [dateComponent hour]%12;
    int min = [dateComponent minute];
    int second = [dateComponent second];
    
    NSLog(@"hour : %d , minute : %d , seconds : %d", hour, min, second);
    
    _phour.zRotation = M_PI/2 - (M_PI/6)*hour;
    _pmin.zRotation = M_PI/2 - (M_PI/30)*min;
    _psecond.zRotation = -M_PI/2 - (M_PI/30)*second;
    
    
}

@end
