//
//  STDMarsPhoto.h
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDMarsPhoto : NSObject

- (instancetype)initWithId:(NSString *)identifier sol:(NSInteger)sol earthDate:(NSString *)earthDate imageUrl:(NSURL *)imageUrl;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, readonly)  NSInteger sol;
@property (nonatomic, copy, readonly)  NSString *earthDate;
@property (nonatomic, copy, readonly)  NSURL *imageUrl;
// @property STDCamera *camera;

@end

NS_ASSUME_NONNULL_END
