//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDataArrayModel.h"

#import "AOEDataModel.h"

#import "NSFileManager+AOEExtensions.h"

static const NSUInteger kAOERowsCount = 12;
static  NSString * const kAOEfileName  = @"AOEDataModel.plist";

@interface AOEDataArrayModel ()
@property (nonatomic, readonly)                  NSString   *fileName;
@property (nonatomic, readonly)                  NSString   *fileFolder;
@property (nonatomic, readonly)                  NSString   *filePath;
@property (nonatomic, assign, getter=isCached)   BOOL       cached;
@property (nonatomic, readonly)                  NSArray    *notificationsName;

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount;
- (void)subscribeToApplicationNotifications:(NSArray *)notificationsName;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationsName;
- (void)saveWithNotification:(id)notification;

@end
@implementation AOEDataArrayModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;
@dynamic notificationsName;

#pragma mark - 
#pragma mark Initializations and Deallocation

- (void)dealloc {
    [self unsubscribeFromApplicationNotifications:self.notificationsName];
}

- (id)init {
    self = [super init];
    if (self) {
        [self subscribeToApplicationNotifications:self.notificationsName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
    return kAOEfileName;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (NSArray *)notificationsName {
    return @[UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification];
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

- (void)performLoading {
    id block = nil;
    if (self.cached) {
        id objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        block = ^{ [self addObject:objects];  };
    } else {
        block = ^{ [self fillArrayModelWithRows:kAOERowsCount]; };
    }
    
    [self performBlock:block shouldNotify:NO];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.state = AOEModelStateDidLoad;
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)subscribeToApplicationNotifications:(NSArray *)notificationsName {
    for (NSString *notification in notificationsName) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(saveWithNotification:)
                                                    name:notification
                                                  object:nil];
    }
}

- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationsName {
    for (NSString *notification in notificationsName) {
        [[NSNotificationCenter defaultCenter]removeObserver:self
                                                       name:notification
                                                     object:nil];
    }
}

- (void)saveWithNotification:(id)notification {
    [self save];
}

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount {
    for (NSUInteger index = 0; index < rowsCount; index++) {
        [self addObject:[AOEDataModel new]];
    }
}

@end
