//
//  RegisterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIResponder+FirstResponder.h"

@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *bottomView;

@end

@implementation RegisterViewController{
    //BOOL keyboardIsShowing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    
//    [self enableEditTextScroll];
//    self.view.userInteractionEnabled = YES;
//    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)]];
    

    //[self setupFrame];
    
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_HEIGHT/7, SCREEN_WIDTH, SCREEN_HEIGHT/7)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        //其他方式登录
        UIButton *otherBtn = [[UIButton alloc]init];
        [otherBtn setTitle:@"已经是会员，请登录" forState:UIControlStateNormal];
        [otherBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        [otherBtn setBackgroundColor:[UIColor clearColor]];
        otherBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [otherBtn addTarget:self action:@selector(clickOtherBtn) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:otherBtn];
        
        [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_bottomView);
            
        }];
        
    }
    return _bottomView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7)];
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
    return SCREEN_HEIGHT-SCREEN_HEIGHT/7-SCREEN_HEIGHT/6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[RegisterTableViewCell alloc]initWithFrame:cell.bounds];
        cell.selectionStyle = NO;
        cell.titleLabel.text = @"会员注册";
        cell.classLabel.text = @"类    别";
        cell.phoneLabel.text = @"手机号";
        cell.commitLabel.text = @"验证码";
        [cell.classBtn addTarget:self action:@selector(clickClassBtn) forControlEvents:UIControlEventTouchUpInside];
        [cell.commitBtn addTarget:self action:@selector(clickCommitBtn) forControlEvents:UIControlEventTouchUpInside];
        cell.pwdLabel.text = @"密  码";
        cell.resetLabel.text = @"重置密码";
        [cell.registerBtn addTarget:self action:@selector(clickregisterBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

#pragma mark *****类别选择******
-(void)clickClassBtn{
    HWLog(@"选择");
    
}

/*获取验证码*/
-(void)clickCommitBtn{
    HWLog(@"获取验证码");

}

/*注册按钮*/
-(void)clickregisterBtn{
    HWLog(@"注册");
}

/*会员登录*/
-(void)clickOtherBtn{
    HWLog(@"会员登录");
}


//#pragma mark -------文本框上移--------
//- (void)viewClicked{
//    if(keyboardIsShowing){
//        id responder = [UIResponder currentFirstResponder];
//        if([responder isKindOfClass:[UITextView class]] || [responder isKindOfClass:[UITextField class]]){
//            UIView *view = responder;
//            [view resignFirstResponder];
//        }
//    }
//}
//
//- (CGFloat)shouldScrollWithKeyboardHeight:(CGFloat)keyboardHeight{
//    id responder = [UIResponder currentFirstResponder];
//    if([responder isKindOfClass:[UITextView class]] || [responder isKindOfClass:[UITextField class]]){
//        CGFloat y = self.view.frame.origin.y;
//        CGFloat bottom = y + self.view.frame.size.height-216;
//        if(bottom > SCREEN_HEIGHT - keyboardHeight){
//            return bottom - (SCREEN_HEIGHT - keyboardHeight);
//        }
//    }
//    return 0;
//}
//
//- (void)enableEditTextScroll{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wpKeyboardDidHide) name:UIKeyboardDidHideNotification object:nil];
//}
//
//- (void)wpKeyboardDidShow{
//    keyboardIsShowing = YES;
//}
//
//- (void)wpKeyboardDidHide{
//    keyboardIsShowing = NO;
//}
//
//- (void)wpKeyboardWillHide:(NSNotification *)note {
//    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
//    __weak RegisterViewController *weakSelf = self;
//    [UIView animateWithDuration:duration animations:^{
//        CGRect bounds = weakSelf.view.bounds;
//        weakSelf.view.bounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
//    }];
//}
//
//- (void)wpKeyboardWillShow:(NSNotification *)note {
//    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
//    CGFloat keyboardHeight = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
//    CGFloat shouldScrollHeight = [self shouldScrollWithKeyboardHeight:keyboardHeight];
//    if(shouldScrollHeight == 0){
//        return;
//    }
//    __weak RegisterViewController *weakSelf = self;
//    [UIView animateWithDuration:duration animations:^{
//        CGRect bounds = weakSelf.view.bounds;
//        weakSelf.view.bounds = CGRectMake(0, shouldScrollHeight + 10, bounds.size.width, bounds.size.height);
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
