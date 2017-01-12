//
//  OwnerViewController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "OwnerViewController.h"
#import "JWShareView.h"

@interface OwnerViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *bottomView;

@end

@implementation OwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
     self.navigationItem.title = @"用户登录";
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];

    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_HEIGHT/7-49, SCREEN_WIDTH, SCREEN_HEIGHT/7)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        //其他方式登录
        UIButton *otherBtn = [[UIButton alloc]init];
        [otherBtn setTitle:@"其他方式登录" forState:UIControlStateNormal];
        [otherBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        [otherBtn setBackgroundColor:[UIColor clearColor]];
        otherBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [otherBtn addTarget:self action:@selector(clickOtherBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:otherBtn];
        
        [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_bottomView);
            
        }];
    
    }
    return _bottomView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7-49)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT-SCREEN_HEIGHT/7-49-SCREEN_HEIGHT/6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OwnerMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[OwnerMainTableViewCell alloc]initWithFrame:cell.bounds];
        cell.selectionStyle = NO;
        cell.titleLabel.text = @"使用帐号和密码登录";
        cell.accoutLabel.text = @"帐号";
        cell.accoutField.placeholder = @"手机号码/邮箱地址";
        cell.pwdLabel.text = @"密码";
        cell.pwdField.placeholder = @"请输入密码";
        [cell.loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
        [cell.retrievePwdBtn addTarget:self action:@selector(clickRetrievePwd) forControlEvents:UIControlEventTouchUpInside];
        [cell.registerBtn addTarget:self action:@selector(clickRetgisterBtn) forControlEvents:UIControlEventTouchUpInside];

    }
    return cell;
}

//点击登录按钮
-(void)clickLoginBtn{
    CompanyViewController *vc = [CompanyViewController new];
    [self.navigationController pushViewController:vc animated:YES
     ];
}

//点击找回密码
-(void)clickRetrievePwd{
     RetrievePwdViewController *vc = [RetrievePwdViewController new];
    [self.navigationController pushViewController:vc animated:YES
     ];

}

//点击用户注册
-(void)clickRetgisterBtn{
    RegisterViewController *vc = [RegisterViewController new];
    [self.navigationController pushViewController:vc animated:YES
     ];
}

//点击其他方式登录
-(void)clickOtherBtn:(UIButton *)sender
{
    NSArray *contentArray = @[@{@"name":@"QQ",@"icon":@"sns_icon_qq"},
        @{@"name":@"微信",@"icon":@"sns_icon_wechat"},
        @{@"name":@"新浪微博",@"icon":@"sns_icon_weibo"},
                              ];
    JWShareView *shareView = [[JWShareView alloc] init];
    [shareView addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title) {
        switch (tag) {
            case 0:
                [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                   
                    if (state == SSDKResponseStateSuccess) {
                        
                        HWLog(@"%@",user.credential);
                        HWLog(@"%@",user.nickname);
                        HWLog(@"%@",user.uid);
                        HWLog(@"%@",user.credential.token);
                    }
                    else
                    {
                        HWLog(@"%@",error);
                    }
                    
                }];
                break;
            case 1:
                
                [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    if (state == SSDKResponseStateSuccess) {
                   
                        HWLog(@"wechat=====sucess");
                    }
                    else
                    {
                        HWLog(@"wechat=====%@",error);
                    }
                }];
                break;
            case 2:
                [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                    if (state == SSDKResponseStateSuccess) {
                        HWLog(@"SinaWeibo=====sucess");
                    }
                    else
                    {
                        HWLog(@"SinaWeibo=====%@",error);
                    }
                }];
                break;
            default:
                break;
        }
        NSLog(@"%ld --- %@", tag, title);
    }];
         
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
