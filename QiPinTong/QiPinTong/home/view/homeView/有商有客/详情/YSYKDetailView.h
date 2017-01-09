//
//  YSYKDetailView.h
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSYKLayout,YSYKDetailView;

@protocol YSYKDetialDelegate <NSObject>

-(void)moreCommentOfView;

@end



@interface YSYKDetailView : UIView

@property(nonatomic,strong)YSYKLayout *ysykLayout;

@property(nonatomic,assign)id <YSYKDetialDelegate> delegate;

@end
