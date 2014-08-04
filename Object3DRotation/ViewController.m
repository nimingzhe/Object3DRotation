//
//  ViewController.m
//  Object3DRotation
//
//  Created by cuibosoft on 14-7-29.
//  Copyright (c) 2014年 tridosoft. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view3D.delegate=self;
    
    self.view3D.backgroundColor=nil;
    nglGlobalColorFormat(NGLColorFormatRGBA);
    nglGlobalFlush();
    
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              //							  kNGLMeshCentralizeYes,
                              //                              kNGLMeshKeyCentralize,
                              kNGLMeshOriginalYes,
                              kNGLMeshKeyOriginal,
							  @"0.1",
                              kNGLMeshKeyNormalize,
							  nil];
	
	_mesh = [[NGLMesh alloc] initWithFile:@"cube.obj" settings:settings delegate:nil];
    
    
    //    _mesh.x=0.3;
    //    _mesh.y=0.3;
    //    _mesh.z=0;
	
	_camera = [[NGLCamera alloc] initWithMeshes:_mesh, nil];
	
    _camera.aspectRatio=1024/768.0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - NGLViewDelegate
- (void) drawView
{

    
	if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        ([UIScreen mainScreen].scale == 2.0)) {
        // Retina display
        self.view3D.antialias=NGLAntialias4X;
        self.view3D.contentScaleFactor=2;
    } else {
        // non-Retina display
    }
    
	[_camera drawCamera];
}

- (IBAction)buttonTouched:(id)sender {
    NSLog(@"touched");
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touchA;
	CGPoint pointA, pointB;
	
	// Pan gesture.
	if ([touches count] == 1)
	{
		touchA = [[touches allObjects] objectAtIndex:0];
		pointA = [touchA locationInView:self.view3D];
		pointB = [touchA previousLocationInView:self.view3D];
		
		float x = (pointA.x - pointB.x);
        //		_position.y = (pointA.y - pointB.y);
        //        if (fabs(_position.x)>fabs(_position.y)) {
        //            _mesh.rotateY += _position.x;
        //
        //        }
        //        else
        //        {
        //            _mesh.rotateX +=_position.y ;
        //            if (_mesh.rotateX>60) {
        //                _mesh.rotateX=60;
        //            }
        //            if (_mesh.rotateX<-60) {
        //                _mesh.rotateX=-60;
        //            }
        //
        //        }
        
        _mesh.rotateY += x;
        
	}
}

- (void)dealloc
{
    NSLog(@"dealloc");
    
}

@end
