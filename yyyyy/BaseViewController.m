//
//  BaseViewController.m
//  yyyyy
//
//  Created by User on 2017/11/20.
//  Copyright © 2017年 User. All rights reserved.
//

#import "BaseViewController.h"
#import "PersonModel.h"
#import "MyLineView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%d",self.isViewLoaded);
    NSArray *viewControllers = self.navigationController.viewControllers;
    NSArray *childsViewController = self.navigationController.childViewControllers;
    NSLog(@"%@-%@",viewControllers, childsViewController);
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *plistPath = [documentPath stringByAppendingPathComponent:@"data.plist"];
    
    NSDictionary *dic = @{@"姓名" : @"god", @"age": @"未知"};
    BOOL isWrite = [dic writeToFile:plistPath atomically:YES];
    
    NSLog(@"%d",isWrite);
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
//    [self keyArchive];
    [self initView];
    
    BOOL bool1 = [self passwordVerification:@"12345645"];
    BOOL bool2 = [self passwordVerification:@"12sdfs45"];
    BOOL bool3 = [self passwordVerification:@"AA12AAA645"];
    BOOL bool4 = [self passwordVerification:@"123sDs"];
    BOOL bool5 = [self passwordVerification:@"123sDsjdsfiensws_"];
    BOOL bool6 = [self passwordVerification:@"sdfsdf"];
    BOOL bool7 = [self passwordVerification:@"sdd2f"];
    BOOL bool8 = [self passwordVerification:@"sdfsdfdfsdfsdfs1"];
    NSLog(@"");
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)loadView
{
    [super loadView];
    
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = myView;
}

- (void)keyArchive
{
    PersonModel *personModel = [[PersonModel alloc] init];
    personModel.name = @"god";
    personModel.ID_card_num = @"null";
    
    PetModel *pet1 = [[PetModel alloc] init];
    pet1.pet_name = @"person";
    pet1.age = 100000;
    
    PetModel *pet2 = [[PetModel alloc] init];
    pet2.pet_name = @"animal";
    pet2.age = 10000000;
    
    personModel.petArr = @[pet1, pet2];
    
    // 存储单个对象
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *archivePath = [documentPath stringByAppendingPathComponent:@"person.archive"];
    [NSKeyedArchiver archiveRootObject:personModel toFile:archivePath];
    
    PersonModel *person = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    NSLog(@"%@",person);
    
    // 存储多个对象
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:personModel forKey:@"person1"];
    [archiver encodeObject:person forKey:@"person2"];
    [archiver finishEncoding];
    
    NSString *archiveDataPath = [documentPath stringByAppendingPathComponent:@"data.plist"];
    [data writeToFile:archiveDataPath atomically:YES];
    
    NSData *unarchiveData = [NSData dataWithContentsOfFile:archiveDataPath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:unarchiveData];
    PersonModel *p1 = [unarchiver decodeObjectForKey:@"person1"];
    PersonModel *p2 = [unarchiver decodeObjectForKey:@"person2"];
    [unarchiver finishDecoding];
    
    NSLog(@"%@-%@",p1, p2);
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSMutableArray *deepCopyArr = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:arr]];
    NSLog(@"deepCopyArr--%@",deepCopyArr);
    

}

/// 密码校验（必须含有数字和字母）
- (BOOL)passwordVerification:(NSString *)password
{
//    可以包含数字、字母、下划线，并且要同时含有数字和字母，且长度要在6-15之间
    NSString *verification = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{6,15}$";
    //  ^\w+$   ^[a-zA-Z0-9]\\w{5,14}$  ^\w{5,14}$   [a-zA-Z0-9][a-zA-Z0-9]{3,15}   ^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{8,16}$
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",verification];
    return [numberPre evaluateWithObject:password];
}

- (void)initView
{
    MyLineView *lineView = [[MyLineView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
    [self.view addSubview:lineView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
