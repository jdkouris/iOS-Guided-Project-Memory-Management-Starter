//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@property (nonatomic, retain) NSString *myName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index++) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
//    [firstString retain];
    
    [array release];
    
//    NSLog(@"%@", firstString);
//    [firstString release];
    
//    _myName = [[NSMutableString alloc] initWithString:@"John Kouris"];
    self.myName = [[[NSMutableString alloc] initWithString:@"John Kouris"] autorelease];
    
    Person *john = [[Person alloc] init]; // 1
    Car *honda = [[Car alloc] initWithMake:@"Civic Si"]; // 1
    john.car = honda; // honda 2
    [honda release]; // honda 1
    
    john.car = honda; // honda 1
    [john release]; // john 0, honda 0
}

- (void)dealloc
{
    [_myName release];
    _myName = nil;
    
    [super dealloc];
}


@end
