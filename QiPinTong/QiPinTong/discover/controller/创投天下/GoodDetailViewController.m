//
//  GoodDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDetailViewController.h"

@interface GoodDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *bottomView;

@end


@implementation GoodDetailViewController

id goodCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

#pragma mark -----懒加载------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.56)];
        GoodDetialHeadView *vi = [GoodDetialHeadView new];
        vi.backImageView.image = [UIImage imageNamed:@"backImage.jpg"];
        vi.imgView.image = [UIImage imageNamed:@"icon"];
        vi.nameLabel.text = @"童曼秀";
        vi.titleLabel.text = @"儿童动漫电影平台";
        vi.typeLabel.text = @"已运营";
        vi.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        vi.addressLabel.text = @"西安";
        vi.financingLabel.text = @"融资轮次 : 天使轮";
        vi.financeNoLabel.text = @"融资金额 : 150W";
        
        
        [_headerView addSubview:vi];
    }
    return _headerView;
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
        
    }
    else if (sender.tag == 1){
       
    }
    else{
      
    }
}

#pragma mark ------tableview及方法------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return SCREEN_WIDTH*0.52;

    }
    else if (indexPath.row == 1){
        
        return SCREEN_WIDTH*0.18;

    }
    else{
        return SCREEN_WIDTH*0.18;

    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if (indexPath.row == 0) {
        GoodDeFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[GoodDeFirstTableViewCell alloc]initWithFrame:cell.bounds];
            goodCell = cell;
            cell.titleLabel.text = @"项目详情";
            cell.detailLabel.text = @"先到吉他谱网站里面找自己喜欢的歌曲，没有简单和复杂之分，爱哪首选择哪一首，为了交流方便（主要是我太懒，呵呵），这里选择了《兰花草》，实际上也可以在街上买吉他弹唱的书，里面的东西都一样，只要曲谱中有和弦标记就可以了（也dd就是下面图中的Am、Em等类似标记的）点击录制，当木鱼节奏敲四下后（也就是一小节的准备时间），开始按照曲谱中的和弦进行录制，本例中是第一小节点Am，第二小节先点Em再点Am，第三小节点Am，第四、第五小节因为还是Am可以不点，第六小姐诶点Em，以此类推，直至最后一个小节，点击位置见图例。如果错了可以从第一步点击“退回按钮”重新来过。记住：不要怕偶然的失败，熟能生巧哦";
        }
        return cell;
        
    }
    else if (indexPath.row == 1){
            GoodDeSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GoodDeSecondTableViewCell alloc]initWithFrame:cell.bounds];
        goodCell = cell;
        cell.titleLabel.text = @"融资历史";
        cell.dateLabel.text = @"2015年11月";
        cell.investLabel.text = @"种子轮";
        cell.amountLabel.text = @"200万人民币";
        cell.fundLabel.text = @"银江资本";
    }
    return cell;
        
    }
    else{

    GoodDeThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GoodDeThirdTableViewCell alloc]initWithFrame:cell.bounds];
        goodCell = cell;
        cell.titleLabel.text = @"融资历史";
        
    }
    return cell;
        
    }

    return goodCell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
