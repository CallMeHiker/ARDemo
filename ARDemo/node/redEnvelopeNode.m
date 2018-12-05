//
//  redEnvelopeNode.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/12/1.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "redEnvelopeNode.h"

@implementation redEnvelopeNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpNode];
    }
    return self;
}

- (void)setUpNode
{
    SCNBox * box = [SCNBox boxWithWidth:0.2 height:0.2 length:0 chamferRadius:0];
    
    self.geometry = box;
    
    SCNPhysicsShape * shape = [SCNPhysicsShape shapeWithGeometry:box options:nil];
    
    self.physicsBody = [SCNPhysicsBody bodyWithType:SCNPhysicsBodyTypeDynamic shape:shape];
    
    [self.physicsBody setAffectedByGravity:NO];
    
    self.physicsBody.categoryBitMask = 1;
    self.physicsBody.contactTestBitMask = 2;
//    box.chamferRadius = 0.5;
    
    
    // add texture
    SCNMaterial * material = [[SCNMaterial alloc]init];
    
    material.diffuse.contents = [UIImage imageNamed:@"redEnvelope"];
    
    
    self.geometry.materials = @[material,material,material,material,material,material];
}

@end
