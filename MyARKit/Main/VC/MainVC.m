//
//  MainVC.m
//  MyARKit
//
//  Created by alankong on 2017/11/13.
//  Copyright © 2017年 tuotiansudai. All rights reserved.
//

#import "MainVC.h"

@interface MainVC () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;
@property (nonatomic, strong) UIButton* btnCaptureVideo;
@property (nonatomic, assign) BOOL isCapturing;
@property (nonatomic, strong) UIButton* btn3DText;
@property (nonatomic, strong) UIButton* btnEmoji;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideNavgationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
    [self layoutSubviews];
    [self setupListeners];
}

- (void)setupViews {
    self.sceneView = [[ARSCNView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.sceneView];
    self.sceneView.delegate = self;
#ifdef DEBUG
    self.sceneView.showsStatistics = YES;
#endif
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    self.sceneView.scene = scene;
    
    //
    self.btnCaptureVideo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self.view addSubview:self.btnCaptureVideo];
    [self.btnCaptureVideo setTitle:@"拍摄" forState:UIControlStateNormal];
    self.btnCaptureVideo.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    
    //
    self.btn3DText =  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.view addSubview:self.btn3DText];
    self.btn3DText.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.btn3DText setTitle:@"3D文字" forState:UIControlStateNormal];
    self.btn3DText.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    
    //
    self.btnEmoji =  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.view addSubview:self.btnEmoji];
    self.btnEmoji.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.btnEmoji setTitle:@"Emoji" forState:UIControlStateNormal];
    self.btnEmoji.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
}

- (void)layoutSubviews
{
    self.btnCaptureVideo.centerX = self.view.width/2;
    self.btnCaptureVideo.bottom = self.view.height-50;
    
    self.btn3DText.right = self.btnCaptureVideo.left-30;
    self.btn3DText.centerY = self.btnCaptureVideo.centerY;
    
    self.btnEmoji.left = self.btnCaptureVideo.right+30;
    self.btnEmoji.centerY = self.btnCaptureVideo.centerY;
}

- (void)setupListeners {
    [self.btnCaptureVideo addTarget:self action:@selector(btnCaptureAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn3DText addTarget:self action:@selector(btn3DTextAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnEmoji addTarget:self action:@selector(btnEmojiAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnCaptureAction
{
    if (self.isCapturing) {
        NSLog(@"停止拍摄");
        [self.btnCaptureVideo setTitle:@"拍摄" forState:UIControlStateNormal];
    } else {
        NSLog(@"拍摄");
        [self.btnCaptureVideo setTitle:@"停止" forState:UIControlStateNormal];
    }
    
    self.isCapturing = !self.isCapturing;
}

- (void)btn3DTextAction
{
    if (self.isCapturing) {
        return;
    }
    NSLog(@"3D文字");
    
    SCNNode* childNode = [SCNNode node];
    childNode.position = SCNVector3Make(-0.2, 0, -1);
    childNode.scale = SCNVector3Make(0.02, 0.02, 0.02);
    SCNText* text = [SCNText textWithString:@"双击修改" extrusionDepth:0.05];
    text.firstMaterial.diffuse.contents = [UIColor blueColor];
    text.font = [UIFont appLanTingBoldFont:5];
    childNode.geometry = text;
    [self.sceneView.scene.rootNode addChildNode:childNode];
}

- (void)btnEmojiAction
{
    if (self.isCapturing) {
        return;
    }
    NSLog(@"Emoji");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.sceneView.session pause];
}

#pragma mark - ARSCNViewDelegate

 // Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
    
    // Add geometry to the node...
    
    return node;
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

@end
