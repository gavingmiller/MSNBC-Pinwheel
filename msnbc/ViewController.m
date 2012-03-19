//
//  ViewController.m
//  msnbc
//
//  Created by Gavin Miller on 12-03-06.
//  Copyright (c) 2012 RandomType. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"radial_shows_bckg.png"]];
    [self.view addSubview:background];
}

@end
