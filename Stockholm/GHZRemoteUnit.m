//
//  GHZRemoteUnit.m
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#import "GHZRemoteUnit.h"

static NSString *loggableRemoteUnitType(OSType type)
{
    switch (type) {
        case kAudioUnitType_RemoteEffect: return @"kAudioUnitType_RemoteEffect";
        case kAudioUnitType_RemoteGenerator: return @"kAudioUnitType_RemoteGenerator";
        case kAudioUnitType_RemoteInstrument: return @"kAudioUnitType_RemoteInstrument";
        case kAudioUnitType_RemoteMusicEffect: return @"kAudioUnitType_RemoteMusicEffect";
        default: return nil;
    }
}

@implementation GHZRemoteUnit

+ (NSArray *)remoteUnits
{
    NSMutableArray *remoteUnits = [NSMutableArray array];
    
    AudioComponentDescription searchDesc = { 0,0,0,0,0 };
    AudioComponentDescription foundDesc;
    AudioComponent comp = NULL;
    
    while (true) {
        comp = AudioComponentFindNext(comp, &searchDesc);
        if (comp == NULL) {
            break;
        }
        
        if (AudioComponentGetDescription(comp, &foundDesc) == noErr) {
            switch (foundDesc.componentType) {
                case kAudioUnitType_RemoteEffect: {
//                case kAudioUnitType_RemoteGenerator:
//                case kAudioUnitType_RemoteInstrument:
//                case kAudioUnitType_RemoteMusicEffect: {
                    [remoteUnits addObject:[[GHZRemoteUnit alloc] initWithComponent:comp description:foundDesc]];
                }
                default: break;
            }
        }
    }
    
    return remoteUnits;
}

- (id)initWithComponent:(AudioComponent)component description:(AudioComponentDescription)description
{
    self = [super init];
    if (self) {
        _component = component;
        _desc = description;
        
        CFStringRef nameRef;
        AudioComponentCopyName(_component, &nameRef);
        _name = (__bridge_transfer NSString *)nameRef;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: %@ (%@)", [super description], _name, loggableRemoteUnitType(_desc.componentType)];
}

@end
