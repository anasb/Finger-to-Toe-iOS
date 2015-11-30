//
//  CameraViewController.m
//  Finger To Toe
//
//  Created by Anas Bouzoubaa on 29/11/15.
//  Copyright © 2015 Small Data Lab. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface CameraViewController ()

@property (strong, nonatomic) IBOutlet UIView *cameraView;
@property (strong, nonatomic) IBOutlet UIView *instructionsview;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cameraView.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setupCamera];
    [self setupInstructions];
}

- (void)setupCamera
{
    AVCaptureSession *session                = [[AVCaptureSession alloc] init];
    session.sessionPreset                    = AVCaptureSessionPresetPhoto;
    AVCaptureVideoPreviewLayer *captureLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    captureLayer.videoGravity                = AVLayerVideoGravityResizeAspectFill;
    captureLayer.bounds                      = self.view.layer.bounds;//self.cameraView.layer.bounds;
    captureLayer.position                    = CGPointMake(CGRectGetMidX(self.view.layer.bounds), CGRectGetMidY(self.view.layer.bounds));
    [self.cameraView.layer addSublayer:captureLayer];
    
    AVCaptureDevice *device                  = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error                           = nil;
    AVCaptureDeviceInput *input              = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        NSLog(@"ERROR: trying to open camera: %@", error);
    } else {
        [session addInput:input];
        [session startRunning];
    }
}

- (void)setupInstructions
{
    // Rotate
    double rads = DEGREES_TO_RADIANS(90);
    CGAffineTransform transform = CGAffineTransformRotate(self.instructionsview.transform, rads);
    self.instructionsview.transform = transform;
}

@end
