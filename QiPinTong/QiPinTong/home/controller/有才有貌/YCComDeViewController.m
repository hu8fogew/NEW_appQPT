//
//  YCJobDeViewController.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCComDeViewController.h"

@interface YCComDeViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,CommentEnjoyDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBarView;
@property (nonatomic,strong) NSArray *seleBarArr;
@property (nonatomic,strong) SGSegmentedControl *segment;
@property (nonatomic,strong) NSString *segStr;

/*公司简介视图*/
@property(nonatomic,strong) DescCompanyView *descCompanyView;

//加关注、好友等
@property (strong,nonatomic) UIView *bottomView;
@end

@implementation YCComDeViewController
id cell = nil;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.headView addSubview:self.seleBarView];
    [self.view addSubview:self.bottomView];
    self.seleBarArr = @[@"主页",@"职位",@"动态",@"相册"];
    [self.headView addSubview:self.descCompanyView];
    [self createSeleBarView];
}

#pragma mark ------懒加载------
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        _headView.backgroundColor = HWColor(241, 241, 241);
        YCYMDeHeadView *vi = [[YCYMDeHeadView alloc]initWithFrame:_headView.bounds];
        vi.backImageView.image = [UIImage imageNamed:@"backImage.jpg"];
        vi.imgView.image = [UIImage imageNamed:@"icon"];
        vi.nameLabel.text = @"康威通信国际";
        vi.attentionLabel.text = @"关注 45";
        vi.fansLabel.text = @"粉丝 88";
        vi.infoLabel.text = @"企业信息 : 互联网电子商务";
        vi.statusLabel.text = @"已上市";
        vi.addressLabel.text = @"1000人以上";
        [vi.loveIcon addTarget:self action:@selector(clickLoveIcon) forControlEvents:UIControlEventTouchUpInside];
        [vi.sendIcon addTarget:self action:@selector(clickSendIcon) forControlEvents:UIControlEventTouchUpInside];
        
        [_headView addSubview:vi];
    }
    return _headView;
}

/*收藏*/
-(void)clickLoveIcon{
    HWLog(@"love");
}

/*转发*/
-(void)clickSendIcon{
    HWLog(@"send");
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
        
        [self.headView addSubview:self.descCompanyView];
        self.tableView.tableHeaderView.height = self.descCompanyView.botoom;
        
        
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"职位";
        
        [self.descCompanyView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBarView.botoom;
        [self.tableView reloadData];
    }
    else if (index == 2){
        self.segStr = @"动态";
        [self.descCompanyView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBarView.botoom;
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"相册";
        [self.descCompanyView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBarView.botoom;
        [self.tableView reloadData];
        
    }
    
}

-(DescCompanyView *)descCompanyView
{
    if (!_descCompanyView) {
        CompanyLayout *lay = [[CompanyLayout alloc]initDescCompanyView];
        _descCompanyView = [[DescCompanyView alloc]initWithFrame:CGRectMake(0, self.seleBarView.botoom, SCREEN_WIDTH, lay.descCompanyHeight)];
        
    }
    return _descCompanyView;
}


-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_HEIGHT, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *icon = @[@"关注",@"好友",@"咨询"];
        NSArray *title = @[@"加关注",@"加好友",@"投递简历"];
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

#pragma mark ------tableview及方法---------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.height = self.descCompanyView.botoom;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]){
        CompanyLayout *lay = [[CompanyLayout alloc]initCommentCell];
        return lay.comentCellHeight;
    }
    else if ([self.segStr isEqualToString:@"职位"]){
        return SCREEN_WIDTH*0.2;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"indentifier";
    
    
    YCJobTableViewCell *jobCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ([self.segStr isEqualToString:@"主页"]) {
            YCJobHomeTableViewCell *Homecell = [[YCJobHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commentCell"];
        Homecell.delegate = self;
            cell = Homecell;
    }
    
    else if ([self.segStr isEqualToString:@"职位"]){
        jobCell = [[YCJobTableViewCell alloc]initWithFrame:jobCell.bounds];
        jobCell.backgroundColor = HWColor(241, 241, 241);
        cell = jobCell;
        jobCell.postLabel.text = @"中级UI设计师";
        jobCell.salaryLabel.text = @"5-8K";
        jobCell.eduIcon.image = [UIImage imageNamed:@"education"];
        jobCell.eduLabel.text = @"本科";
        jobCell.ageIcon.image = [UIImage imageNamed:@"time_image"];
        jobCell.ageLabel.text = @"3-5年";
        jobCell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        jobCell.addressLabel.text = @"西安";
        jobCell.numberLabel.text = @"3228";
        jobCell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
    }
    return cell;
}

#pragma mark -------主页

-(void)onEnjoyBtnInCell:(YCJobHomeTableViewCell *)cell
{
    HWLog(@"点赞喽====");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
