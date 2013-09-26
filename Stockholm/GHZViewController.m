//
//  GHZViewController.m
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#import "GHZViewController.h"
#import "GHZAudioController.h"
#import "GHZSpotifyViewController.h"

@interface GHZViewController ()<GHZSpotifyViewControllerDelegate> {
    GHZAudioController *_audio;
    GHZSpotifyViewController *_spotifyLibrary;
}
@end

@implementation GHZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _audio = [[GHZAudioController alloc] init];
    _spotifyLibrary = [[GHZSpotifyViewController alloc] initWithNibName:nil bundle:nil];
    _spotifyLibrary.delegate = self;
    
    [self performSelector:@selector(presentSpotifyLibrary) withObject:nil afterDelay:1.f];
}

- (void)presentSpotifyLibrary
{
    [self presentViewController:_spotifyLibrary animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - GHZSpotifyViewControllerDelegate

- (void)spotifyViewController:(GHZSpotifyViewController *)controller didSelectTracks:(NSArray *)tracks
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [_audio playSpotifyTrack:tracks[0]];
}

@end
