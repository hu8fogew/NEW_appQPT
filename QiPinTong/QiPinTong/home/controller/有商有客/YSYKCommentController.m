//
//  YSYKCommentController.m
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YSYKCommentController.h"

@interface YSYKCommentController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *commentTable;
@end

@implementation YSYKCommentController

-(UITableView *)commentTable
{
    if (!_commentTable) {
        _commentTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _commentTable.backgroundColor = [UIColor whiteColor];
        _commentTable.delegate = self;
        _commentTable.dataSource = self;
        _commentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _commentTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"全部评论";
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.commentTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSYKCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifer"];
    if (cell == nil) {
        cell = [[YSYKCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifer"];
        
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSYKLayout *layout = [[YSYKLayout alloc]initYSYKCommentCell];
    return layout.ysykCommentCellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
