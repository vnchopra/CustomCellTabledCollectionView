//
//  TableViewCell.h
//  CustomCellTabledCollectionView
//
//  Created by Varun Chopra on 10/5/15.
//  Copyright © 2015 Varun Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *CollectionViewCellIdentifier = @"CollectionViewCellIdentifier";

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UICollectionView *collectionViewHorizontal;
@property (assign) BOOL cellType;

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index andCellType: (BOOL) typeCell;

@end
