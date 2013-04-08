//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import "NSDictionary+Convenience.h"


@implementation NSDictionary(Convenience)

- (NSString*)str:(NSString*)key {
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    } else if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj stringValue];
    } else {
        return @"";
    }
}
@end
