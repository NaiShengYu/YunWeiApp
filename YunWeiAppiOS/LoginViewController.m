//
//  LoginViewController.m
//  YunWeiAppiOS
//
//  Created by 俞乃胜 on 2020/1/10.
//  Copyright © 2020 俞乃胜. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgotPasswordViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *nameTextF;
@property (nonatomic,strong)UITextField *wordTextF;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self creatView];
    
}

- (void)creatView{
    
    UIImageView *imgV =[UIImageView new];
    [self.view addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset = 0;
        make.top.offset = SafeAreaTopHeight;
        make.height.width.offset = 180;
    }];
    imgV.image = [UIImage imageNamed:@"logo"];
    
    UIView *backView1 = [UIView new];
    [self.view addSubview:backView1];
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset = 0;
        make.left.offset = 39;
        make.right.offset = -39;
        make.height.offset =45;
        make.top.offset = screenHeight/10.0*3+30;
    }];
    backView1.backgroundColor = HEXCOLOR(0xF1F5FB);
    
    _nameTextF = [UITextField new];
    [backView1 addSubview:_nameTextF];
    [_nameTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(backView1).insets = UIEdgeInsetsMake(0, 10, 0, 0);
    }];
    _nameTextF.delegate = self;
    _nameTextF.font = FontSize(14);
    _nameTextF.placeholder = @"账户";
    
    UIView *backView2 = [UIView new];
    [self.view addSubview:backView2];
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset = 0;
        make.left.offset = 39;
        make.right.offset = -39;
        make.height.offset =45;
        make.top.equalTo(backView1.mas_bottom).offset = 20;
    }];
    backView2.backgroundColor = HEXCOLOR(0xF1F5FB);
    
    _wordTextF = [UITextField new];
    [backView2 addSubview:_wordTextF];
    [_wordTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(backView2).insets = UIEdgeInsetsMake(0, 10, 0, 0);
    }];
    _wordTextF.delegate = self;
    _wordTextF.font = FontSize(14);
    _wordTextF.secureTextEntry = YES;
    _wordTextF.placeholder = @"密码";
    
    UIButton *showBut = [UIButton new];
    [backView2 addSubview:showBut];
    [showBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset = 0;
        make.right.offset = -10;
        make.height.offset = 24;
        make.width.offset = 36;
    }];
    [showBut setImage:[UIImage imageNamed:@"Group6"] forState:UIControlStateNormal];
    [showBut setImage:[UIImage imageNamed:@"show"] forState:UIControlStateSelected];
    [showBut addTarget:self action:@selector(isSecureTextEntry:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *remaindBut = [UIButton new];
    [self.view addSubview:remaindBut];
    [remaindBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 30;
        make.top.equalTo(backView2.mas_bottom).offset = 5;
        make.height.offset = 40;
        make.width.offset =80;
    }];
    
    [remaindBut setImage:[UIImage imageNamed:@"icon_unselect"] forState:UIControlStateNormal];
    [remaindBut setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateSelected];
    [remaindBut setTitle:@"记住密码" forState:UIControlStateNormal];
    [remaindBut setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -5)];
    
    [remaindBut setTitleColor:HEXCOLOR(0x777777) forState:UIControlStateNormal];
    remaindBut.titleLabel.font = FontSize(12);
    [remaindBut addTarget:self action:@selector(isSaveParssWord:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    UIImageView *backImgV = [UIImageView new];
    //    [self.view addSubview:backImgV];
    //    [backImgV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(remaindBut.mas_bottom).offset = 25;
    //        make.left.offset = 39;
    //        make.right.offset = -39;
    //        make.height.offset = 45;
    //    }];
    
    UIButton *loginBut = [UIButton new];
    [self.view addSubview:loginBut];
    [loginBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(remaindBut.mas_bottom).offset = 25;
        make.left.offset = 39;
        make.right.offset = -39;
        make.height.offset = 45;
    }];
    
    [loginBut setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [loginBut setTitle:@"登 录" forState:UIControlStateNormal];
    loginBut.titleLabel.font = FontSize(16);
    [loginBut addTarget:self action:@selector(isSaveParssWord:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forgetBut = [UIButton new];
    [self.view addSubview:forgetBut];
    [forgetBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBut.mas_bottom).offset = 20;
        make.left.offset = 39;
        make.right.offset = -39;
        make.height.offset = 30;
    }];
    [forgetBut setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetBut.titleLabel.font = FontSize(12);
    [forgetBut setTitleColor:HEXCOLOR(0x3D8FFE) forState:UIControlStateNormal];
    [forgetBut addTarget:self action:@selector(forgetClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)isSecureTextEntry:(UIButton *)but{
    but.selected = !but.selected;
    _wordTextF.secureTextEntry = !_wordTextF.secureTextEntry;
}
- (void)isSaveParssWord:(UIButton *)but{
    but.selected = !but.selected;
    
}
- (void)forgetClick{
    
    [self.navigationController pushViewController:[ForgotPasswordViewController new] animated:YES];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
    
}
@end
