//
//  GHZSpotifyViewController.m
//  CanOpener
//
//  Created by Robert Stenson on 6/5/13.
//  Copyright (c) 2013 Good Hertz. All rights reserved.
//

#import "GHZSpotifyViewController.h"

const uint8_t g_appkey[] = {
	0x01, 0x8A, 0xB2, 0xA3, 0x82, 0x94, 0x68, 0x34, 0x82, 0x98, 0x18, 0x1A, 0xB7, 0x4F, 0xF0, 0xFA,
	0xAA, 0xFF, 0x80, 0x42, 0x50, 0xDB, 0xFD, 0xA2, 0x19, 0xF1, 0x63, 0xF4, 0xB2, 0x4B, 0x70, 0x2C,
	0xB2, 0x20, 0x80, 0xCA, 0xA9, 0x9C, 0x4A, 0x7A, 0x35, 0xD0, 0x35, 0xC8, 0x9A, 0xD3, 0x2D, 0x74,
	0x2C, 0xC8, 0xC9, 0x72, 0x22, 0xA7, 0x73, 0x3B, 0xBD, 0x7B, 0xE7, 0xBE, 0xEF, 0x1F, 0xC5, 0xBC,
	0x45, 0xD9, 0xFE, 0xB8, 0x41, 0xB3, 0x51, 0x1D, 0x95, 0xE1, 0x6B, 0x10, 0xBB, 0xC4, 0x0A, 0x65,
	0x03, 0x14, 0xA7, 0x92, 0x60, 0xE0, 0xD7, 0x28, 0xD4, 0x91, 0x42, 0xEE, 0xF0, 0x86, 0x17, 0x90,
	0xF4, 0x21, 0x1C, 0xD8, 0xD6, 0xA9, 0x03, 0x12, 0xED, 0x45, 0x4D, 0x85, 0xCC, 0xE6, 0x5A, 0x48,
	0xC2, 0x3F, 0x98, 0x54, 0xFB, 0xF9, 0x0A, 0x74, 0xFF, 0x83, 0xAA, 0x29, 0xD6, 0x3F, 0x00, 0x09,
	0xED, 0x75, 0x44, 0x32, 0x04, 0xC8, 0xF0, 0x51, 0xA0, 0x41, 0x57, 0xC2, 0xB1, 0x1F, 0xD0, 0x07,
	0xAE, 0x2A, 0xE5, 0x3D, 0xF9, 0xD9, 0x4B, 0xE3, 0x0B, 0x43, 0xB1, 0x9E, 0xC9, 0xB4, 0x0A, 0xD4,
	0x9A, 0x16, 0x6B, 0x3E, 0x61, 0x7E, 0x9C, 0x28, 0x1B, 0x34, 0x9E, 0x44, 0x7D, 0xCF, 0xC3, 0xC3,
	0x1B, 0x95, 0xC8, 0xAD, 0x63, 0x2C, 0xBA, 0x9E, 0x2B, 0xDF, 0xF8, 0x00, 0xCD, 0x65, 0x7F, 0xF5,
	0x89, 0xCE, 0xFA, 0xB9, 0xB1, 0x79, 0x70, 0xCC, 0xDD, 0xC5, 0xD6, 0x70, 0xC4, 0xC2, 0x75, 0x9B,
	0xEF, 0x66, 0x68, 0x42, 0x77, 0x6C, 0xB9, 0x0F, 0x56, 0xB4, 0xAD, 0x2A, 0xF2, 0x7E, 0xFC, 0xE0,
	0x8D, 0x24, 0x5F, 0xF8, 0xEA, 0xA0, 0xF7, 0x13, 0xB1, 0x25, 0xBE, 0x24, 0x61, 0x7E, 0xE0, 0x83,
	0xED, 0x92, 0x46, 0x96, 0x25, 0xD1, 0x6E, 0x07, 0xD4, 0xCB, 0xC1, 0xA5, 0xA9, 0x57, 0xF6, 0x0E,
	0xDF, 0x55, 0xE6, 0x59, 0x82, 0xD3, 0xD3, 0xE5, 0xF5, 0x4B, 0x3A, 0x80, 0xB4, 0xE2, 0x80, 0x5D,
	0x87, 0xC7, 0x33, 0x8A, 0x7C, 0xBE, 0x0B, 0x30, 0x09, 0x55, 0xDC, 0x09, 0xEC, 0x08, 0xA3, 0x78,
	0x64, 0xC0, 0xBB, 0xE4, 0xB5, 0x02, 0x95, 0xF2, 0x67, 0xEB, 0xF0, 0x23, 0xC4, 0xBE, 0x42, 0x0B,
	0x96, 0xEC, 0x6B, 0x49, 0x6E, 0x48, 0x47, 0xC2, 0x2E, 0xBD, 0x7B, 0x92, 0x80, 0x64, 0x51, 0x7D,
	0xD8,
};
const size_t g_appkey_size = sizeof(g_appkey);

#define SPOTIFY_CREDENTIAL_KEY @"StockholmSpotifyLoginCredentials"
#define LOOK_A_PY_PY @"spotify:track:5x9239aGsatbpoPHSbDXBv"
#define YOU_AND_ME @"spotify:track:4GJ3h5jNmpETBwKJzUWioB"
#define CARS_TOO @"spotify:track:6fkigNET3MGAemBavPZVgS"
#define PEG @"spotify:track:28XbqAYJMf4oT4MkBP91nT"
#define MENAHAN @"spotify:track:0kxFVCOcAV3Rwwes2f1SSd"
#define DAWNED_ON_ME @"spotify:track:3Zb3eoZna6c3dSI3BpXEEi"
#define CATHARTIC @"spotify:track:5wd7YixwaRymjHxkjBn1cX"
#define CURRENT_TRACK MENAHAN

@interface GHZSpotifyViewController ()<UITableViewDataSource, UITableViewDelegate> {
    UITableView *_choices;
    NSArray *_uriCollection;
    UIActivityIndicatorView *_activity;
    NSArray *_playlists;
    NSArray *_tracks;
}

@end

@implementation GHZSpotifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _uriCollection = @[LOOK_A_PY_PY, YOU_AND_ME, CARS_TOO, PEG, MENAHAN, DAWNED_ON_ME, CATHARTIC];
        
        _choices = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _choices.dataSource = self;
        _choices.delegate = self;
        [self.view addSubview:_choices];
        
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activity.hidden = YES;
        _activity.backgroundColor = [UIColor colorWithWhite:0.2f alpha:0.7f];
        [self.view addSubview:_activity];
        
        [_choices registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _choices.frame = self.view.bounds;
    _activity.frame = self.view.bounds;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSError *error;
    [SPSession initializeSharedSessionWithApplicationKey:[NSData dataWithBytes:&g_appkey length:g_appkey_size]
                                               userAgent:@"com.goodhertz.CanOpener"
                                           loadingPolicy:SPAsyncLoadingImmediate
                                                   error:&error];
    [SPSession sharedSession].delegate = self;
    
    if (error != nil) {
        NSLog(@"spotify session init error: %@", error);
    }
    
    NSDictionary *credentials = [[NSUserDefaults standardUserDefaults] objectForKey:SPOTIFY_CREDENTIAL_KEY];
    if (credentials) {
        [[SPSession sharedSession] attemptLoginWithUserName:credentials[@"userName"] existingCredential:credentials[@"credential"]];
    } else {
        [self performSelector:@selector(showLoginView) withObject:nil afterDelay:1.f];
    }
}

- (void)filterWithArguments:(NSDictionary *)arguments
{
    NSLog(@"FILTER");
}

-(void)showLoginView {
	SPLoginViewController *controller = [SPLoginViewController loginControllerForSession:[SPSession sharedSession]];
	controller.allowsCancel = YES;
	controller.loginDelegate = self;
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)pickTrack:(SPTrack *)track
{
    [_activity stopAnimating];
    _activity.hidden = YES;
    
    [_delegate spotifyViewController:self didSelectTracks:@[track]];
}

- (void)playTrack:(SPTrack *)track
{
    [SPAsyncLoading waitUntilLoaded:track timeout:kSPAsyncLoadingDefaultTimeout then:^(NSArray *loadedItems, NSArray *notLoadedItems) {
        [SPAsyncLoading waitUntilLoaded:track.album.cover timeout:kSPAsyncLoadingDefaultTimeout then:^(NSArray *loadedItems, NSArray *notLoadedItems) {
            [self pickTrack:track];
        }];
    }];
}

- (void)loadTracksFromPlaylist:(SPPlaylist *)playlist
{
    _tracks = [self tracksFromPlaylistItems:playlist.items];
    [_choices reloadData];
}

- (NSArray *)tracksFromPlaylistItems:(NSArray *)items {
	
	NSMutableArray *tracks = [NSMutableArray arrayWithCapacity:items.count];
	
	for (SPPlaylistItem *anItem in items) {
		if (anItem.itemClass == [SPTrack class]) {
			[tracks addObject:anItem.item];
		}
	}
	
	return [NSArray arrayWithArray:tracks];
}

- (void)loadPlaylist
{
    [SPAsyncLoading waitUntilLoaded:[SPSession sharedSession] timeout:kSPAsyncLoadingDefaultTimeout then:^(NSArray *loadedItems, NSArray *notLoadedItems) {
        [SPAsyncLoading waitUntilLoaded:[SPSession sharedSession].userPlaylists timeout:kSPAsyncLoadingDefaultTimeout then:^(NSArray *loadedItems, NSArray *notLoadedItems) {
            [SPAsyncLoading waitUntilLoaded:[SPSession sharedSession].userPlaylists.playlists timeout:kSPAsyncLoadingDefaultTimeout then:^(NSArray *loadedItems, NSArray *notLoadedItems) {
                _playlists = loadedItems;
                [_choices reloadData];
            }];
        }];
    }];
}

#pragma mark - SPLoginViewControllerDelegate

- (void)loginViewController:(SPLoginViewController *)controller didCompleteSuccessfully:(BOOL)didLogin
{
    if (didLogin) {
        [self loadPlaylist];
    } else {
        NSLog(@"nope");
    }
}

#pragma mark - SPSessionDelegate

- (void)session:(SPSession *)aSession didGenerateLoginCredentials:(NSString *)credential forUserName:(NSString *)userName
{
    [[NSUserDefaults standardUserDefaults] setObject:@{@"userName":userName, @"credential":credential} forKey:SPOTIFY_CREDENTIAL_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)sessionDidLoginSuccessfully:(SPSession *)aSession
{
    [self loadPlaylist];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tracks ? _tracks.count : _playlists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (_tracks) {
        SPTrack *track = _tracks[indexPath.row];
        cell.textLabel.text = track.name;
    } else {
        SPPlaylist *playlist = _playlists[indexPath.row];
        cell.textLabel.text = playlist.name;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (_tracks) {
        [self playTrack:(SPTrack *)_tracks[indexPath.row]];
    } else {
        [self loadTracksFromPlaylist:(SPPlaylist *)_playlists[indexPath.row]];
    }
    
//    _activity.hidden = NO;
//    [_activity startAnimating];
}

@end
