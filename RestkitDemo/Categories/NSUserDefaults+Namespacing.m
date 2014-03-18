//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import "NSUserDefaults+Namespacing.h"

@implementation NSUserDefaults (Namespacing)

- (NSString*)prefix:(NSString *)key {
    return [NSString stringWithFormat:@"%@%@", nsstr(WS_CONFIG_UD_KEY_PREFIX), key];
}

- (NSUserDefaults*)setInteger:(NSInteger)i forSafeKey:(NSString * const)key {
    [self setInteger:i forKey:[self prefix:key]];
    return self;
}

- (NSInteger)integerForSafeKey:(NSString * const)key {
    return [self integerForKey:[self prefix:key]];
}

- (NSUserDefaults*)setObject:(id)obj forSafeKey:(NSString * const)key {
    [self setObject:obj forKey:[self prefix:key]];
    return self;
}

- (id)objectForSafeKey:(NSString * const)key {
    return [self objectForKey:[self prefix:key]];
}

- (BOOL)boolForSafeKey:(NSString * const)string {
    return [self boolForKey:[self prefix:string]];
}

- (NSUserDefaults*)setBool:(BOOL)b forSafeKey:(NSString * const)key {
    [self setBool:b forKey:[self prefix:key]];
    return self;
}

@end
