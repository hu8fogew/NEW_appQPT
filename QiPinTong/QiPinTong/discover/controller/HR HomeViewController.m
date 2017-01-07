//
//  HR HomeViewController.m
//  家长界
//
//  Created by taylor on 2016/12/7.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "HR HomeViewController.h"

@interface HR_HomeViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchBar *searchBar;

@property (nonatomic,strong) UIView *selectBtnView;

@property (nonatomic,strong) NSMutableArray *lunBoArr;

@property (nonatomic,strong) NSString *segStr;


/*按钮正常与选中*/
@property (nonatomic,strong) UIButton *btnN;
@property (nonatomic,strong) UIButton *btnS;

@end

@implementation HR_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HR Home";
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.selectBtnView];
    [self.headerView addSubview:self.searchView];
    
    [self createAdsPageWithArr:self.lunBoArr];
    
    self.btnN.selected = YES;
    self.segStr = @"看点";
    
}



#pragma mark -----懒加载------


-(NSMutableArray *)lunBoArr{
    if (!_lunBoArr) {
        _lunBoArr = [DataBase addSelecteArray];
    }
    return _lunBoArr;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        
    }
    return _headerView;
}

/**搜搜框*/
-(UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _searchView.backgroundColor = [UIColor whiteColor];
        
        self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 5, SCREEN_WIDTH-80, 40)];
        self.searchBar.placeholder = @"请输入类别或关键字";
        self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        
        [_searchView addSubview:self.searchBar];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"西安" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 45, 0, -45);
        [btn setTitleColor:HWColor(53, 53, 53) forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, SCREEN_WIDTH/6, self.searchView.height);
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_searchView addSubview:btn];
        
    }
    return _searchView;
}


-(UIView *)selectBtnView{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+50, SCREEN_WIDTH, SCREEN_WIDTH*0.2)];
        _selectBtnView.backgroundColor = HWColor(241, 241, 241);
        
        [_selectBtnView addSubview:self.btnN];
        [_selectBtnView addSubview:self.btnS];
        
    }
    return _selectBtnView;
}

-(UIButton *)btnN{
    if (!_btnN) {
        _btnN = [self createButtonWithFrame:CGRectMake(10, self.selectBtnView.height/4, (SCREEN_WIDTH-20)/2, self.selectBtnView.height/2) andTitle:@"看点" andTag:0];
    }
    return _btnN;
}

-(UIButton *)btnS{
    if (!_btnS) {
        _btnS = [self createButtonWithFrame:CGRectMake(10+(SCREEN_WIDTH-20)/2, self.selectBtnView.height/4, (SCREEN_WIDTH-20)/2,self.selectBtnView.height/2) andTitle:@"HR" andTag:1];
    }
    return _btnS;
}


-(UIButton *)createButtonWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"blue"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)clickBtn:(UIButton *)sender{
    
    if (sender.tag == 0) {
        self.btnN.selected = YES;
        self.btnS.selected = NO;
        self.segStr = @"看点";
        [self.tableView reloadData];
    }
    
    else if (sender.tag == 1){
        self.btnN.selected = NO;
        self.btnS.selected = YES;
        self.segStr = @"HR";
        [self.tableView reloadData];
    }
}

#pragma mark /*********轮播图的实现*******/
-(void)createAdsPageWithArr:(NSMutableArray *)source
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in source) {
        [arr addObject:[dic objectForKey:@"slecteImg"]];
    }
    //封装的轮播view实现
    WYAutoCarusel *aut = [[WYAutoCarusel alloc]init];
    [aut createCaruselWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"hr" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}

-(void)pushViewController:(NSInteger)tag{
    
    
}

#pragma mark /*-----tableView及方法------*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.selectBtnView.y+self.selectBtnView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     if ([self.segStr isEqualToString:@"看点"]) {
         return 130;
     }
    return SCREEN_WIDTH*0.34;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   static NSString *identifier = @"identifier";
    
    if ([self.segStr isEqualToString:@"看点"]) {
        EmployTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[EmployTableViewCell alloc]initWithFrame:cell.bounds];
            cell.titleLabel.text = @"西安人才市场";
            cell.timeLabel.text = @"时间：2016-09-26至2016-11-11";
            cell.addressLabel.text = @"南三环i都会1单元";
            
        }
        return cell;
    }
    
    else{
    HRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[HRTableViewCell alloc]initWithFrame:cell.bounds];
            cell.imgView.image = [UIImage imageNamed:@"ycymHeaderImage"];
            cell.nameLabel.text = @"甄瑞芳";
            cell.nameIcon.image = [UIImage imageNamed:@"vip"];
            cell.numberLabel.text = @"3228";
            cell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
            cell.companyLabel.text = @"比亚迪股份有限公司";
            cell.eduBackIcon.image = [UIImage imageNamed:@"education"];
            cell.eduBackLabel.text = @"本科";
            cell.ageIcon.image = [UIImage imageNamed:@"time_image"];
            cell.ageLabel.text = @"3-5年";
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.addressLabel.text = @"西安";
            cell.jobClassLabel.text = @"职位类别：";
            cell.jobLabel.text = @"程序猿/设计";
        }
        return cell;
    }
  
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
