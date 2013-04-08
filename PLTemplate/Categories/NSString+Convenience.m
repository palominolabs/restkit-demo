//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import "NSString+Convenience.h"

@implementation NSString(Convenience)

+ (NSString*)stringByAppendingStrings:(id) firstStr, ... {
    // Start out with the current string
    NSMutableString* result = [NSMutableString string];
    id eachArg;
    va_list alist;
    if (firstStr)
    {
        [result appendString:firstStr];
        va_start(alist, firstStr);
        eachArg = va_arg(alist, id);
        while (eachArg) {
            [result appendString:eachArg];
            eachArg = va_arg(alist, id);
        }
        va_end(alist);
    }
    return result;
}

@end
