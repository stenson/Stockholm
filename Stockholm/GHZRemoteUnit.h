//
//  GHZRemoteUnit.h
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface GHZRemoteUnit : NSObject

+ (NSArray *)remoteUnits;
- (id)initWithComponent:(AudioComponent)component description:(AudioComponentDescription)description;

@property (nonatomic) NSString *name;
@property (nonatomic) AudioComponentDescription desc;
@property (nonatomic) AudioComponent component;
@property (nonatomic) AudioUnit unit;

@end
