//
//  STDMarsPhoto.m
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDMarsPhoto.h"

@implementation STDMarsPhoto

- (instancetype)initWithId:(NSString *)identifier sol:(NSInteger)sol earthDate:(NSString *)earthDate imageUrl:(NSURL *)imageUrl
{
    self = [super init];
    if (self) {
        _identifier = [identifier copy];
        _sol = sol;
        _earthDate = [earthDate copy];
        _imageUrl = [imageUrl copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    NSString *identifier = dictionary[@"id"];
    NSString *solString = dictionary[@"sol"];
    NSInteger sol = [solString integerValue];
    NSString *earthDate = dictionary[@"earth_date"];
    NSString *imageUrlString = dictionary[@"img_src"];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    
    if (!identifier || !solString || !earthDate || !imageUrlString) {
        return NULL;
    }
    
    return [self initWithId:identifier sol:sol earthDate:earthDate imageUrl:imageUrl];
}

@end
