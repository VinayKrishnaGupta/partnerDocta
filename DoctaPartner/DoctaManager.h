//
//  DoctaManager.h
//  DoctaPartner
//
//  Created by RSTI E-Services on 04/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctaManager : NSObject
+ sharedInstance;
-(void)GetDatafromAPI:(NSString *)methodName :(NSString *)APIpath  :(NSDictionary *)WithParameters completionBlock:(void (^) (id data, NSError *error)) completionBlock;

@end
