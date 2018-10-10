//
//  STDMarsRoverClient.h
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "STDMarsRover.h"
#import "STDMarsPhoto.h"

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(MarsRoverClient)
@interface STDMarsRoverClient : NSObject

- (instancetype)init;
- (void)fetchMarsRoverWithName:(NSString *)name sol:(NSInteger)sol completion:(void (^)(STDMarsRover *rover, NSError *))completion;
- (void)fetchPhotosFromRover:(NSString *)rover sol:(NSInteger)sol completion:(void (^)(NSArray<STDMarsPhoto *> *photos, NSError *))completion;
- (UIImage *)getImageFromURL:(NSURL *)url;

@property (nonatomic, readonly) NSArray<STDMarsPhoto *> *photos;

@end

NS_ASSUME_NONNULL_END
