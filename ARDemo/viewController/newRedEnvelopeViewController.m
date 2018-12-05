//
//  newRedEnvelopeViewController.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/12/1.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "newRedEnvelopeViewController.h"

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

#import "redEnvelopeNode.h"

@interface newRedEnvelopeViewController ()<ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *sceneView;

@end

@implementation newRedEnvelopeViewController

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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ViewDidTapped)];
    [self.sceneView addGestureRecognizer:tapGesture];
}

#pragma mark - private method
- (void)ViewDidTapped
{
    redEnvelopeNode *node = [redEnvelopeNode new];
    node.position = SCNVector3Make([self randomNumber], [self randomNumber], [self randomNumber]);
    [self.sceneView.scene.rootNode addChildNode:node];
}

//随机生成坐标
- (CGFloat)randomNumber
{
    CGFloat x;
    CGFloat y = arc4random() % 11;
    x = (5.0 - y) * 0.1;
    return x;
}

@end
