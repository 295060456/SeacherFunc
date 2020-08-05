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

@interface ViewController ()

@property(nonatomic,strong)BRDatePickerView *datePickerView;//时间选择器
@property(nonatomic,strong)BRPickerStyle *customStyle;
@property(nonatomic,strong)BRAddressPickerView *addressPickerView;//地址选择器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRedColor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
//    @weakify(self)
//    [SearchVC ComingFromVC:weak_self
//               comingStyle:ComingStyle_PUSH
//         presentationStyle:UIModalPresentationAutomatic
//             requestParams:nil
//                   success:^(id data) {}
//                  animated:YES];
    
//    [self.datePickerView show];
    
    self.ly_name = @"hello world";
    
    NSLog(@"%@",self.ly_name);
}
#pragma mark —— lazyLoad
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
