//
//  AppDelegate.h
//  mingxinhg
//
//  Created by athudong on 13-12-3.
//  Copyright (c) 2013年 athudong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTTPServer;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    HTTPServer *httpServer;
}
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
