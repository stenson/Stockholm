//
//  GHZViewController.m
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#import "GHZViewController.h"
#import "GHZAudioController.h"

@interface GHZViewController () {
    GHZAudioController *_audio;
}
@end

@implementation GHZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _audio = [[GHZAudioController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
