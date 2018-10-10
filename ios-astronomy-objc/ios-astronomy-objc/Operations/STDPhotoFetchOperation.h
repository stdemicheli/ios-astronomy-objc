//
//  STDPhotoFetchOperation.h
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 10.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDMarsPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface STDPhotoFetchOperation : NSOperation

- (instancetype)initWithPhoto:(STDMarsPhoto *)photo;
- (void)start;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
