//
//  DoctaManager.m
//  DoctaPartner
//
//  Created by RSTI E-Services on 04/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "DoctaManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation DoctaManager
static DoctaManager *singletonObject = nil;
NSDictionary *Dict;

+(id) sharedInstance
{
    if (! singletonObject) {
        singletonObject = [[DoctaManager alloc]init];
    }
    return singletonObject;
    
    
}
-(id)init {
    if (! singletonObject) {
        
        singletonObject = [super init];
        // Uncomment the following line to see how many times is the init method of the class is called
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }
    return singletonObject;
    
}
-(void)GetDatafromAPI:(NSString *)methodName :(NSString *)APIpath  :(NSDictionary *)WithParameters completionBlock:(void (^) (id data, NSError *error)) completionBlock
{
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"AccessToken"];
    NSString *BearerToken = [NSString stringWithFormat:@"Bearer %@",token];
    NSString *url = [NSString stringWithFormat:@"%@/%@",BASE_URL, APIpath];
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:methodName URLString:url parameters:WithParameters error:nil];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (token != nil) {
        [req setValue:BearerToken forHTTPHeaderField:@"Authorization"];
        
    }
    else {
        NSLog(@"Token is nil");
        
    }
    
    
    
    
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NSLog(@"Reply JSON for detail: %@", responseObject);
            completionBlock(responseObject,nil);
            
            //  [manager respondsToSelector:@selector(APIResponse:)];
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                
                
            }
        }
        else {
            NSLog(@"Error");
            completionBlock(nil,error);
            
        }
        
        
    }] resume];
    
    
}







@end
