//
//  MainFirstTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonalLayout,MainFirstTableViewCell;

@protocol ChectNumberDelegate <NSObject>

- (void)onChectOutInCell:(MainFirstTableViewCell *)cell;

@end

@interface MainFirstTableViewCell : UITableViewCell

/**职称*/
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *subLabel;

/**按钮*/
@property (strong,nonatomic) UIButton *phoneBtn;

/**地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/**年限*/
@property (strong,nonatomic) UIImageView *ageIcon;
@property (strong,nonatomic) UILabel *ageLabel;

/**学历*/
@property (strong,nonatomic) UIImageView *eduIcon;
@property (strong,nonatomic) UILabel *eduLabel;

@property (strong,nonatomic) UILabel *detailLabel;
@property (strong,nonatomic) UILabel *statusLabel;


@property(nonatomic,strong)PersonalLayout *perDescLayout;
@property(nonatomic,assign)id<ChectNumberDelegate> delegate;
@end
