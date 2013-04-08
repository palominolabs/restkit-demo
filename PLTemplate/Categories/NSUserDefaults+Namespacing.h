//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

@interface NSUserDefaults (Namespacing)

- (NSUserDefaults*)setInteger:(NSInteger)i forSafeKey:(NSString * const)key;

- (NSInteger)integerForSafeKey:(NSString* const)key;

- (NSUserDefaults*)setObject:(id)obj forSafeKey:(NSString* const)key;

- (id)objectForSafeKey:(NSString* const)key;

- (BOOL)boolForSafeKey:(NSString* const)string;

- (NSUserDefaults*)setBool:(BOOL)b forSafeKey:(NSString* const)key;

@end
