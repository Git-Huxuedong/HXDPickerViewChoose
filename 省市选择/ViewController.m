//
//  ViewController.m
//  省市选择
//
//  Created by huxuedong on 15/9/29.
//  Copyright © 2015年 胡学东. All rights reserved.
//

#import "ViewController.h"
#import "HXDCity.h"

@interface ViewController () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *shengLable;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *city;

@end

@implementation ViewController

//懒加载
- (NSArray *)city {
    if (_city == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil];
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in tempArray) {
            HXDCity *model = [HXDCity provinceWithDict:dict];
            [models addObject:model];
        }
        _city = models;
    }
    return _city;
}

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

//每列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.city.count;
    } else {
        NSInteger rowIndex = [self.pickerView selectedRowInComponent:0];
        HXDCity *model = self.city[rowIndex];
        return model.cities.count;
    }
}

//每列每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.city[row] name];
    } else {
        NSInteger rowIndex = [self.pickerView selectedRowInComponent:0];
        HXDCity *model = self.city[rowIndex];
        //判断当前的行数是否小于第0列当前行数组的长度
        if (row < model.cities.count) {
            return model.cities[row];
        } else {
            return nil;
        }
    }
}

//点击某列某行执行的方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        //刷新第1列数据
        [self.pickerView reloadComponent:1];
        //第1列默认显示第1列第0行数据
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
    }
    //获取当前选中第0列的第几行
    NSInteger columIndex = [self.pickerView selectedRowInComponent:0];
    //获取当前选中第1列的第几行
    NSInteger rowIndex = [self.pickerView selectedRowInComponent:1];
    //获取第0列对应行的数据
    HXDCity *model = self.city[columIndex];
    //为省份label设值
    self.shengLable.text = model.name;
    //判断第1列对应的行数是否小于第0列对应行数组的长度
    if (rowIndex < model.cities.count) {
        //为城市label设值
        self.cityLabel.text = model.cities[rowIndex];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取数组中第0个元素
    HXDCity *model = self.city[0];
    self.shengLable.text = model.name;
    self.cityLabel.text = model.cities[0];
}

@end
