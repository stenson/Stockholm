//
//  GHZSpotifyPlaybackManager.m
//  CanOpener
//
//  Created by Robert Stenson on 9/24/13.
//  Copyright (c) 2013 Good Hertz. All rights reserved.
//

#import "GHZSpotifyPlaybackManager.h"

@interface GHZSpotifyPlaybackManager ()<SPPlaybackManagerDelegate> {
}
@end

@implementation GHZSpotifyPlaybackManager

- (id)init
{
    self = [super init];
    if (self) {
        _spAudioController = [[SPCoreAudioController alloc] init];
        _spManager = [[SPPlaybackManager alloc] initWithAudioController:_spAudioController playbackSession:[SPSession sharedSession]];
        _spManager.delegate = self;
    }
    return self;
}

- (BOOL)playing
{
    return _spManager.isPlaying;
}

- (void)playBuffer
{
    if (_spManager.isPlaying) {
        return;
    }
    
//    SPTrack *track = [(GHZSpotifyMediaItem *)_queue.currentItem track];
//    
//    if ([_spManager trackPosition]) {
//        _spManager.isPlaying = YES;
//    } else {
//        [_spManager playTrack:track callback:^(NSError *error) {
//            [_delegate audioPlaybackHasStartedPlayback];
//        }];
//    }
}

- (void)pauseBuffer
{
    if (_spManager.isPlaying) {
        _spManager.isPlaying = NO;
        //[_delegate audioPlaybackHasStoppedPlayback];
    }
}

- (void)loadItemFromQueueToBuffer
{
    [_spManager seekToTrackPosition:0.f];
}

- (void)notifyInitialRoute
{
    
}

- (void)seekInBufferToTimeAsPercentage:(Float32)percentage
{
    [_spManager seekToTrackPosition:(percentage * self.currentTrackDurationInSeconds)];
    //[_delegate audioPlaybackHasStartedPlayback];
}

- (NSTimeInterval)currentTrackDurationInSeconds
{
    return _spManager.currentTrack.duration;
}

- (CGFloat)currentTimeInSeconds
{
    return _spManager.trackPosition;
}

- (CGFloat)currentTimeAsPercentage
{
    return self.currentTimeInSeconds / self.currentTrackDurationInSeconds;
}

#pragma mark - SPPlaybackManagerDelegate

- (void)playbackManagerWillStartPlayingAudio:(SPPlaybackManager *)aPlaybackManager
{
    //[_delegate audioPlaybackWillStartPlaybackWithAudioStreamBasicDescription:_spAudioController.outputAudioDescription];
}

@end
