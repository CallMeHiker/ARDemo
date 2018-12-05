//
//  openRedEnvelopeViewController.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/12/1.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "openRedEnvelopeViewController.h"

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

#import "redEnvelopeNode.h"

@interface openRedEnvelopeViewController ()<ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *sceneView;

@end

@implementation openRedEnvelopeViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.sceneView.session pause];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubView];
}

- (void)setUpSubView
{
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.sceneView.session runWithConfiguration:configuration];
    self.sceneView.delegate = self;
    
    //当你是利用两个节点碰撞作为检测逻辑时用到。对应的代理是SCNPhysicsContactDelegate
//    self.sceneView.scene.physicsWorld.contactDelegate = self;
    
    [self addNewNode];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ViewDidTapped:)];
    [self.sceneView addGestureRecognizer:tapGesture];
}

// 这里是自己独立开一条线程出来,碰撞检测（碰撞对应的代理方法）
//- (void)physicsWorld:(SCNPhysicsWorld *)world didBeginContact:(SCNPhysicsContact *)contact {
//
//}

- (void)ViewDidTapped:(UITapGestureRecognizer *)recognizer
{
    CGPoint tapPoint = [recognizer locationInView:self.sceneView];
    NSArray<SCNHitTestResult *> *resultArray = [self.sceneView hitTest:tapPoint options:nil];
    SCNHitTestResult *hitResult = [resultArray firstObject];
    if ([hitResult.node isKindOfClass:[redEnvelopeNode class]]) {
//        [hitResult.node removeFromParentNode];
        
        redEnvelopeNode *currentNode = (redEnvelopeNode *)hitResult.node;
        [self removeNode:currentNode explosion:NO];
        [self removeNode:currentNode explosion:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addNewNode];
        });
    }
}

//删除红包动画
- (void)removeNode:(SCNNode *)node explosion:(BOOL)explosion {
    
    NSLog(@"动画");
    
    if (explosion) {
        
        SCNParticleSystem * particleSystem = [SCNParticleSystem particleSystemNamed:@"redEnvelope2" inDirectory:nil];
        
        SCNNode * systemNode = [[SCNNode alloc]init];
        
        [systemNode addParticleSystem:particleSystem];
        
        systemNode.position = node.position;
        
        [self.sceneView.scene.rootNode addChildNode:systemNode];
        
    }
    [node removeFromParentNode];
}

#pragma mark - private method
- (void)addNewNode
{
    redEnvelopeNode *node = [redEnvelopeNode new];
    node.position = SCNVector3Make([self randomNumber], [self randomNumber], [self randomZ]);
    [self.sceneView.scene.rootNode addChildNode:node];
}

//随机生成xy坐标
- (CGFloat)randomNumber
{
    CGFloat x;
    CGFloat y = arc4random() % 11;
    x = (5.0 - y) * 0.1;
    return x;
}

//随机生成z坐标
- (CGFloat)randomZ
{
    CGFloat x;
    CGFloat y = arc4random() % 5;
    x = -(5.0 - y) * 0.2;
    return x;
}

@end
