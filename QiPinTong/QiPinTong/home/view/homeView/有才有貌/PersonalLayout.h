//
//  PersonalLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface PersonalLayout : LWLayout<NSCopying>
//个人经历cell的高度
@property(nonatomic,assign) CGFloat descCellHeight;

//个人类型介绍高度
@property(nonatomic,assign) CGFloat descViewHeight;
//按钮高度
@property(nonatomic,assign) CGRect chectButton;

//个人求职类型视图的介绍
-(id)initPersonalOfWorkKind;

//个人介绍的cell（标题、介绍两个内容）
-(id)initDescPersonCell;
@end
