//
//  TPI_EmojiCodePrimaryClass.h
//  EmojiCodes
//
//  Created by Rimas Silkaitis on 5/16/13.
//  Copyright (c) 2013 Rimas Silkaitis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TPI_EmojiCodePrimaryClass : NSObject <THOPluginProtocol>

//- (void)pluginLoadedIntoMemory:(IRCWorld *)world;
- (IRCMessage *)interceptServerInput:(IRCMessage *)input for:(IRCClient *)client;
- (id)interceptUserInput:(id)input command:(NSString *)command;


//- (NSArray *)pluginSupportsUserInputCommands;
//- (void) messageSentByUser:(IRCClient *)client message:(NSString *)messageString command:(NSString *)commandString;

@end
