//
//  TableViewCell.m
//  CustomCellTabledCollectionView
//
//  Created by Varun Chopra on 10/5/15.
//  Copyright © 2015 Varun Chopra. All rights reserved.
//

#import "TableViewCell.h"
#import "CollectionViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    
    [self setFlowLayouts];
}

//Happens after setCollectionViewDataSourceDelegate
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.cellType)
    {
        _layout.itemSize = CGSizeMake(300, 169); //horizontal
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    else
    {
        
        _layout.itemSize = CGSizeMake(170, 249); //portrait
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }

    self.collectionViewHorizontal.frame = self.contentView.bounds;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
}

#pragma mark - Private Methods
-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index andCellType: (BOOL) typeCell
{
    self.collectionViewHorizontal.dataSource = dataSourceDelegate;
    self.collectionViewHorizontal.delegate = dataSourceDelegate;
    self.collectionViewHorizontal.tag = index;
    
    self.cellType = typeCell;
    
    [self.collectionViewHorizontal reloadData];
}

- (void) setFlowLayouts
{
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _layout.itemSize = CGSizeMake(200, 270);
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionViewHorizontal = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    [self.collectionViewHorizontal registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    self.collectionViewHorizontal.backgroundColor = [UIColor clearColor];
    self.collectionViewHorizontal.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionViewHorizontal];
}

@end
