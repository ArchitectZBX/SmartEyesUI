//
//  BarCodeViewController.m
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/16.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

#import "BarCodeViewController.h"
#import "ZBarSDK.h"
#import "SwiftModule-swift.h"
#import "UsePPPPChannelManagement.h"

CGRect Screen = [[UIScreen mainScreen] bounds];
@interface BarCodeViewController ()<ZBarReaderDelegate,ZBarReaderViewDelegate,UIAlertViewDelegate>

@property (nonatomic,retain)NSString* cameraID;
@property (nonatomic,retain)NSString* password;
@property (nonatomic,retain)UIAlertView* passwordAlertView;
@end

@implementation BarCodeViewController

-(void)viewDidAppear {
    [super viewDidAppear:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    //初始化照相机窗口
    ZBarReaderView *readview = [ZBarReaderView new];
    
    //自定义大小
    readview.frame = CGRectMake((Screen.size.width - 200)/2, (Screen.size.height - 200)/2 - 40, 200, 200);
    //自定义添加相关指示.........发挥各自的APP的想象力
    //此处省略美化10000行代码...................
    //………………………..
    // 好进入正题—— 接着设置好代理
    readview.readerDelegate = self;
    
    //将其照相机拍摄视图添加到要显示的视图上
    [self.view addSubview:readview];
    
    
    //二维码/条形码识别设置
    ZBarImageScanner *scanner = readview.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    //启动，必须启动后，手机摄影头拍摄的即时图像菜可以显示在readview上
    [readview start];
//    //初始化相机控制器
//    ZBarReaderViewController *reader = [ZBarReaderViewController new];
//    
//    //设置代理
//    reader.readerDelegate = self;
//    //基本适配
//    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
//    
//    //二维码/条形码识别设置
//    ZBarImageScanner *scanner = reader.scanner;
//    
//    [scanner setSymbology: ZBAR_I25
//                   config: ZBAR_CFG_ENABLE
//                       to: 0];
//    //弹出系统照相机，全屏拍摄
//    [self presentModalViewController: reader
//                            animated: YES];
}

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
//    ZBarSymbol *symbol = nil;
//    for(symbol in results)
//        break;
//    [self dismissViewControllerAnimated:YES
//                             completion:^{
//                             }];
//    NSString *code = [NSString stringWithString:symbol.data];
//    NSLog(code);
//    [self inputPwd];
//}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image {
    ZBarSymbol *symbol = nil;
    for(symbol in symbols) {
        break;
    }
    self.cameraID = symbol.data;
    [readerView stop];
    [self inputPwd];
}

-(void) initManage{
    
}

-(void)inputPwd {
    _passwordAlertView = [[UIAlertView alloc] initWithTitle:@"请输入密码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    _passwordAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [_passwordAlertView show];
    _passwordAlertView.delegate = self;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        UITextField *textField = [_passwordAlertView textFieldAtIndex:0];
        self.password = textField.text;
        NSLog(@"跳转到设备列表");
        
        ControlDeviceViewController *vc = [[ControlDeviceViewController alloc] init];
        vc.cameraID = self.cameraID;
        vc.password = self.password;
        [self.navigationController pushViewController:vc animated:true];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
