//
//  DANCurlRequest.h
//  DANCurlRequest
//
//  Created by Daniel Tomlinson on 15/12/2014.
//  Copyright (c) 2014 Rocket Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (DANCurlRequest)

/**
 * @return The NSURLRequest formatted as a cURL request that can be used to
 *   perform the request from the terminal
 */
- (NSString *)dan_curlRequest;

@end
