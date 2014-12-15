//
//  DANCurlRequest.m
//  DANCurlRequest
//
//  Created by  Danielle Lancashireon 15/12/2014.
//  Copyright (c) 2014 Rocket Apps. All rights reserved.
//

#import "DANCurlRequest.h"

@implementation NSURLRequest (DANCurlRequest)

static NSString *DANCurlRequestDumpHeader = @"--dump-header";
static NSString *DANCurlRequestAllowInsecureConnections = @"-k";
static NSString *DANCurlRequestMethodFlag = @"-X";

static NSString *DANCurlRequestHeaderFormat = @" -H \"%@: %@\"";
static NSString *DANCurlRequestBodyFormat = @" -d \"%@\"";
static NSString *DANCurlRequestURLFormat = @" \"%@\"";

- (NSString *)dan_escapeQuotesInString:(NSString *)string {
  return [string stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
}

- (NSString *)dan_curlRequest {
  NSMutableString *curlString = [NSMutableString stringWithFormat:@"curl %@ %@ %@ %@ -",
                                 DANCurlRequestAllowInsecureConnections,
                                 DANCurlRequestMethodFlag,
                                 self.HTTPMethod,
                                 DANCurlRequestDumpHeader];

  [self.allHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(id key, id val, BOOL *stop) {
    NSString *headerKey = [self dan_escapeQuotesInString:key];
    NSString *headerValue = [self dan_escapeQuotesInString:val];

    [curlString appendFormat:DANCurlRequestHeaderFormat,
     headerKey,
     headerValue];
  }];

  NSString *bodyString = [[NSString alloc] initWithData:self.HTTPBody encoding:NSUTF8StringEncoding];
  if (bodyString.length) {
    bodyString = [self dan_escapeQuotesInString:bodyString];
    [curlString appendFormat:DANCurlRequestBodyFormat,
     bodyString];
  }

  [curlString appendFormat:DANCurlRequestURLFormat, self.URL.absoluteString];

  return curlString;
}

@end
