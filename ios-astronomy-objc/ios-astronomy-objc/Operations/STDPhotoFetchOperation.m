//
//  STDPhotoFetchOperation.m
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 10.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDPhotoFetchOperation.h"

@interface STDPhotoFetchOperation ()

@property STDMarsPhoto *photo;
@property NSData *imageData;
@property NSURLSessionDataTask *dataTask;
@property BOOL internalReady;
@property BOOL internalExecuting;
@property BOOL internalFinished;

@end

@implementation STDPhotoFetchOperation

- (instancetype)initWithPhoto:(STDMarsPhoto *)photo
{
    self = [super init];
    if (self) {
        _photo = photo;
        _imageData = [[NSData alloc] init];
        _dataTask = [[NSURLSessionDataTask alloc] init];
        _internalReady = YES;
    }
    return self;
}

- (void)start
{
    self.internalExecuting = YES;
    
    NSURL *imageUrl = [self.photo imageUrl];
    
    self.dataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        self.imageData = data;
        self.internalFinished = YES;
    }];
    
    [self.dataTask resume];
}

- (void)cancel
{
    [self.dataTask cancel];
}

// Overriding getter for Operation Status

- (BOOL)isReady
{
    return self.internalReady;
}

- (BOOL)isExecuting
{
    self.internalFinished = NO;
    return self.internalExecuting;
}

- (BOOL)isFinished
{
    self.internalExecuting = NO;
    return self.internalFinished;
}

- (BOOL)isAsynchronous
{
    return YES;
}

@end
