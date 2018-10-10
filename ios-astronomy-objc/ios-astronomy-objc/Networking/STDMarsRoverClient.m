//
//  STDMarsRoverClient.m
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDMarsRoverClient.h"

@interface STDMarsRoverClient ()

@property (nonatomic, strong) NSMutableArray<STDMarsPhoto *> *internalPhotos;

@end

@implementation STDMarsRoverClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPhotos = [[NSMutableArray<STDMarsPhoto *> alloc] init];
    }
    return self;
}

#pragma mark - Properties

- (NSArray *)photos
{
    return [_internalPhotos copy];
}

#pragma mark - Public methods

- (void)fetchMarsRoverWithName:(NSString *)rover sol:(NSInteger)sol completion:(void (^)(STDMarsRover *rover, NSError *error))completion
{
}

- (void)fetchPhotosFromRover:(NSString *)rover sol:(NSInteger)sol completion:(void (^)(NSArray<STDMarsPhoto *> *photos, NSError *error))completion
{
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    [baseUrl URLByAppendingPathComponent:rover];
    [baseUrl URLByAppendingPathComponent:@"photos"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:YES];
    NSURLQueryItem *solQueryItem = [NSURLQueryItem queryItemWithName:@"sol" value:[NSString stringWithFormat:@"%ld", (long)sol]];
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:apiKey];
    components.queryItems = @[solQueryItem, apiQueryItem];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:components.URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSDictionary *errorMessage = dictionary[@"error"];
        NSMutableArray *photoDictionaries = dictionary[@"photos"];
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
            
        if (errorMessage) {
            NSString *message = errorMessage[@"message"];
            NSLog(@"%@", message);
            completion(nil,  [[NSError alloc] init]);
            return;
        }
        
        if (photoDictionaries) {
            for (NSDictionary *photoDictionary in photoDictionaries) {
                STDMarsPhoto *photo = [[STDMarsPhoto alloc] initWithDictionary:photoDictionary];
                if (photo) {
                    [self.internalPhotos addObject:photo];
                }
            }
            
            completion([self.internalPhotos copy], nil);
        } else {
            completion(nil, [[NSError alloc] init]);
        }
        
    }] resume];
}

- (UIImage *)getImageFromURL:(NSURL *)url
{
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    return [UIImage imageWithData:imageData];
}

//- (void)setInternalPhotos:(NSMutableArray<STDMarsPhoto *> *)internalPhotos
//{
//    self.internalPhotos = [internalPhotos mutableCopy];
//}

static NSString * const baseUrlString = @"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
static NSString * const apiKey = @"";

@end

/*
 {
 "photos": [
 {
 "id": 102693,
 "sol": 1000,
 "camera": {
 "id": 20,
 "name": "FHAZ",
 "rover_id": 5,
 "full_name": "Front Hazard Avoidance Camera"
 },
 "img_src": "http:\/\/mars.jpl.nasa.gov\/msl-raw-images\/proj\/msl\/redops\/ods\/surface\/sol\/01000\/opgs\/edr\/fcam\/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
 "earth_date": "2015-05-30",
 "rover": {
 "id": 5,
 "name": "Curiosity",
 "landing_date": "2012-08-06",
 "launch_date": "2011-11-26",
 "status": "active",
 "max_sol": 2172,
 "max_date": "2018-09-15",
 "total_photos": 341463,
 "cameras": [
 {
 "name": "FHAZ",
 "full_name": "Front Hazard Avoidance Camera"
 },
 {
 "name": "NAVCAM",
 "full_name": "Navigation Camera"
 },
 {
 "name": "MAST",
 "full_name": "Mast Camera"
 },
 {
 "name": "CHEMCAM",
 "full_name": "Chemistry and Camera Complex"
 },
 {
 "name": "MAHLI",
 "full_name": "Mars Hand Lens Imager"
 },
 {
 "name": "MARDI",
 "full_name": "Mars Descent Imager"
 },
 {
 "name": "RHAZ",
 "full_name": "Rear Hazard Avoidance Camera"
 }
 ]
 }
 },
 */
