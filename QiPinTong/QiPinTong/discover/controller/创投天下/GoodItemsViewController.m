//
//  GoodItemsViewController.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodItemsViewController.h"

@interface GoodItemsViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;

/*搜索栏*/
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchBar *searchBar;

/**筛选栏*/
@property (nonatomic,strong) UIView *siftView;

@property (strong,nonatomic) UIButton *btn1;
@property (strong,nonatomic) UIButton *btn2;
@property (strong,nonatomic) UIButton *btn3;
@property (strong,nonatomic) UIButton *btn4;

/*筛选按钮数组*/
@property (strong,nonatomic) NSMutableArray *buttonArray;

@end

@implementation GoodItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.searchView];
    
    [self createAdsPageWithArr:self.arrLunBo];
    
}

#pragma mark -----懒加载-------


/*轮播*/
-(NSMutableArray *)arrLunBo
{
    if (!_arrLunBo) {
        _arrLunBo = [DataBase addSelecteArray];
        
    }
    return _arrLunBo;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+10)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
        
        [_headerView addSubview:self.searchView];
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


-(UIView *)siftView{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
        _siftView.backgroundColor = [UIColor whiteColor];
        
        NSArray *titleArray = @[@"区域",@"领域",@"轮次",@"额度"];
        _buttonArray = [NSMutableArray array];
        for (int i = 0; i<titleArray.count; i++) {
            
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.frame = CGRectMake(SCREEN_WIDTH/titleArray.count*i,0,SCREEN_WIDTH/titleArray.count-1, 40-1);
            bt.titleLabel.font = [UIFont systemFontOfSize:16];
            [bt setTitle:titleArray[i] forState:UIControlStateNormal];
            [bt setTitleEdgeInsets: UIEdgeInsetsMake(0,-12 , 0, 12)];
            [bt setImageEdgeInsets:UIEdgeInsetsMake(0, 38, 0, -38)];
            [bt setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
            [bt setImage:[UIImage imageNamed:@"icon_up"] forState:UIControlStateSelected];
            [bt setTitleColor:HWColor(153, 153, 153) forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            bt.selected = NO;
            bt.tag = i;
            [bt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_buttonArray addObject:bt];
            
            if (bt.tag == 0) {
                self.btn1 = bt;
            }
            else if (bt.tag == 1){
                self.btn2 = bt;
            }
            else if (bt.tag == 2){
                self.btn3 = bt;
            }
            else{
                self.btn4 = bt;
            }
            
            for (int j = 1; j < 4; j++) {
                UIView *view = [UIView new];
                view.frame = CGRectMake(j*(SCREEN_WIDTH/titleArray.count-1), 8, 1, 24);
                view.backgroundColor = HWColor(241, 241, 241);
                
                [_siftView addSubview:view];
            }
            
            [_siftView addSubview:bt];
        }

        
    }
    return _siftView;
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
    [aut createCaruselWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"vent" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = self.tableView.contentOffset.y;
    if (offset >lunBoheight) {
        HWLog(@"开始显示");
        [UIView animateWithDuration:0.1 animations:^{
            [self.view addSubview:self.siftView];
            
        }];
    }
    else{
        [UIView animateWithDuration:0.1 animations:^{
            [self.siftView removeFromSuperview];
        }];
    }
}

-(void)buttonAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    switch (sender.tag) {
        case 0:
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 1:
            self.btn1.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 2:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn4.selected = NO;
            break;
        default:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            break;
    }
}

#pragma mark ------tableview及方法------

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height+self.searchView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_WIDTH*0.27;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    GoodItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GoodItemsTableViewCell alloc]initWithFrame:cell.bounds];
        cell.imgView.image = [UIImage imageNamed:@"qptHeader"];
        cell.titleLabel.text = @"儿童动漫秀";
        cell.vIcon.image = [UIImage imageNamed:@"vip"];
        cell.amountLabel.text = @"150W";
        cell.amountLabel.textColor = HWColor(253, 134, 0);
        cell.subLabel.text = @"儿童动漫电影平台";
        cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        cell.addressLabel.text = @"西安";
        cell.praiseLabel.text = @"23";
        cell.praiseIcon.image = [UIImage imageNamed:@"赞赞"];
        cell.numberLabel.text = @"2345";
        cell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
        
        cell.label.text = @"天使轮";
        cell.label.layer.borderWidth = 1;
        cell.label.layer.cornerRadius = 2;
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodDetailViewController *vc = [GoodDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
