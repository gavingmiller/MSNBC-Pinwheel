//
//  ViewController.m
//  msnbc
//
//  Created by Gavin Miller on 12-03-06.
//  Copyright (c) 2012 RandomType. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController (private)
- (void)addImageToView:(UIView *)view forImageName:(NSString *)name;
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radial_shows_bckg.png"]];
    [self.view addSubview:background];
    
    UIView *pinWheel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 306, 306)];
    CGPoint center = CGPointMake((CGRectGetWidth([self.view bounds]) / 2.0) - 0.75, (CGRectGetHeight([self.view bounds]) / 2.0) + 29.5);
    [pinWheel setCenter:center];
    
    NSArray *shows = [NSArray arrayWithObjects:@"dateline_rest.png", @"hardball_rest.png", @"meetthepress_rest.png", @"morningjoe_rest.png", @"nightlynews_rest.png", @"rachelmaddow_rest.png", @"shows_disabled0.png", @"shows_disabled1.png", @"shows_disabled2.png", @"shows_disabled3.png", @"shows_disabled4.png", @"todayshow_rest.png", nil];
    for (NSString *show in shows) {
        [self addImageToView:pinWheel forImageName:show];
    }
    
    [self.view addSubview:pinWheel];
    

}

#pragma mark -
#pragma mark Private Methods

- (void)addImageToView:(UIView *)view forImageName:(NSString *)name {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 306, 306);
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"todayshow_press.png"] forState:UIControlStateHighlighted];
    [view addSubview:button];
}

@end
