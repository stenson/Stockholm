//
//  GHZAudioController.m
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#import "GHZAudioController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "GHZRemoteUnit.h"
#import "AudioUtilities.h"

@interface GHZAudioController ()<SPPlaybackManagerDelegate> {
    NSArray *_remoteUnits;
    SPCoreAudioController *_spAudioController;
    SPPlaybackManager *_spPlaybackManager;
}
@end

@implementation GHZAudioController

- (id)init
{
    self = [super init];
    if (self) {
//        _remoteUnits = [GHZRemoteUnit remoteUnits];
//        NSLog(@"remote units: %@", _remoteUnits);
        
//        [[NSNotificationCenter defaultCenter] addObserverForName:(NSString *)kAudioComponentRegistrationsChangedNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
//            self->_remoteUnits = [GHZRemoteUnit remoteUnits];
//        }];
    }
    return self;
}
         
- (void)activateAudioSession
{
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
//    GHZRemoteUnit *remoteEffect = _remoteUnits[0];
//    AudioUnit effectUnit;
//    CheckError(AudioComponentInstanceNew(remoteEffect.component, &effectUnit), "instance");
//    remoteEffect.unit = effectUnit;
//    
//    AudioStreamBasicDescription format;
//    format.mChannelsPerFrame = 2;
//    format.mSampleRate = [[AVAudioSession sharedInstance] sampleRate];
//    format.mFormatID = kAudioFormatLinearPCM;
//    format.mFormatFlags = kAudioFormatFlagsNativeFloatPacked | kAudioFormatFlagIsNonInterleaved;
//    format.mBytesPerFrame = format.mBytesPerPacket = sizeof(Float32);
//    format.mBitsPerChannel = 32;
//    format.mFramesPerPacket = 1;
//    
//    CheckError(AudioUnitSetProperty(effectUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Output, 0, &format, sizeof(format)), "output");
//    CheckError(AudioUnitSetProperty(effectUnit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input, 0, &format, sizeof(format)), "input");
    
    //CheckError(AudioUnitInitialize(effectUnit), "initialize");
}

- (void)playSpotifyTrack:(SPTrack *)track
{
    [self activateAudioSession];
    
    _spAudioController = [[SPCoreAudioController alloc] init];
    
    AURenderCallbackStruct callback;
    callback.inputProc = StockholmProcessingCallback;
    callback.inputProcRefCon = (__bridge void *)self;
    
    _spAudioController.customDSPCallbackStruct = callback;
    
    _spPlaybackManager = [[SPPlaybackManager alloc] initWithAudioController:_spAudioController playbackSession:[SPSession sharedSession]];
    _spPlaybackManager.delegate = self;
    
    [_spPlaybackManager playTrack:track callback:nil];
}

#pragma mark - SPPlaybackManagerDelegate

- (void)playbackManagerWillStartPlayingAudio:(SPPlaybackManager *)aPlaybackManager
{
    
}

#pragma mark - C Render Callback

static OSStatus StockholmProcessingCallback(void *							inRefCon,
                                            AudioUnitRenderActionFlags *	ioActionFlags,
                                            const AudioTimeStamp *			inTimeStamp,
                                            UInt32							inBusNumber,
                                            UInt32							inNumberFrames,
                                            AudioBufferList *				ioData)
{
    GHZAudioController *self = (__bridge GHZAudioController *)inRefCon;
    NSLog(@"hello %@", self);
    return noErr;
}

@end
