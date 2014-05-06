//
//  IPViewController.m
//  SnowFallDeMo
//
//  Created by batch 1 on 5/6/14.
//  Copyright (c) 2014 ilesh. All rights reserved.
//

#import "IPViewController.h"
#define IMAGE_X                arc4random()%(int)Main_Screen_Width
#define IMAGE_ALPHA            ((float)(arc4random()%10))/10
#define IMAGE_WIDTH            arc4random()%20 + 10
#define PLUS_HEIGHT            Main_Screen_Height/25

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

@interface IPViewController ()

@end

@implementation IPViewController
static int i = 0;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    
	imagesArray = [[NSMutableArray alloc] init];
    /// ADD THE VALUES IN ARRAY
    for (int i = 0; i < 20; ++ i) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow.png"]];
        float x = IMAGE_WIDTH;
        imageView.frame = CGRectMake(IMAGE_X, -30, x, x);
        imageView.alpha = IMAGE_ALPHA;
        [self.view addSubview:imageView];
        [imagesArray addObject:imageView];
    }
   ///// TIMER MEHTOD IN VIEW
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(makeSnow) userInfo:nil repeats:YES];

}
        ///CREATE PREPAR
- (void)makeSnow
{
    i = i + 1;
    if ([imagesArray count] > 0) {
        UIImageView *imageView = [imagesArray objectAtIndex:0];
        imageView.tag = i;
        [imagesArray removeObjectAtIndex:0];
        [self snowFall:imageView];
    }
    
} //// FALL DOWN IMAGE 
- (void)snowFall:(UIImageView *)aImageView
{
    [UIView beginAnimations:[NSString stringWithFormat:@"%i",aImageView.tag] context:nil];
    [UIView setAnimationDuration:6];
    [UIView setAnimationDelegate:self];
    aImageView.frame = CGRectMake(aImageView.frame.origin.x, Main_Screen_Height, aImageView.frame.size.width, aImageView.frame.size.height);
    NSLog(@"%@",aImageView);
    [UIView commitAnimations];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:[animationID intValue]];
    float x = IMAGE_WIDTH;
    imageView.frame = CGRectMake(IMAGE_X, -30, x, x);
    [imagesArray addObject:imageView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
