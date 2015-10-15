//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDataArrayModel.h"
#import "AOEDataModel.h"

static const NSUInteger kAOERowsCount = 12;
@interface AOEDataArrayModel ()

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount;

@end

@implementation AOEDataArrayModel

#pragma mark - 
#pragma mark Initializations

- (id)init {
    return [self initWithCount:kAOERowsCount];
}

- (id)initWithCount:(NSUInteger)rowsCount {
    self = [super init];
    if (self) {
        self.fileName = @"DataArrayModel";
        [self fillArrayModelWithRows:rowsCount];
    }
    
    return self;
}


- (void)saveDataArrayToFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:self.fileName];
    
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

- (id)loadDataArrayFromFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:self.fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        AOEDataArrayModel *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return savedData;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount {
    for (NSUInteger index = 0; index < rowsCount; index++) {
        [self addObject:[AOEDataModel new]];
    }
}

@end
