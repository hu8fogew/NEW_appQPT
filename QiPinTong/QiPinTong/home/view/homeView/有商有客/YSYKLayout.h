//
//  YSYKLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface YSYKLayout : LWLayout<NSCopying>


//商家详情列表高度
@property(nonatomic,assign) CGFloat listViewHeight;
-(id)initListViewDetialView;

//评论
@property(nonatomic,assign) CGFloat commentViewHeight;
-(id)initCommentView;

//评论cell
@property(nonatomic,assign) CGFloat ysykCommentCellHeight;
-(id)initYSYKCommentCell;
@end
