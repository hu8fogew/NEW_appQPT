//
//  YCYMViewController.m
//  家长界
//
//  Created by taylor on 2016/12/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMViewController.h"

@interface YCYMViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,WYAutoCaruselDelegate,SGSegmentedControlDelegate>

@property (strong,nonatomic) UICollectionView *ycymCollect;

@property (strong,nonatomic) UICollectionView *gxzwCollect;

/*headerView的创建*/
@property(nonatomic,strong)UIView *headerView;

/**搜索框*/
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UISearchController *searchController;

/**高薪职位**/
@property (nonatomic,strong) UIView *activityView;

/*选择条*/
@property(nonatomic,strong)UIView *selectButtonView;

/*创建筛选按钮*/

@property(nonatomic,strong)UIView *ycymSiftView;
@property(nonatomic,strong)SiftView *si;
@property(nonatomic,strong)UIView *backgroundSiftView;

/*轮播图的数组*/
@property(nonatomic,strong)NSMutableArray *lunboArr;


@property (nonatomic,copy) NSString *segStr;

/*选择条目*/
@property (nonatomic,strong) SGSegmentedControl *segment;
@end

@implementation YCYMViewController

id ycymCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"有才有貌";
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.headerView addSubview:self.searchView];
    [self.headerView addSubview:self.activityView];
    [self.headerView addSubview:self.selectButtonView];
    
    [self createAdsPageWithArr:self.lunboArr];
    
    NSArray *arr = @[@"有才有貌",@"高薪职位"];
    [self createSeleBarViewWithArr:arr];
    
    self.segStr = @"有才有貌";
}

#pragma mark /**********懒加载************/

//轮播图数组
-(NSMutableArray *)lunboArr
{
    if (!_lunboArr) {
        _lunboArr = [DataBase addSelecteArray];
    }
    return _lunboArr;
}

//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50+lunBoheight+self.activityView.height+10+self.selectButtonView.height)];
    }
    
    return _headerView;
    
}

/**搜搜框*/
-(UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _searchView.backgroundColor = [UIColor whiteColor];
        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(70, 5, SCREEN_WIDTH-80, 40)];
        searchBar.placeholder = @"请输入类别或关键字";
        searchBar.searchBarStyle = UISearchBarStyleMinimal;
        
        [_searchView addSubview:searchBar];
        
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

/**高薪职位，加入**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+50, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@"ycym_image"];
        [_activityView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_activityView).with.offset(15);
            make.centerY.equalTo(_activityView);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        UILabel *lab = [UILabel new];;
        lab.font = [UIFont systemFontOfSize:16];
        lab.textColor = HWColor(102, 102, 102);
        lab.text = @"高薪职位 , ”职“ 等你来";
        [_activityView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_right).with.offset(5);
            make.centerY.equalTo(imgView);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"我要加入" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [HWColor(169, 133, 144)CGColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 15;
        [button setTitleColor:HWColor(169, 133, 144) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        [_activityView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_activityView).with.offset(-15);
            make.centerY.equalTo(imgView);
            make.size.mas_equalTo(CGSizeMake(90, 30));
        }];
    }
    return _activityView;
}

-(void)clickBtn{
    HWLog(@"6668");
}

/*----选择条目----*/
-(UIView *)selectButtonView
{
    if (!_selectButtonView) {
        _selectButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.activityView.y+self.activityView.height+10, SCREEN_WIDTH, 50)];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        vi.backgroundColor = [UIColor whiteColor];
        [_selectButtonView addSubview:vi];
    }
    return _selectButtonView;
}

/*----筛选按钮的添加----*/
-(UIView *)ycymSiftView
{
    if (!_ycymSiftView) {
        _ycymSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
        _ycymSiftView.backgroundColor = [UIColor whiteColor];
        NSArray *arr = @[@"区域",@"职位要求",@"公司要求"];
        self.si = [[SiftView alloc]initWithFrame:_ycymSiftView.bounds andArr:arr andAction:@selector(siftBtnClick:) andTaget:self];

        [_ycymSiftView addSubview:self.si];

    }

    return _ycymSiftView;
}

-(UIView *)backgroundSiftView
{
    if (!_backgroundSiftView) {
        _backgroundSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
    }
    return _backgroundSiftView;
}

#pragma mark /------滚动显示筛选条------/
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.segStr isEqualToString:@"有才有貌"]) {
        CGFloat offset = self.ycymCollect.contentOffset.y;
        
        if (offset > 260-64-self.ycymSiftView.height ) {
            HWLog(@"开始显示");
            [UIView animateWithDuration:0.1 animations:^{
                [self.view addSubview:self.backgroundSiftView];
                self.backgroundSiftView.backgroundColor = [UIColor grayColor];
                [self.backgroundSiftView addSubview:self.ycymSiftView];
            }];
        }
        if (0<=offset && offset <260-64-self.ycymSiftView.height) {
            [UIView animateWithDuration:0.1 animations:^{
                
                [self.backgroundSiftView removeFromSuperview];
            }];
            
        }
 
    }
    
    else{
        CGFloat offset = self.gxzwCollect.contentOffset.y;
        
        if (offset > 260-64-self.ycymSiftView.height ) {
            HWLog(@"开始显示");
            [UIView animateWithDuration:0.1 animations:^{
                [self.view addSubview:self.backgroundSiftView];
                self.backgroundSiftView.backgroundColor = [UIColor grayColor];
                [self.backgroundSiftView addSubview:self.ycymSiftView];
            }];
        }
        if (0<=offset && offset <260-64-self.ycymSiftView.height) {
            [UIView animateWithDuration:0.1 animations:^{
                
                [self.backgroundSiftView removeFromSuperview];
            }];
            
        }
    }
    
}

#pragma mark  /-------筛选栏-------/

-(void)siftBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.tag == 0) {

        self.si.btnS.selected = NO;
        self.si.btnT.selected = NO;

    }

    if (sender.tag == 1) {
        self.si.btnF.selected = NO;
        self.si.btnT.selected = NO;

    }

    if (sender.tag == 2) {
        self.si.btnF.selected = NO;
        self.si.btnS.selected = NO;

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
    [aut createCaruselWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"lunbo1" WithInterval:2];

    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];

    aut.delegate = self;
}
/*轮播图跳转代理*/
-(void)pushViewController:(NSInteger)tag
{

    HWLog(@"laniahao ");

}

#pragma mark /-----选择条目列表------/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateNormal = HWColor(102, 102, 102);
    self.segment.titleColorStateSelected = HWColor(51, 51, 51);
    self.segment.indicatorColor = HWColor(51, 51, 51);
    [self.selectButtonView addSubview:self.segment];
}

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"有才有貌";
        [self.view addSubview:self.ycymCollect];
        [self.gxzwCollect removeFromSuperview];
        [self.ycymCollect reloadData];

    }

    else {
        HWLog(@"1");
        self.segStr = @"高薪职位";
        [self.ycymCollect removeFromSuperview];
        [self.view addSubview:self.gxzwCollect];
        [self.gxzwCollect reloadData];
    }
}

#pragma mark ------创建ycymCollect-------
-(UICollectionView *)ycymCollect{
    if (!_ycymCollect) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];    
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, self.headerView.height);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6);
        
        //2.初始化collectionView
        _ycymCollect = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _ycymCollect.backgroundColor = [UIColor whiteColor];
        _ycymCollect.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_ycymCollect registerClass:[YCYMCollectionViewCell class] forCellWithReuseIdentifier:@"YCYMCollectionViewCell"];
        
        [_ycymCollect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        
        //4.设置代理
        _ycymCollect.delegate = self;
        _ycymCollect.dataSource = self;
    }
    return _ycymCollect;
}

#pragma mark ------创建gxzwCollect-------
-(UICollectionView *)gxzwCollect{
    if (!_gxzwCollect) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH,self.headerView.height);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.32);
        
        //2.初始化collectionView
        _gxzwCollect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:layout];
        _gxzwCollect.backgroundColor = [UIColor whiteColor];
        _gxzwCollect.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_gxzwCollect registerClass:[GXZWCollectionViewCell class] forCellWithReuseIdentifier:@"GXZWCollectionViewCell"];
        
        [_gxzwCollect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView"];
        
        //4.设置代理
        _gxzwCollect.delegate = self;
        _gxzwCollect.dataSource = self;
    }
    return _gxzwCollect;
}

#pragma mark /------collectionView代理方法-------/

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.segStr isEqualToString:@"有才有貌"]) {
        if ([collectionView isEqual:self.ycymCollect]) {
            
            static NSString *identifier = @"YCYMCollectionViewCell";
            YCYMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
            ycymCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
            cell.titleLabel.text = @"胡歌";
            cell.vIcon.image = [UIImage imageNamed:@"vip"];
            cell.jobLabel.text = @"资深设计师";
            cell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.addressLabel.text = @"西安";
            cell.ageIcon.image = [UIImage imageNamed:@"time_image"];
            cell.ageLabel.text = @"3年";
            cell.educaLabel.text = @"本科";
            cell.educaIcon.image = [UIImage imageNamed:@"education"];
            cell.salaryLabel.text = @"7K";
            cell.numberLabel.text = @"3224";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeImage"];
        }
    }
    
    if ([self.segStr isEqualToString:@"高薪职位"]) {
        if ([collectionView isEqual:self.gxzwCollect]) {
            
            static NSString *identifier = @"GXZWCollectionViewCell";
            GXZWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
            ycymCell = cell;
            cell.hMainImage.image = [UIImage imageNamed:@"qptHeader"];
            cell.zwKindText.text = @"中级UI设计师";
            cell.salaryText.text = @"5-8k";
            cell.companyText.text = @"西部家联教育有限公司";
            cell.vipImage.image = [UIImage imageNamed:@"vip"];
            cell.academicImage.image = [UIImage imageNamed:@"acaImgae"];
            cell.hyText.text = @"IT软件";
            cell.bigCompanyText.text =@"已上市";
            cell.academicText.text = @"本科";
            cell.timeImageView.image = [UIImage imageNamed:@"time_image"];
            cell.timeText.text = @"3-5年";
            cell.mapImageView.image = [UIImage imageNamed:@"qpt_map_image"];
            cell.earaText.text = @"西安高新产业园逸翠园i都会";
            cell.eyeImage.image = [UIImage imageNamed:@"eyeImage"];
            cell.numText.text = @"3288";
            
        }
    }
    
    return ycymCell;
}

//通过设置SupplementaryViewOfKind 来设置头部或者底部的view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.ycymCollect]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        headView.backgroundColor = HWColor(241, 241, 241);
        [headView addSubview:self.headerView];
        
        return headView;

    }
    
    else{
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView" forIndexPath:indexPath];
        headerView.backgroundColor = HWColor(241, 241, 241);
        [headerView addSubview:self.headerView];
                
        return headerView;
    }

}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([collectionView isEqual:self.ycymCollect]) {
        return UIEdgeInsetsMake(15, 10, 10, 10);

    }
    
    else{
        return UIEdgeInsetsMake(0, 0, 0, 0);

    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HWLog(@"xxff");
    
    if ([collectionView isEqual:self.ycymCollect]) {
        YCPersonDeViewController *vc = [YCPersonDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        YCJobDeViewController *vc = [YCJobDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
