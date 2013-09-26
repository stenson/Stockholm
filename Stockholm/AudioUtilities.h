//
//  AudioUtilities.h
//  Stockholm
//
//  Created by Robert Stenson on 9/26/13.
//  Copyright (c) 2013 GHz. All rights reserved.
//

#ifndef Stockholm_AudioUtilities_h
#define Stockholm_AudioUtilities_h

static void CheckError(OSStatus error, const char *operation)
{
	if (error == noErr) return;
	char str[20];
	*(UInt32 *)(str + 1) = CFSwapInt32HostToBig(error);
	if (isprint(str[1]) && isprint(str[2]) && isprint(str[3]) && isprint(str[4])) {
		str[0] = str[5] = '\'';
		str[6] = '\0';
	} else {
		sprintf(str, "%d", (int)error);
    }
	fprintf(stderr, "Error: %s (%s)\n", operation, str);
}

static void PrintASBD(AudioStreamBasicDescription asbd)
{
    char formatIDString[5];
    UInt32 formatID = CFSwapInt32HostToBig (asbd.mFormatID);
    bcopy (&formatID, formatIDString, 4);
    formatIDString[4] = '\0';
    
    if (asbd.mFormatFlags & kAudioFormatFlagIsSignedInteger) {
        NSLog(@"INTEGER");
    } else if (asbd.mFormatFlags & kAudioFormatFlagIsFloat) {
        NSLog(@"FLOAT");
    }
    
    if (asbd.mFormatFlags & kAudioFormatFlagIsNonInterleaved) {
        NSLog(@"NON-INTERLEAVED");
    } else {
        NSLog(@"INTERLEAVED");
    }
    
    NSLog (@"  Sample Rate:         %10.0f",  asbd.mSampleRate);
    NSLog (@"  Format ID:           %10s",    formatIDString);
    NSLog (@"  Format Flags:        %10lu",    asbd.mFormatFlags);
    NSLog (@"  Bytes per Packet:    %10lu",    asbd.mBytesPerPacket);
    NSLog (@"  Frames per Packet:   %10lu",    asbd.mFramesPerPacket);
    NSLog (@"  Bytes per Frame:     %10lu",    asbd.mBytesPerFrame);
    NSLog (@"  Channels per Frame:  %10lu",    asbd.mChannelsPerFrame);
    NSLog (@"  Bits per Channel:    %10lu",    asbd.mBitsPerChannel);
}

#endif
