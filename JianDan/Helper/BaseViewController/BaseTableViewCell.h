//
//  BaseTableViewCell.h
//  JianDan
//
//  Created by 刘献亭 on 15/10/19.
//  Copyright © 2015年 刘献亭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

- (void)drawContentView:(CGRect)rect;

-(UIImageView *)bgView;

-(void)updateProgressView:(CGFloat)progress rect:(CGRect)rect;

@end