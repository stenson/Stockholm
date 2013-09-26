//
//  GHZSpotifyViewController.h
//  CanOpener
//
//  Created by Robert Stenson on 6/5/13.
//  Copyright (c) 2013 Good Hertz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaLibSpotify.h"

@class GHZSpotifyViewController;

@protocol GHZSpotifyViewControllerDelegate <NSObject>

- (void)spotifyViewController:(GHZSpotifyViewController *)controller didSelectTracks:(NSArray *)tracks;

@end

@interface GHZSpotifyViewController : UIViewController<SPLoginViewControllerDelegate, SPSessionDelegate>

@property (nonatomic, weak) id<GHZSpotifyViewControllerDelegate> delegate;

@end
