//
//  XYWelfareCell.m
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYWelfareCell.h"

@interface XYWelfareCell ()<UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *introduceLB;
@property (weak, nonatomic) IBOutlet UIView *changeHeightHolderView;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (assign, nonatomic) id<XYWelfareCellDelegate>delegate;
@property (strong, nonatomic) UITextView *dataTextView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) XYClickCellModel *clickCellModel;

@end

@implementation XYWelfareCell

static NSString *const cellID = @"XYWelfareCell";
static NSString *const itemId = @"XYWelfareCollectionViewCell";


+ (NSString *)getCellIdentifier{
    
    return @"XYWelfareCell";
}

+(XYWelfareCell *)cellWithTableView:(UITableView *)tableView
                       ForIndexPath:(NSIndexPath *)indexpath
                           delegate:(id<XYWelfareCellDelegate>)delegate
{
//    [tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
//    XYWelfareCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexpath];
    
    
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"XYWelfareCell" owner:self options:nil];
    
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        return nil;
    }
    
    XYWelfareCell *cell = [topLevelObjects objectAtIndex:0];

    //workaround for IOS 7 auto layout bug
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)
    {
        cell.contentView.bounds = CGRectMake(0, 0, 99999, 99999);
    }

    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexpath;
    cell.delegate = delegate;
    
    //
    if (indexpath.row == 6){
        
        [cell.changeHeightHolderView addSubview:cell.collectionView];
        
        
    }else{
    
        [cell.changeHeightHolderView addSubview:cell.dataTextView];

    }
    return cell;
}



- (void)updateCellWith:(XYClickCellModel *)clickCellModel{
    _clickCellModel = clickCellModel;
    _introduceLB.text = clickCellModel.introduce;
    //控制交互
    self.userInteractionEnabled = clickCellModel.userInteractionEnabled;
    //这里的index比较特殊，只处理选择和输入的，那些点击的不在这里处理，所以，index其实是不全的
    if (_indexPath.row != 6){
        
        _dataTextView.text = clickCellModel.detailRequire;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _dataTextView.frame = CGRectMake(0, 0, _changeHeightHolderView.frame.size.width, _changeHeightHolderView.frame.size.height);
}

#pragma mark --------------------textView------------------

- (UITextView *)dataTextView{
    
    if (!_dataTextView){
        
        _dataTextView = [[UITextView alloc] init];

        _dataTextView.delegate = self;
        _dataTextView.backgroundColor = [UIColor orangeColor];
        _dataTextView.returnKeyType = UIReturnKeyDone;
        
    }
    return _dataTextView;
}

#pragma mark ------------textViewDelegate----------

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    [textView resignFirstResponder];
    
    //更新cell的高度
    [self udateCellHeightWithNewHeight:textView.frame.size.height
                      newDetailRequire:textView.text];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    __weak typeof(self)weakSelf = self;
    
    if ([text isEqualToString:@"\n"]){
        //点回车取消键盘
        [textView resignFirstResponder];
    }
    
    CGRect frame = textView.frame;
    
    float height;
    if ([text isEqual:@""]) {
        
        if (![textView.text isEqualToString:@""]) {

            height = [ self heightForTextView:textView WithText:[textView.text substringToIndex:[textView.text length] - 1]];
            
        }else{
            
            height = [ self heightForTextView:textView WithText:textView.text];
        }
    }else{
        
        height = [self heightForTextView:textView WithText:[NSString stringWithFormat:@"%@%@",textView.text,text]];
    }
    
    frame.size.height = height;
    [UIView animateWithDuration:0.5 animations:^{
        
        textView.frame = frame;
        //更新cell的高度
//        [weakSelf udateCellHeightWithNewHeight:height];
        
    } completion:nil];
    
    return YES;
}

- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
    CGSize constraint = CGSizeMake(textView.contentSize.width , CGFLOAT_MAX);
    CGRect size = [strText boundingRectWithSize:constraint
                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}
                                        context:nil];
    float textHeight = size.size.height + 10.0;
    return textHeight;
}

//更新cell的高度&&更新数据源
- (void)udateCellHeightWithNewHeight:(CGFloat)height
                        newDetailRequire:(NSString *)newDetailRequire{
    
    CGFloat updateHeight = height > 44 ?height : 44;
    
    _clickCellModel.detailRequire = newDetailRequire;
    
    if ([_delegate respondsToSelector:@selector(updateCellHeightWith:indexpath:newCellModel:)]){
        
        [_delegate updateCellHeightWith:updateHeight
                              indexpath:_indexPath
                           newCellModel:_clickCellModel];
    }
}

#pragma mark ---------------------collectionView---------------
- (UICollectionView *)collectionView
{
    __weak typeof(self)weakSelf = self;
    

    if (!_collectionView) {
        // 布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
//        _layout = layout;
        layout.itemSize = CGSizeMake(_changeHeightHolderView.frame.size.width / 4, 12);
        
        // 创建collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, _changeHeightHolderView.frame.size.width, 44) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = weakSelf;
        _collectionView.dataSource = weakSelf;
        [_collectionView registerClass:[XYWelfareCollectionViewCell class] forCellWithReuseIdentifier:itemId];
        
    }
    return _collectionView;
}

#pragma mark collectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYWelfareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemId forIndexPath:indexPath];
    
    return cell;
}

#pragma mark collectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
