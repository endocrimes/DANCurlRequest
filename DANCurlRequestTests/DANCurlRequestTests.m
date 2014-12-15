//
//  DANCurlRequestTests.m
//  DANCurlRequest
//
//  Created by  Danielle Lancashireon 15/12/2014.
//  Copyright (c) 2014 Rocket Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DANCurlRequest.h"

@interface DANCurlRequestTests : XCTestCase

@end

@implementation DANCurlRequestTests

- (void)testCreatesCorrectCURLRequest {
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                              initWithURL:[NSURL URLWithString:@"https://api.github.com/zen"]];
  [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request setHTTPMethod:@"GET"];
  NSString *sut = request.dan_curlRequest;

  XCTAssertEqualObjects(sut, @"curl -k -X GET --dump-header - -H \"Accept: application/json\" \"https://api.github.com/zen\"");
}

@end
