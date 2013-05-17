//
//  NSString+Emojize.h
//  Field Recorder
//
//  Created by Jonathan Beilin on 11/5/12.
//  Copyright (c) 2012 DIY. All rights reserved.
//
//  Inspired by https://github.com/larsschwegmann/Emoticonizer

#import <Cocoa/Cocoa.h>

@interface NSString (Emojize)

- (NSString *)emojizedString;
+ (NSString *)emojizedStringWithString:(NSString *)text;
+ (NSDictionary *)emojiAliases;
+ (NSAttributedString *)emojizeAttributedString:(NSAttributedString *)inString;

@end