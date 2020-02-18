//
//  Car.h
//  MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Car : NSObject

@property (nonatomic, assign) Person *owner;
@property (nonatomic, copy) NSString *make;

- (instancetype)initWithMake:(NSString *)make;
+ (instancetype)carWithMake:(NSString *)aMake;

@end
