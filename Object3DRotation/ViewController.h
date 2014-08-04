//
//  ViewController.h
//  Object3DRotation
//
//  Created by cuibosoft on 14-7-29.
//  Copyright (c) 2014年 tridosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NinevehGL/NinevehGL.h>

@interface ViewController : UIViewController <NGLViewDelegate>
{
    NGLMesh *_mesh;
	NGLCamera *_camera;
}

- (IBAction)buttonTouched:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet NGLView *view3D;

@end
