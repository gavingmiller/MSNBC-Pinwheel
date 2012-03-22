//
//  ViewController.m
//  msnbc
//
//  Created by Gavin Miller on 12-03-06.
//  Copyright (c) 2012 RandomType. All rights reserved.
//

#import "ShowViewController.h"
#import "OBShapedButton.h"

@interface ShowViewController (private)
- (void)addButtonToView:(UIView *)view forImageName:(NSString *)name withIndex:(int)index setEnabledTo:(BOOL)enabled;
- (void)buttonTouched;
- (void)blink:(UIButton *)sender;
- (UIImageView *)show:(UIButton *)sender;
- (void)hide:(UIImageView *)highlight;

- (NSArray *)highlights;
@end

@implementation ShowViewController

- (NSArray *)highlights {
    return [NSArray arrayWithObjects:@"dateline_press.png", @"hardball_press.png", @"meetthepress_press.png", @"morningjoe_press.png", @"nightlynews_press.png", @"rachelmaddow_press.png", @"todayshow_press.png", nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radial_shows_bckg.png"]];
    [self.view addSubview:background];
    
    UIView *pinWheel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 306, 306)];
    CGPoint center = CGPointMake((CGRectGetWidth([self.view bounds]) / 2.0) - 0.75, (CGRectGetHeight([self.view bounds]) / 2.0) + 29.5);
    [pinWheel setCenter:center];
    
    NSArray *shows = [NSArray arrayWithObjects:@"dateline_rest.png", @"hardball_rest.png", @"meetthepress_rest.png", @"morningjoe_rest.png", @"nightlynews_rest.png", @"rachelmaddow_rest.png", @"todayshow_rest.png", nil];
    for (int i = 0; i < [shows count]; i++) {
        NSString *show = [shows objectAtIndex:i];
        [self addButtonToView:pinWheel forImageName:show withIndex:i setEnabledTo:true];
    }

    NSArray *disabledButtons = [NSArray arrayWithObjects:@"shows_disabled0.png", @"shows_disabled1.png", @"shows_disabled2.png", @"shows_disabled3.png", @"shows_disabled4.png", nil];
    for (NSString *disabledButton in disabledButtons) {
        [self addButtonToView:pinWheel forImageName:disabledButton withIndex:-1 setEnabledTo:false];        
    }
    
    [self.view addSubview:pinWheel];
}

#pragma mark -
#pragma mark Private Methods

- (void)addButtonToView:(UIView *)view forImageName:(NSString *)name withIndex:(int)index setEnabledTo:(BOOL)enabled {
    UIButton *button = [OBShapedButton buttonWithType:UIButtonTypeCustom];

    [button setFrame:CGRectMake(0, 0, 306, 306)];
    [button setTag:index];
    [button setUserInteractionEnabled:enabled];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setAdjustsImageWhenHighlighted:false];
    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];

    [view addSubview:button];
}

- (void)buttonTouched:(UIButton *)sender {
    [self blink:sender];
    [self performSelector:@selector(blink:) withObject:sender afterDelay:0.35];
}

- (void)blink:(UIButton *)sender {
    UIImageView *highlight = [self show:sender];
    [self performSelector:@selector(hide:) withObject:highlight afterDelay:0.20];
}

- (UIImageView *)show:(UIButton *)sender {
    int highlightIndex = [sender tag];
    NSString *highlightImageName = [[self highlights] objectAtIndex:highlightIndex];
    UIImageView *highlight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:highlightImageName]];    
    
    highlight.frame = sender.frame;
    [sender addSubview:highlight];
    
    return highlight;
}

- (void)hide:(UIImageView *)highlight {
    [highlight removeFromSuperview];
}

@end
