//
//  ViewController.m
//  Search
//
//  Created by Jobs on 2020/7/31.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "ViewController.h"
#import "SearchVC.h"
#import "ViewController+Category.h"
#import "TestView.h"
#import "UIView+SuspendView.h"
#import "SuspendBtn.h"
#import "NSString+Extras.h"

#import "GTProxy.h"

@interface ViewController ()

@property(nonatomic,strong)BRDatePickerView *datePickerView;//时间选择器
@property(nonatomic,strong)BRPickerStyle *customStyle;
@property(nonatomic,strong)BRAddressPickerView *addressPickerView;//地址选择器
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)TestView *testView;

@property(nonatomic,strong)SuspendBtn *spButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRedColor;
    
    self.btn.alpha = 1;
    self.testView.alpha = 1;
    
    self.spButton = SuspendBtn.new;
    self.spButton.vc = self;
    self.spButton.frame = CGRectMake(SCREEN_WIDTH - 71,
                                     300,
                                     66,
                                     66);
    
    [self.view addSubview:self.spButton];
}

//-(void)removeContentsOfDirectory:(NSString *)directory withExtension:(NSString*)extension{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *contents = [fileManager contentsOfDirectoryAtPath:@"/Users/jobs/Library/Developer/CoreSimulator/Devices/FA88BC66-163B-424E-B186-56B3A0EB7EF3/data/Containers/Data/Application/4B3A818C-2BF6-400A-B1D1-D55F1052B711/Library/Caches" error:NULL];
//    NSEnumerator *e = [contents objectEnumerator];
//    NSString *filename;
//    while ((filename = [e nextObject])) {
//        if (extension != nil) {
//            if ([[filename pathExtension] hasPrefix:extension]) {
//                BOOL y = [fileManager removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
//            }
//        }else{
//            BOOL y = [fileManager removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
//        }
//    }
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    NSString *fileFolderPathStr = [self BundleFile:@"小夫，我要进来了"
                                  bundleFileSuffix:@"jpg"
                                       ToLocalFile:@"kkk"
                                   localFileSuffix:@"jpg"];
    [self KKK:fileFolderPathStr];

}
///写文件并删除
-(void)KKK:(NSString *)fileFolderPathStr{
    BOOL d = [NSString isNullString:fileFolderPathStr];
    if (!d) {
        [self delFile:@[fileFolderPathStr] fileSuffix:nil];//删除文件夹📂路径下的文件
    }
}
//删除指定后缀名的文件
-(void)delFile:(NSArray *)pathArr
    fileSuffix:(NSString *)fileSuffix{
    NSString *extension = fileSuffix;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = pathArr;
    NSString *documentsDirectory = [paths objectAtIndex:0];
     
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator*e = [contents objectEnumerator];
    NSString *filename;
    
//    while ((filename = [e nextObject])) {
//        if([[filename pathExtension] isEqualToString:extension]) {
//            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
//        }
//    }
    
    while ((filename = [e nextObject])) {
        if (extension) {
            if ([[filename pathExtension] hasPrefix:extension]) {
                [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
            }
        }else{
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}

///删除directory（路径）文件夹下的文件。extension是指定文件后缀名文件，传nil是全部删除
+(void)removeContentsOfDirectory:(NSString *)directory
                   withExtension:(NSString *_Nullable)extension{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:directory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        if (extension) {
            if ([[filename pathExtension] hasPrefix:extension]) {
                [fileManager removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
            }
        }else{
            [fileManager removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}


///将bundle里面的文件写进手机本地文件
-(NSString *)BundleFile:(NSString *)bundleFileName
       bundleFileSuffix:(NSString *)bundleFileSuffix
            ToLocalFile:(NSString *)LocalFileName
        localFileSuffix:(NSString *)LocalFileSuffix{
    //获取bundle路径
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleFileName ofType:bundleFileSuffix];
    UIImage *img = [UIImage imageWithContentsOfFile:bundlePath];
    NSString *fileFolderPathStr = [FileFolderHandleTool createCacheFolderPath:nil];
    //写文件之前一定要 有空白文件可写。
    //文件全名 带后缀
    NSString *localFileFullNameStr = [NSString stringWithFormat:@"/%@.%@",LocalFileName,LocalFileSuffix];
    bool b = [FileFolderHandleTool createFileAtPath:[fileFolderPathStr stringByAppendingString:localFileFullNameStr] overwrite:YES error:nil];
  
    bool d = NO;
    if (b) {
        //写文件
        NSString *ff = [NSString stringWithFormat:@"%@%@",fileFolderPathStr,localFileFullNameStr];
        d = [FileFolderHandleTool writeFileAtPath:ff content:img error:nil];
    }
    return fileFolderPathStr = d? fileFolderPathStr : nil;
}

-(void)search{
    //    @weakify(self)
    //    [SearchVC ComingFromVC:weak_self
    //               comingStyle:ComingStyle_PUSH
    //         presentationStyle:UIModalPresentationAutomatic
    //             requestParams:nil
    //                   success:^(id data) {}
    //                  animated:YES];
}
//datePickerView
-(void)DatePickerView{
    //    [self.datePickerView show];
}
//可变参数的使用
-(void)variableParameter{
    //    NSNumber *b = [NSNumber numberWithShort:4.5];
    //    [TestView print:@3,
    //     @"1",
    //     b,
    //     @[@"1",@"2"],
    //     nil];
}
//runtime
-(void)RT{
    //    self.ly_name = @"hello world";
    //
    //    NSLog(@"%@",self.ly_name);
}
//block的高级使用
-(void)block{
    //    self.tsb.testBlock(1);//?
}
//Proxy 的使用
-(void)Proxy{
    GTProxy *px = [GTProxy alloc];
    NSMutableArray *array =  [NSMutableArray array];
    [px transformToObject:array];
    [px performSelector:@selector(addObject:) withObject:@"123"];
    NSLog(@"%@",array);

    NSMutableString *string = [NSMutableString string];
    [px transformToObject:string];
    [px performSelector:@selector(appendString:) withObject:@"jia"];
    NSLog(@"%@",string);
}
#pragma mark —— lazyLoad
-(UIButton *)btn{
    if (!_btn) {
        _btn = UIButton.new;
        _btn.backgroundColor = kBlueColor;
        [self.view addSubview:_btn];
        _btn.frame = CGRectMake(100, 100, 100, 100);
        [_btn addTarget:self
                 action:@selector(addButtonAnimation:)
       forControlEvents:UIControlEventTouchUpInside];
    }return _btn;
}

-(TestView *)testView{
    if (!_testView) {
        _testView = TestView.new;
        _testView.backgroundColor = KYellowColor;
        [self.view addSubview:_testView];
        [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn.mas_bottom).offset(10);
            make.left.equalTo(self.btn);
            make.size.mas_equalTo(self.btn);
        }];
    }
    return _testView;
}

- (void)addButtonAnimation:(UIButton *)sender{
    sender.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0
                                 options:0
                              animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0
                                relativeDuration:1 / 3.0
                                      animations: ^{
            sender.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0
                                relativeDuration:1/3.0
                                      animations: ^{
            sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0
                                relativeDuration:1/3.0
                                      animations: ^{

            sender.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}

-(BRDatePickerView *)datePickerView{
    if (!_datePickerView) {
        _datePickerView = BRDatePickerView.new;
        _datePickerView.pickerMode = BRDatePickerModeYMD;
        _datePickerView.title = @"选择年月日";
        _datePickerView.pickerStyle.pickerTextColor = kRedColor;
        // datePickerView.selectValue = @"2019-10-30";
        _datePickerView.selectDate = [NSDate br_setYear:2019
                                                  month:10
                                                    day:30];
        _datePickerView.minDate = [NSDate br_setYear:1949
                                               month:3
                                                 day:12];
        _datePickerView.maxDate = [NSDate date];
        _datePickerView.isAutoSelect = YES;
        @weakify(self)
        _datePickerView.resultBlock = ^(NSDate *selectDate,
                                        NSString *selectValue) {
            @strongify(self)
            NSLog(@"选择的值：%@", selectValue);

        };
        // 设置自定义样式
        _datePickerView.pickerStyle = self.customStyle;
    }return _datePickerView;
}

-(BRPickerStyle *)customStyle{
    if (!_customStyle) {
        _customStyle = BRPickerStyle.new;
        _customStyle.pickerColor = BR_RGB_HEX(0xd9dbdf, 1.0f);
        _customStyle.cancelBorderStyle = BRBorderStyleSolid;
        _customStyle.hiddenMaskView = YES;
        _customStyle.cancelBtnTitle = @"取消";
        _customStyle.pickerTextColor = kRedColor;
        _customStyle.separatorColor = kGrayColor;
    }return _customStyle;
}

-(BRAddressPickerView *)addressPickerView{
    if (!_addressPickerView) {
        _addressPickerView = BRAddressPickerView.new;
        _addressPickerView.pickerMode = BRAddressPickerModeArea;
        _addressPickerView.title = @"请选择地区";
        //_addressPickerView.selectValues = @[@"浙江省", @"杭州市", @"西湖区"];
        _addressPickerView.selectIndexs = @[@10, @0, @4];
        _addressPickerView.isAutoSelect = YES;
        @weakify(self)
        _addressPickerView.resultBlock = ^(BRProvinceModel *province,
                                           BRCityModel *city,
                                           BRAreaModel *area) {
            @strongify(self)
            NSLog(@"选择的值：%@", [NSString stringWithFormat:@"%@-%@-%@", province.name, city.name, area.name]);

        };
    }return _addressPickerView;
}



@end
