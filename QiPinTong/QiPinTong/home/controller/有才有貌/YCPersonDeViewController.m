//
//  YCYMDetialViewController.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCPersonDeViewController.h"

@interface YCPersonDeViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,ChectNumberDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headView;

@property (strong,nonatomic) UIView *bottomView;

@property(strong,nonatomic) UIView *descPersonView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBarView;
@property (nonatomic,strong) NSArray *seleBarArr;
@property (nonatomic,strong) SGSegmentedControl *segment;
@property (nonatomic,strong) NSString *segStr;

@end

@implementation YCPersonDeViewController

id detailCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];

    [self.headView addSubview:self.seleBarView];
    
    self.seleBarArr = @[@"主页",@"动态",@"相册"];
    
    [self createSeleBarView];
    
}

#pragma mark ------懒加载------
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        YCYMDeHeadView *vi = [YCYMDeHeadView new];
        vi.backImageView.image = [UIImage imageNamed:@"backImage.jpg"];
        vi.imgView.image = [UIImage imageNamed:@"icon"];
        vi.nameLabel.text = @"韩雪冬";
        vi.attentionLabel.text = @"关注 45";
        vi.fansLabel.text = @"粉丝 88";
        vi.infoLabel.text = @"个人信息 : 183cm";
        vi.statusLabel.text = @"未婚";
        vi.addressLabel.text = @"陕西西安";
        
        [_headView addSubview:vi];
    }
    return _headView;
}

/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.headView.y+self.headView.height, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = HWColor(241, 241, 241);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
        view.backgroundColor = [UIColor whiteColor];
        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}


-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_HEIGHT, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *icon = @[@"关注",@"好友",@"咨询"];
        NSArray *title = @[@"加关注",@"加好友",@"立即咨询"];
        NSArray *color = @[@"blue",@"green",@"orange"];
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+i*(SCREEN_WIDTH-40)/3+i*10, 15, (SCREEN_WIDTH-40)/3, 30);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 3;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.imageView.size = CGSizeMake(16, 16);
            [btn setTitle:title[i] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
            [btn setImage:[UIImage imageNamed:icon[i]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:color[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [_bottomView addSubview:btn];
        }
        
    }
    return _bottomView;
}




-(void)clickBtn:(UIButton *)sender{
    if (sender.tag == 0) {
        HWLog(@"66666666");
    }
    else if (sender.tag == 1){
        
    }
    else{
        
    }
}



#pragma mark /*-----添加选项栏-----*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.titleColorStateSelected = HWColor(96, 136, 186);
    _segment.indicatorColor = HWColor(96, 136, 186);
    [self.seleBarView addSubview:_segment];
}


-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"主页";
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"动态";
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"相册";
        [self.tableView reloadData];

    }
    
}

#pragma mark ------tableview及方法---------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.height = self.headView.height+self.seleBarView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.segStr isEqualToString:@"相册"]) {
        return 1;
    }
    if ([self.segStr isEqualToString:@"主页"]) {
        return 7;
    }
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellheight = 0;
    if ([self.segStr isEqualToString:@"相册"]) {
        PhotoViewLayout *layout = [[PhotoViewLayout alloc]initPhotoCellLayout];
        cellheight = layout.photoCellHeight;
    }
    if ([self.segStr isEqualToString:@"主页"])
    {
        if(indexPath.row == 0){
            PersonalLayout *lay = [[PersonalLayout alloc]initPersonalOfWorkKind];
            cellheight = lay.descViewHeight;
        }else
        {
            PersonalLayout *lay = [[PersonalLayout alloc]initDescPersonCell];
            cellheight = lay.descCellHeight;
        }
        
    }
    if ([self.segStr isEqualToString:@"动态"])
    {
        PersonalLayout *lay = [[PersonalLayout alloc]initDescPersonCell];
        cellheight = lay.descCellHeight;
    }
    
    return cellheight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]) {
        if (indexPath.row == 0) {
            MainFirstTableViewCell *firstCell = [[MainFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"descView"];
            firstCell.delegate = self;
            detailCell = firstCell;
        }else{
            MainSecondTableViewCell *Tcell = [[MainSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DescView"];
            detailCell = Tcell;
            [self configerTableViewCell:Tcell];
        }
        
    }
    if ([self.segStr isEqualToString:@"动态"]){
        MainSecondTableViewCell *Tcell = [[MainSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DescMove"];
        detailCell = Tcell;
        [self configerTableViewCell:Tcell];
    }
    
    if ([self.segStr isEqualToString:@"相册"]){
        
        PhotoViewCell *cell = [[PhotoViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"photoCell"];
        
        [self callbackWithCell:cell];
        
        detailCell = cell;
    }
    
    
    return detailCell;
}
#pragma mark ---------主页"
-(void)configerTableViewCell:(MainSecondTableViewCell *)cell
{
    

    
}

#pragma mark------查看电话
-(void)onChectOutInCell:(MainFirstTableViewCell *)cell
{
    HWLog(@"查看电话----");
}


#pragma mark ---------相册
- (void)callbackWithCell:(PhotoViewCell *)cell {
    
    __weak typeof(self) weakSelf = self;
    cell.clickedImageCallback = ^(PhotoViewCell* cell,NSInteger imageIndex) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
    };
}
//点击查看大图
- (void)tableViewCell:(PhotoViewCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < cell.photoLayout.photoPosition.count; i ++) {
        LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                      initWithplaceholder:nil
                                      thumbnailURL:[NSURL URLWithString:[cell.photoLayout.imageArr objectAtIndex:i]]
                                      HDURL:[NSURL URLWithString:[cell.photoLayout.imageArr  objectAtIndex:i]]
                                      containerView:cell.contentView
                                      positionInContainer:CGRectFromString(cell.photoLayout.photoPosition[i])
                                      index:i];
        [tmps addObject:model];
    }
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                    currentIndex:imageIndex];
    [browser show];
}


-(void)clickPhoneBtn{
    HWLog(@"aaaaaa");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
