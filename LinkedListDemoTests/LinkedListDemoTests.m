//
//  LinkedListDemoTests.m
//  LinkedListDemoTests
//
//  Created by mac-mini2 on 16/10/11.
//  Copyright © 2016年 jason‘s cube. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface LinkedListDemoTests : XCTestCase

@property(nonatomic,strong)ViewController *vc;

@end

@implementation LinkedListDemoTests
{
    struct Node *headNode;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.vc = [[ViewController alloc]init];
    headNode = [self.vc createHead];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.

    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//测试头插法
- (void)testPushFront{

    for (int i=1; i<11; i++) {
        [self.vc pushFrontWithNode:headNode Val:i];
    }
    [self.vc printWithNode:headNode];
    [self.vc removeAllWithNode:headNode];
}

//测试尾插法
- (void)testPushBack{

    for (int i=1; i<11; i++) {
        [self.vc pushBackWithNode:headNode Val:i];
    }
    [self.vc printWithNode:headNode];
    [self.vc removeAllWithNode:headNode];
}

- (void)testRemoveOneNode{

    for (int i=1; i<11; i++) {
        [self.vc pushFrontWithNode:headNode Val:i];
    }
    [self.vc printWithNode:headNode];
    [self.vc removeNode:headNode ByVal:3];
    [self.vc removeNode:headNode ByVal:5];
    [self.vc removeNode:headNode ByVal:10];
    [self.vc printWithNode:headNode];
}

- (void)testChangeOneNode{

    for (int i=1; i<11; i++) {
        [self.vc pushFrontWithNode:headNode Val:i];
    }
    [self.vc printWithNode:headNode];
    [self.vc changeNode:headNode WithChangeVal:20 ByVal:4];
    [self.vc printWithNode:headNode];
    [self.vc removeNode:headNode ByVal:10];
}

- (void)testReverse{

    for (int i=1; i<11; i++) {
        [self.vc pushFrontWithNode:headNode Val:i];
    }
    [self.vc printWithNode:headNode];
    headNode = [self.vc reverseWithNode:headNode];
    [self.vc printWithNode:headNode];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
