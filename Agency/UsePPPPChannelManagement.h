//
//  usePPPPChannelManagement.h
//  MyP2PCamera
//
//  Created by Architect_ZBX on 15/12/1.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SearchCameraResultProtocol.h"
#import "ParamNotifyProtocol.h"
#import "ImageNotifyProtocol.h"
@interface UsePPPPChannelManagement : NSObject<SearchCameraResultProtocol,ParamNotifyProtocol,ImageNotifyProtocol>
-(void) initClass;
-(void) startSearch;
-(void) connectDevice;
-(void) initDevice;
-(void) startVideo:(UIImageView*) imageView;
-(void) LRCruise;
@end
