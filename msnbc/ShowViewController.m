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
- (void)addButtonToView:(UIView *)view forImageName:(NSString *)name setEnabledTo:(BOOL)enabled;
- (void)buttonTouched;
- (void)blink:(UIButton *)sender;
- (void)show:(UIButton *)sender;
- (void)hide;
@end

@implementation ShowViewController

@synthesize highlight = _highlight;

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radial_shows_bckg.png"]];
    [self.view addSubview:background];
    
    UIView *pinWheel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 306, 306)];
    CGPoint center = CGPointMake((CGRectGetWidth([self.view bounds]) / 2.0) - 0.75, (CGRectGetHeight([self.view bounds]) / 2.0) + 29.5);
    [pinWheel setCenter:center];
    
    NSArray *shows = [NSArray arrayWithObjects:@"dateline_rest.png", @"hardball_rest.png", @"meetthepress_rest.png", @"morningjoe_rest.png", @"nightlynews_rest.png", @"rachelmaddow_rest.png", @"todayshow_rest.png", nil];
    for (NSString *show in shows) {
        [self addButtonToView:pinWheel forImageName:show setEnabledTo:true];
    }

    NSArray *disabledButtons = [NSArray arrayWithObjects:@"shows_disabled0.png", @"shows_disabled1.png", @"shows_disabled2.png", @"shows_disabled3.png", @"shows_disabled4.png", nil];
    for (NSString *disabledButton in disabledButtons) {
        [self addButtonToView:pinWheel forImageName:disabledButton setEnabledTo:false];        
    }
    
    [self.view addSubview:pinWheel];
}

#pragma mark -
#pragma mark Private Methods

- (void)addButtonToView:(UIView *)view forImageName:(NSString *)name setEnabledTo:(BOOL)enabled {
    UIButton *button = [OBShapedButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 306, 306);
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    button.userInteractionEnabled = enabled;
    button.adjustsImageWhenHighlighted = false;
    [view addSubview:button];
}

// Make this code more robust without the need to hold onto the highlight image.
// http://stackoverflow.com/questions/1584455/how-to-use-performselectorwithobjectafterdelay-on-a-method-with-multiple-argu
- (void)buttonTouched:(UIButton *)sender {
    NSLog(@"%@", sender);
    self.highlight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hardball_press.png"]];    

    [self blink:sender];
    [self performSelector:@selector(blink:) withObject:sender afterDelay:0.35];
}

- (void)blink:(UIButton *)sender {
    [self show:sender];
    [self performSelector:@selector(hide) withObject:nil afterDelay:0.20];
}

- (void)show:(UIButton *)sender {
    self.highlight.frame = sender.frame;
    [sender addSubview:self.highlight];
}

- (void)hide {
    [self.highlight removeFromSuperview];
}

@end
