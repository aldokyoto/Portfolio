//
//  ProfileViewController.h
//  Portfolio
//
//  Created by Aldo Mateos on 10/8/15.
//  Copyright (c) 2015 Aldo Kyoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;
double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

@interface ProfileViewController : UIViewController


@property (strong, nonatomic) UIDynamicAnimator *animator;


@property (strong, nonatomic) IBOutlet UIImageView *ojoBubble;
@property (strong, nonatomic) IBOutlet UIImageView *mariaSarmiento;


@property (strong, nonatomic) CMMotionManager *motionManager;



@end
