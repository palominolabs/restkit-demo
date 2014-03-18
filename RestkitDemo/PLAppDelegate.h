//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end