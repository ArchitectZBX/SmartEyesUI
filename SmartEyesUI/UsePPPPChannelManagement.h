//
//  usePPPPChannelManagement.h
//  MyP2PCamera
//
//  Created by Architect_ZBX on 15/12/1.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SearchCameraResultProtocol.h"
#import "ParamNotifyProtocol.h"
#import "ImageNotifyProtocol.h"
#import "SnapshotProtocol.h"
@interface UsePPPPChannelManagement : NSObject<SearchCameraResultProtocol,ParamNotifyProtocol,ImageNotifyProtocol,SnapshotProtocol>
@property (retain,nonatomic) UIImage* snapshotImage;
-(void) startSearch;
-(void) connectDevice:(NSString*)cameraID password:(NSString*)password;
-(void) initDevice;
-(void) startVideo:(UIImageView*) imageView cameraID:(NSString*)cameraID;
-(void) LRCruise:(NSString*)cameraID ;
@end
