//
//  SystemARDemoViewController.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/11/30.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "SystemARDemoViewController.h"

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface SystemARDemoViewController ()<ARSCNViewDelegate>

@property (strong, nonatomic) IBOutlet ARSCNView *SCNView;

@end

@implementation SystemARDemoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    // Run the view's session
    [self.SCNView.session runWithConfiguration:configuration];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.SCNView.delegate = self;
    
    // Show statistics such as fps and timing information
    self.SCNView.showsStatistics = YES;
    
    // Create a new scene
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    
    // Set the scene to the view
    self.SCNView.scene = scene;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.SCNView.session pause];
}

@end
