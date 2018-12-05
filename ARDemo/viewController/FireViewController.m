//
//  FireViewController.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/11/30.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "FireViewController.h"

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface FireViewController ()<ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *SCNView;
@property (strong, nonatomic) IBOutlet UIButton *redEnvelope;
@property (strong, nonatomic) IBOutlet UIButton *fire;

@property (nonatomic, strong) SCNNode *fireNode;
@property (nonatomic, strong) SCNNode *redEnvelopeNode;

@end

@implementation FireViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.SCNView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.SCNView.session pause];
}

- (IBAction)redEnvelopeDidTouched:(id)sender
{
    [self.fireNode removeFromParentNode];
    if (self.redEnvelopeNode) {
        [self.SCNView.scene.rootNode addChildNode:self.redEnvelopeNode];
    }else{
        SCNParticleSystem * particleSystem = [SCNParticleSystem particleSystemNamed:@"redEnvelope" inDirectory:nil];
        SCNNode * systemNode = [[SCNNode alloc]init];
        [systemNode addParticleSystem:particleSystem];
        systemNode.position = SCNVector3Make(0, 0, -10);
        self.redEnvelopeNode = systemNode;
        [self.SCNView.scene.rootNode addChildNode:systemNode];
    }
}
- (IBAction)fireButtonDidTouched:(id)sender
{
    [self.redEnvelopeNode removeFromParentNode];
    if (self.fireNode) {
        [self.SCNView.scene.rootNode addChildNode:self.fireNode];
    }else{
        SCNParticleSystem * particleSystem = [SCNParticleSystem particleSystemNamed:@"fire" inDirectory:nil];
        SCNNode * systemNode = [[SCNNode alloc]init];
        [systemNode addParticleSystem:particleSystem];
        systemNode.position = SCNVector3Make(0, 0, -10);
        self.fireNode = systemNode;
        [self.SCNView.scene.rootNode addChildNode:systemNode];
    }
}

@end
