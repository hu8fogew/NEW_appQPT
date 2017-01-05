//
//  CompanyOnlineViewController.m
//  家长界
//
//  Created by taylor on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ComOnlineViewController.h"

@interface ComOnlineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,WYAutoCaruselDelegate>

@property (strong,nonatomic) UICollectionView *collectionView;

/*轮播数组*/
@property(nonatomic,strong) NSMutableArray *arrLunBo;

/*头视图*/
@property (nonatomic,strong) UIView *headerView;

/*下拉列表视图*/
@property (nonatomic,strong) UIView *siftView;
@property (nonatomic,strong) SiftView *si;

/*下拉按钮数组*/
@property (nonatomic,strong) NSMutableArray *buttonArray;


@property (nonatomic,strong) UIView *backgroundSiftView;

@end

@implementation ComOnlineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"名企在线";
    
    [self.view addSubview:self.collectionView];
    [self createAdsPageWithArr:self.arrLunBo];
    
}
#pragma mark -----懒加载------

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
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
    }
    return _headerView;
}

-(UIView *)backgroundSiftView
{
    if (!_backgroundSiftView) {
        _backgroundSiftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
        _backgroundSiftView.backgroundColor = [UIColor whiteColor];
        [_backgroundSiftView addSubview:self.siftView];
    }
    return _backgroundSiftView;
}


-(UIView *)siftView{
    if (!_siftView) {
        _siftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight)];
        _siftView.backgroundColor = [UIColor whiteColor];
        NSArray *arr = @[@"区域",@"行业领域",@"发展阶段"];
        self.si = [[SiftView alloc]initWithFrame:_siftView.bounds andArr:arr andAction:@selector(siftBtnClick:) andTaget:self];
        
        [_siftView addSubview:self.si];
        
    }
    return _siftView;
}

#pragma mark  /***********筛选栏*************/

-(void)siftBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.tag == 0) {
        
        self.si.btnS.selected = NO;
        self.si.btnT.selected = NO;
    }
    
   else if (sender.tag == 1) {
        
        self.si.btnF.selected = NO;
        self.si.btnT.selected = NO;
    }
    
    else {
        
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
    [aut createCaruselWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) WithSuperView:self.headerView WithImageUrlArr:arr WithPlaceholderImageName:@"1" WithInterval:2];
    
    [aut createPageControlWithFrame:CGRectMake(SCREEN_WIDTH-60, lunBoheight-30, 30, 20) WithSuperView:self.headerView WithPageNum:arr.count WithCurrentColor:HWColor(153, 153, 153) WithTintColor:[UIColor whiteColor]];
    
    aut.delegate = self;
}

-(void)pushViewController:(NSInteger)tag{
    HWLog(@"mmmmmm");
}

#pragma mark ------创建collectionview-------
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, lunBoheight);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 5;
        
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_collectionView registerClass:[ComOnlineCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        
        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

#pragma mark ------滚动显示筛选条------
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.collectionView.contentOffset.y;
    HWLog(@"===%f",offset);
    if (offset>lunBoheight-64) {
        
        [UIView animateWithDuration:0.1 animations:^{
            [self.view addSubview:self.backgroundSiftView];
            
        }];
    }
    if (0<=offset && offset<lunBoheight-64){
        [UIView animateWithDuration:0.1 animations:^{
            [self.backgroundSiftView removeFromSuperview];
            
        }];
    }
    
}

-(void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    HWLog(@"低级喃喃道");
}

#pragma mark collectionView代理方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ComOnlineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
    cell.titleLabel.text = @"琅琊榜胡歌";
    cell.NoLabel.text = @"3228";
    cell.proLabel.text = @"IT软件";
    cell.typeLabel.text = @"已上市";
    cell.addressLabel.text = @"西安";
    cell.infoLabel.text = @"热招：";
    cell.contentLabel.text = @"ios程序猿";
    cell.contsLabel.text = @"等18个职位";
    
    return cell;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 10, 10);
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    headerView.backgroundColor = HWColor(241, 241, 241);
    [headerView addSubview:self.headerView];
    return headerView;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    HWLog(@"jdfldklskj");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
