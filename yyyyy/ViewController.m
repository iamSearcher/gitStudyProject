//
//  ViewController.m
//  yyyyy
//
//  Created by User on 2017/10/20.
//  Copyright © 2017年 User. All rights reserved.
//

#import "ViewController.h"
#import <UIScrollView+EmptyDataSet.h>

#import "BaseViewController.h"

#import "SingleObject.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *testArr;

@end

@implementation ViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SingleObject shareInstance];
    NSLog(@"sharedInstance--%@, alloc--%@", [SingleObject shareInstance], [SingleObject new]);
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:@[@"1", @"2"]];
    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:@[@"3", @"4"]];

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sjdkf) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
    [NSThread sleepForTimeInterval:1];
    
    [arr addObjectsFromArray:@[arr1, arr2]];
    
    void (^logBlockMutableCopy)() = ^{
        NSLog(@"%@",arr);
    };
    
    logBlockMutableCopy();
    [arr[0] replaceObjectAtIndex:0 withObject:@"11"];
    logBlockMutableCopy();
    NSLog(@"%@",arr);
    
//    [self imageViewAnimation];
//    [self.view addSubview:self.tableView];
    
    CGRect rect = [[self.tableView valueForKey:@"frame"] CGRectValue];

    [self.tableView setValue:[UIColor whiteColor] forKeyPath:@"backgroundView.backgroundColor"];
    UIColor *color = [self.tableView valueForKeyPath:@"backgroundView.backgroundColor"];

//    for (NSInteger i = 0; i < 100; i++)
//    {
//        [self.dataArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
//    }
    
//    NSObject *notificationSender = [[NSObject alloc] init];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification" object:notificationSender userInfo:@{@"key" : @"object"}];
//    
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
//    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 44)];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"nihao";
//    textField.inputAccessoryView = label;
//    
//    [self.view addSubview:textField];
    
    
}

- (IBAction)pushAction:(id)sender {
    BaseViewController *vc = [[BaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    @synchronized (self.dataArr)
    {
        
    }
    @synchronized (self)
    {
        
    }
}


- (void)imageViewAnimation
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Header_default"]];
    imageView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:imageView];
    
    
    imageView.animationImages = @[[UIImage imageNamed:@"Header_default"], [UIImage imageNamed:@"Home_bg"], [UIImage imageNamed:@"Left_bg"]];
    imageView.animationDuration = 2.0;
    if (!imageView.isAnimating)
    {
        [imageView startAnimating];
    }
    
    [[NSBundle mainBundle] loadNibNamed:@"" owner:nil options:nil];
}

- (UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr
{
    if (_dataArr == nil)
    {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%@个",self.dataArr[indexPath.row]];;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}


// 右滑
//- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//        NSLog(@"delete");
//
//        [tableView beginUpdates];
//
//        [self.dataArr removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//
//        [tableView endUpdates];
//
//    }];
//
//
//    UIContextualAction *action2 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"置顶" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//        NSLog(@"top");
//
//    }];
//
//    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[action, action2]];
//    return configuration;
//
//}

//左滑
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"delete");

        [tableView beginUpdates];

        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];

        [tableView endUpdates];

        completionHandler(true);
    }];
    
    
    UIContextualAction *action2 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"置顶" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"top");
        completionHandler(true);
    }];
    
    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[action, action2]];
    
    /// 默认滑动全屏启动第一个action   默认值是YES
    configuration.performsFirstActionWithFullSwipe = NO;
    return configuration;
}


#pragma mark -- getter
- (NSMutableArray *)testArr
{
    if (_testArr == nil)
    {
        _testArr = [[NSMutableArray alloc] init];
        NSArray *arr1 = @[@"1", @"2"];
        NSArray *arr2 = @[@"3", @"4"];
        [_testArr addObjectsFromArray:@[arr1, arr2]];
    }
    return _testArr;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
