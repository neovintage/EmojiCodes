//
//  TPI_EmojiCodePrimaryClass.m
//  EmojiCodes
//
//  Created by Rimas Silkaitis on 5/16/13.
//  Copyright (c) 2013 Rimas Silkaitis. All rights reserved.
//

#import "TPI_EmojiCodePrimaryClass.h"

@implementation TPI_EmojiCodePrimaryClass

- (IRCMessage *)interceptServerInput:(IRCMessage *)input for:(IRCClient *)client
{
    /* Only handle regular messages */
	if ([input.command isEqualToString:IRCPrivateCommandIndex("privmsg")] == NO) {
		return input;
	}
    
 	NSString *message = [input.params safeObjectAtIndex:1];
    
    /* Convert to attributed string. */
	NSAttributedString *finalResult = [NSAttributedString emptyStringWithBase:message];

	/* Do the actual convert. */
	finalResult = [NSString emojizeAttributedString:finalResult];

	/* Replace old message. */
	NSMutableArray *newParams = [input.params mutableCopy];

	[newParams removeObjectAtIndex:1];

	/* Insert new message. */
	[newParams insertObject:[finalResult string] atIndex:1];

	input.params = newParams;

	/* Return new message. */
	return input;
}

- (id)interceptUserInput:(id)input command:(NSString *)command
{
    NSAttributedString *finalResult;
    
    BOOL returnAsString = NO;
    
    if ([input isKindOfClass:[NSString class]]) {
        finalResult = [NSAttributedString emptyStringWithBase:input];
    } else {
        finalResult = input;
    }

    // Do the actual conversion
    finalResult = [NSString emojizeAttributedString:finalResult];
    
    if (returnAsString) {
        return [finalResult string];
    } else {
        return finalResult;
    }
}

@end
