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

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount;

@end
@implementation AOEDataArrayModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark - 
#pragma mark Initializations

- (id)init {
    return [self initWithCount:kAOERowsCount];
}

- (id)initWithCount:(NSUInteger)rowsCount {
    self = [super init];
    if (self) {
        [self fillArrayModelWithRows:rowsCount];
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

#pragma mark -
#pragma mark Public Methods

- (void)saveDataArrayToFile {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

- (void)performLoading {
    id block = nil;
    if (self.cached) {
        id objects = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        block = ^{
            [self addObject:objects];
        };
    } else {
        block = ^{
            [self fillArrayModelWithRows:kAOERowsCount];
        };
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        self.state = AOEModelStateDidLoad;
    });
}

#pragma mark -
#pragma mark Private Methods

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount {
    for (NSUInteger index = 0; index < rowsCount; index++) {
        [self addObject:[AOEDataModel new]];
    }
}

@end
