//
//  usePPPPChannelManagement.m
//  MyP2PCamera
//
//  Created by Architect_ZBX on 15/12/1.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

#import "UsePPPPChannelManagement.h"
#import "PPPPChannelManagement.h"
#import "MyAudioSession.h"
#import "SearchDVS.h"
#import "PPPP_API.h"
#import "PPPPChannelManagement.h"
#import "SearchDVS.h"
#import "APICommon.h"
#import "PPPPDefine.h"
#import "obj_common.h"

@interface UsePPPPChannelManagement() {
    CSearchDVS* dvs;
}
@property PPPPChannelManagement* p2pChannelManagement;
@property (nonatomic,retain) NSCondition* p2pChannelManageCondition;
@property (nonatomic,retain) NSString* cameraID;
@property (nonatomic,assign) BOOL PtzIsUpDown;
@property (nonatomic,assign) BOOL PtzIsLeftRight;
@property (nonatomic,retain) NSTimer* searchTimer;
@property (nonatomic,retain) UIImageView* playView;
@end


@implementation UsePPPPChannelManagement

- (instancetype)init
{
    self = [super init];
    if (self) {
        _p2pChannelManagement = new PPPPChannelManagement();
        _PtzIsUpDown = NO;
        _PtzIsLeftRight = NO;
        InitAudioSession();
    }
    return self;
}



-(void)startSearch {
    [self stopSearch];
    dvs = new CSearchDVS();
    dvs->searchResultDelegate = self;
    dvs->Open();
    _searchTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(handleTime:) userInfo:nil repeats:NO];
}

-(void)initDevice {
    NSLog(@"初始化设备被点击了");
    PPPP_Initialize((char*)[@"EBGBEMBMKGJMGAJPEIGIFKEGHBMCHMJHCKBMBHGFBJNOLCOLCIEBHFOCCHKKJIKPBNMHLHCPPFMFADDFIINOIABFMH" UTF8String]);
    st_PPPP_NetInfo NetInfo;
    PPPP_NetworkDetect(&NetInfo, 0);
}

-(void)connectDevice:(NSString*)cameraID password:(NSString*)password {
    [_p2pChannelManageCondition lock];
    if (_p2pChannelManagement == NULL){
        [_p2pChannelManageCondition unlock];
        return;
    }
    _p2pChannelManagement->StopAll();
    dispatch_async(dispatch_get_main_queue(), ^{
        _cameraID = cameraID;
        [self performSelector:@selector(startP2P:password:) withObject:_cameraID withObject:password];
    });

}

-(void)startVideo:(UIImageView*) imageView cameraID:(NSString*)cameraID {
    _playView = imageView;
    if (_p2pChannelManagement !=NULL) {
        if (_p2pChannelManagement->StartPPPPLivestream([cameraID UTF8String], 10, self) == 0) {
            _p2pChannelManagement->StopPPPPAudio([cameraID UTF8String]);
            _p2pChannelManagement->StopPPPPLivestream([cameraID UTF8String]);
        }
        _p2pChannelManagement->GetCGI([cameraID UTF8String], CGI_IEGET_CAM_PARAMS);
    }
}

-(void) LRCruise:(NSString*)cameraID {
    if (_PtzIsLeftRight) {
        _p2pChannelManagement->PTZ_Control([cameraID UTF8String], CMD_PTZ_LEFT_RIGHT_STOP);
    } else {
        _p2pChannelManagement->PTZ_Control([cameraID UTF8String], CMD_PTZ_LEFT_RIGHT);
    }
    _PtzIsLeftRight = !_PtzIsLeftRight;
}

-(void) startP2P:(NSString*)camID password:(NSString*)password {
    _p2pChannelManagement->Start([camID UTF8String], [@"admin" UTF8String], [password UTF8String]);
}


-(void)handleTime:(NSTimer*)timer{
    [self stopSearch];
}
-(void)stopSearch {
    if (dvs != NULL) {
        SAFE_DELETE(dvs);
    }
}

-(void) SnapshotNotify:(NSString *)strDID data:(char *)data length:(int)length {
    NSData *imageData = [NSData dataWithBytes:data length:strlen(data)];
    _snapshotImage = [UIImage imageWithData:imageData];
}

-(void) SearchCameraResult:(NSString *)mac Name:(NSString *)name Addr:(NSString *)addr Port:(NSString *)port DID:(NSString *)did {
    NSLog(@"name %@ did  %@",name, did);
}

-(void) ImageNotify:(UIImage *)image timestamp:(NSInteger)timestamp DID:(NSString *)did {
    [self performSelector:@selector(refreshImage:) withObject:image];
}



-(void) ParamNotify:(int)paramType params:(void *)params {
    
}

-(void) refreshImage:(UIImage*) image {
    if(image != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _playView.image = image;
        });
    }
}

- (void) YUVNotify: (Byte*) yuv length:(int)length width: (int) width height:(int)height timestamp:(unsigned int)timestamp DID:(NSString *)did{
    UIImage* image = [APICommon YUV420ToImage:yuv width:width height:height];
    _snapshotImage= image;
    [self performSelector:@selector(refreshImage:) withObject:image];
}
- (void) H264Data: (Byte*) h264Frame length: (int) length type: (int) type timestamp: (NSInteger) timestamp{
    
}


- (void)dealloc {
    [super dealloc];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
