//
//  STDCache.m
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 10.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDCache.h"

@interface STDCache<Key, Value> ()

@property NSMutableDictionary<Key, Value> *store;
@property dispatch_queue_t queue;

@end

@implementation STDCache

- (instancetype)init
{
    self = [super init];
    if (self) {
        _store = [[NSMutableDictionary alloc] init];
        _queue = dispatch_queue_create("com.Stefano.Astronomy.Cache", 0);
    }
    return self;
}

- (id)valueForKey:(id)key
{
    id value = NULL;
    dispatch_sync(self.queue, ^{
        for (id cacheKey in self.store) {
            if (cacheKey == key) {
               __block id value = [self.store objectForKey:cacheKey];
            }
        }
    });
    return value;
}

- (void)cacheWithValue:(id)value key:(id)key
{
    dispatch_sync(self.queue, ^{
        [self.store setValue:value forKey:key];
    });
    
}

@end
