//
//  InvestorThirdTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/16.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestorThirdTableViewCell : UITableViewCell

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/***/
@property (strong,nonatomic) UILabel *fieldLabel;
@property (strong,nonatomic) UILabel *fiDetialLabel;

/***/
@property (strong,nonatomic) UILabel *stageLabel;
@property (strong,nonatomic) UILabel *stDetailLabel;

/***/
@property (strong,nonatomic) UILabel *amountLabel;
@property (strong,nonatomic) UILabel *amDetailLabel;

/***/
@property (strong,nonatomic) UILabel *addressLabel;
@property (strong,nonatomic) UILabel *addDetailLabel;



@end
