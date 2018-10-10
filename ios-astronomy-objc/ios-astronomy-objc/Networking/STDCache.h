//
//  STDCache.h
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 10.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDCache<Key, Value> : NSObject

- (nullable Value)valueForKey:(Key)key;
- (void)cacheWithValue:(Value)value key:(Key)key;

@end

NS_ASSUME_NONNULL_END
