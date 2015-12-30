//
//  SubjectCell.m
//  mydemo
//
//  Created by Yallen on 15/12/30.
//  Copyright © 2015年 Yallen. All rights reserved.
//

#import "SubjectCell.h"
#import "Masonry/Masonry.h"
@implementation SubjectCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        UIView *superView = self.contentView;
        
        
        
        
        UIImageView *leftview = [[UIImageView alloc]init];
        leftview.backgroundColor = [UIColor orangeColor];
        [leftview setImage:[UIImage imageNamed:@"q.png"]];
        [self.contentView addSubview:leftview];
        
        [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView.mas_left).offset(15);
            make.top.equalTo(superView.mas_top).offset(10);
            make.bottom.equalTo(superView.mas_bottom).offset(-10);
            make.width.equalTo(self.mas_height);
        }];
        
        
        UILabel *label1 = [[UILabel alloc]init];
        label1.text = @"【生活】 食用级不锈钢勺";
        label1.textAlignment = NSTextAlignmentLeft;
        label1.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label1];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView.mas_top).offset(10);
            make.left.equalTo(leftview.mas_right).offset(10);
        }];
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.text = @"5支装";
        label2.textAlignment = NSTextAlignmentLeft;
        label2.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label2];
        
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.mas_bottom).offset(3);
            make.left.equalTo(leftview.mas_right).offset(20);
        }];
        
        UILabel *label3 = [[UILabel alloc]init];
        label3.text = @"双12特价";
        label3.textColor = [UIColor grayColor];
        label3.textAlignment = NSTextAlignmentLeft;
        label3.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label3];
        
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.mas_bottom).offset(5);
            make.left.equalTo(leftview.mas_right).offset(15);
        }];
        
        
        UILabel *label4 = [[UILabel alloc]init];
        label4.text = @"$88";
        label4.textColor = [UIColor redColor];
        label4.textAlignment = NSTextAlignmentLeft;
        label4.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:label4];
        
        [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(superView.mas_bottom).offset(-5);
            make.left.equalTo(leftview.mas_right).offset(15);
        }];
        
        
        UILabel *label5 = [[UILabel alloc]init];
        label5.text = @"XX";
        label5.textColor = [UIColor grayColor];
        label5.textAlignment = NSTextAlignmentLeft;
        label5.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label5];
        
        [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView.mas_right).offset(-20);
            make.bottom.equalTo(superView.mas_bottom).offset(-5);
        }];
    
        
        
    }
    
    return self;

    
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
