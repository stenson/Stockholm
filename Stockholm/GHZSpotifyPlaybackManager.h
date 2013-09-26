//
//  GHZSpotifyPlaybackManager.h
//  CanOpener
//
//  Created by Robert Stenson on 9/24/13.
//  Copyright (c) 2013 Good Hertz. All rights reserved.
//

#import "CocoaLibSpotify.h"

@interface GHZSpotifyPlaybackManager : NSObject

@property (nonatomic, strong) SPPlaybackManager *spManager;
@property (nonatomic, strong) SPCoreAudioController *spAudioController;

@end
