//
//  YSYKDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKDetailViewController.h"
#import "YSYKCommentController.h"
@interface YSYKDetailViewController ()<UITableViewDelegate,UITableViewDataSource,WYAutoCaruselDelegate,YSYKDetialDelegate>

/*tableView*/
@property (nonatomic,strong) UITableView *tableView;

/*tableView的headerView*/
@property (nonatomic,strong) UIView *headerView;

/*轮播数组*/
@property (nonatomic,strong) NSMutableArray *lunBoArr;

/*分享收藏按钮视图*/
@property (nonatomic,strong) UIView *clearView;

/*展示信息*/
@property (strong,nonatomic) UIView *showView;

/*列表视图*/
@property (strong,nonatomic) YSYKListView *listView;

/**/
@property (strong,nonatomic) YSYKDetailView *detailView;

@property (strong,nonatomic) UIView *TlistView;

@end

@implementation YSYKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
        
    [self.headerView addSubview:self.showView];
    [self.headerView addSubview:self.listView];
    [self.headerView addSubview:self.detailView];
    [self.headerView addSubview:self.TlistView];
    
    [self createAdsPageWithArr:self.lunBoArr];
}


#pragma mark *****懒加载*****
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        
    }
    return _headerView;
}


-(NSMutableArray *)lunBoArr{
    if (_lunBoArr) {
        _lunBoArr = [DataBase addSelecteArray];
    }
    return _lunBoArr;
}

#pragma mark /------信息展示视图------/
-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, SCREEN_WIDTH/2)];
        _showView.backgroundColor = HWColor(241, 241, 241);
        YSYKShowView *view = [[YSYKShowView alloc]initWithFrame:_showView.bounds];
        view.titleLabel.text = @"鲜生活*喵小春的鱼";
        view.wifiIcon.image = [UIImage imageNamed:@"WiFi"];
        view.parkIcon.image = [UIImage imageNamed:@"p"];
        view.averageLabel.text = @"人均 : ";
        view.commentLabel.text = @"4.2分";
        view.priceLabel.text = @"￥39";
        view.addressLabel.text = @"大雁塔";
        view.typeLabel.text = @"西餐";
        view.firstIcon.image = [UIImage imageNamed:@"金币"];
        view.firstLabel.text = @"10通币冲抵1元";
        view.secondIcon.image = [UIImage imageNamed:@"优惠"];
        view.secondLabel.text = @"每满10减1（买单立享）";
        [view.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [_showView addSubview:view];
    }
    return _showView;
}

-(void)btnClick{
    HWLog(@"立即兑换");
}

#pragma mark /-----列表视图-----/
-(YSYKListView *)listView{
    if (!_listView) {
        YSYKLayout *lay = [[YSYKLayout alloc]initListViewDetialView];
        _listView = [[YSYKListView alloc]initWithFrame:CGRectMake(0, self.showView.botoom, SCREEN_WIDTH, lay.listViewHeight)];
    }
    return _listView;
}


#pragma mark /-----详情视图-----/
-(YSYKDetailView *)detailView{
    if (!_detailView) {
        
        YSYKLayout *lay = [[YSYKLayout alloc]initCommentView];
        _detailView = [[YSYKDetailView alloc]initWithFrame:CGRectMake(0, self.listView.y+self.listView.height, SCREEN_WIDTH, lay.commentViewHeight)];
        _detailView.delegate = self;
    }
    return _detailView;
}

#pragma mark ------更多评论
-(void)moreCommentOfView
{
    YSYKCommentController *comment = [YSYKCommentController new];
    [self.navigationController pushViewController:comment animated:YES];
}



-(UIView *)TlistView{
    if (!_TlistView) {
        _TlistView = [[UIView alloc]initWithFrame:CGRectMake(0, self.detailView.y+self.detailView.height, SCREEN_WIDTH, 45)];
        _TlistView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        [_TlistView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_TlistView);
            make.top.equalTo(_TlistView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 44));
        }];
        
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@"商家"];
        [view addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).with.offset(10);
            make.centerY.equalTo(view);
            make.size.mas_equalTo(CGSizeMake(28, 30));
        }];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = HWColor(51, 51, 51);
        titleLabel.text = @"附近商家";
        [view addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view);
            make.left.equalTo(imgView.mas_right).with.offset(10);
        }];
        
    }
    return _TlistView;
}

-(void)clickMoreBtn{
    HWLog(@"more");
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"ys" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}

/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{
    
    HWLog(@"laniahao ");
    
}


#pragma mark /-----tableView及方法-----/

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.TlistView.y+self.TlistView.height;
    
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return SCREEN_WIDTH*0.46;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
        YSYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[YSYKTableViewCell alloc]initWithFrame:cell.bounds];
            cell.backgroundColor = HWColor(241, 241, 241);
            cell.imgView.image = [UIImage imageNamed:@"cellView"];
            cell.titleLabel.text = @"鲜生活*喵小春的鱼";
            cell.addressLabel.text = @"大雁塔";
            cell.typeLabel.text = @"中餐";
            cell.parkIcon.image = [UIImage imageNamed:@"p"];
            cell.wifiIcon.image = [UIImage imageNamed:@"WiFi"];
            cell.priceLabel.text = @"￥39";
            cell.priceLabel.textColor = HWColor(253, 151, 46);
            cell.averageLabel.text = @"人均 :";
            cell.averageLabel.textColor = HWColor(51, 51, 51);
            cell.distanceLabel.text = @"2.3km";
            cell.firstIcon.image = [UIImage imageNamed:@"金币"];
            cell.firstLabel.text = @"10通币冲抵1元";
            cell.secondIcon.image = [UIImage imageNamed:@"优惠"];
            cell.secondLabel.text = @"每满10减1（买单立享）";
        }
        return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
