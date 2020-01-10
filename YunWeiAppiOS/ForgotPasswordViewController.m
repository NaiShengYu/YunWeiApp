//
//  ForgotPasswordViewController.m
//  YunWeiAppiOS
//
//  Created by 俞乃胜 on 2020/1/10.
//  Copyright © 2020 俞乃胜. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)creatView{
    
    UIView *backView1 = [UIView new];
    [self.view addSubview:backView1];
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset =10;
        make.left.right.bottom.offset = 0;
    }];
 
    NSArray *arr = @[@"请输入手机号",
                     @"请输入验证码",
                     @"密码长度8-16位，且必须含有英文字母",
                     @"密码长度8-16位，且必须含有英文字母"];
    NSArray *titleArray = @[@"手机号",@"验证码",@"新密码",@"确认密码"];
    for (int i =0; i <arr.count; i ++) {
        UIView *backView1 = [UIView new];
        [self.view addSubview:backView1];
        [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.top.offset =10+SafeAreaTopHeight;
            }else{
                make.top.equalTo([self.view viewWithTag:(1000+i-1)].mas_bottom).offset = 0;
            }
            make.left.right.offset = 0;
            make.height.offset = 50;
        }];
        backView1.tag =1000+i;
        
        UILabel *titleLab = [UILabel new];
        [backView1 addSubview:titleLab];
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 15;
            make.width.offset = 70;
            make.top.bottom.offset =0;
        }];
        titleLab.font =FontSize(16);
        titleLab.textColor = HEXCOLOR(0x333333);
        titleLab.text = titleArray[i];
        
        UITextField *textF = [UITextField new];
        [backView1 addSubview:textF];
        [textF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset = 0;
            make.left.equalTo(titleLab.mas_right).offset =15;
            if (i ==1) {
                make.right.offset = -100;
            }else{
                make.right.offset = -15;
            }
        }];
        textF.placeholder = arr[i];
        textF.font = FontSize(14);
        
        UIView *lineView = [UIView new];
        [backView1 addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset = 15;
            make.bottom.offset = 0;
            make.height.offset = 1;
            make.right.offset = -15;
        }];
        lineView.backgroundColor = HEXCOLOR(0xE8E8E8);
        
    }
    
    
}




- (void)ziDingYiDaoHangLan{

    UIButton *img =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [img addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [img setImage:[UIImage imageNamed:@"back"]
         forState:UIControlStateNormal];
    [img setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 20)];
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithCustomView:img];
    left.tintColor =[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem =left;
}
- (void)goBack:(UIButton *)but{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
