//
//  ProfileViewController.m
//  Portfolio
//
//  Created by Aldo Mateos on 10/8/15.
//  Copyright (c) 2015 Aldo Kyoto. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"eye"];
 
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
    // Acelerometro
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
    
    
    // Acelerometro FIN
    
    self.view.backgroundColor = [UIColor magentaColor];
    self.animator =[[UIDynamicAnimator alloc]initWithReferenceView:self.view];

    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.ojoBubble]];
    
    [self.animator addBehavior:gravity];
    
    gravity.gravityDirection = CGVectorMake(0, 0.2);
    
    UICollisionBehavior *viewBoundaries = [[UICollisionBehavior alloc]initWithItems:@[self.ojoBubble, self.mariaSarmiento]];
    
    viewBoundaries.translatesReferenceBoundsIntoBoundary = YES;
    
    UIDynamicItemBehavior *dynamicBehavior = [[UIDynamicItemBehavior alloc] initWithItems: @[self.ojoBubble, self.mariaSarmiento]];
    [dynamicBehavior setDensity: 1];
    [dynamicBehavior setElasticity: 0.5];
    [dynamicBehavior setFriction: 0.0];
    [dynamicBehavior setResistance: 0.0];
    
    
    [self.animator addBehavior:viewBoundaries];
    [self.animator addBehavior: dynamicBehavior];
    
    
    
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
    
    
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
        
    }
   
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
   
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    

    
}
-(void)outputRotationData:(CMRotationRate)rotation
{
    
   
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
  
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
