//
//  ViewController.m
//  CustomCellTabledCollectionView
//
//  Created by Varun Chopra on 10/5/15.
//  Copyright © 2015 Varun Chopra. All rights reserved.
//
//  This application is inspired by Ash Furrow's "Putting a UICollectionView in a UITableViewCell"
//  and shows how to have uicollection view cells and tableview rows with different dimensions.
//
//  Reference: https://ashfurrow.com/blog/putting-a-uicollectionview-in-a-uitableviewcell/
//  Reference Github: https://github.com/AshFurrow/AFTabledCollectionView

#import "ViewController.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) NSArray *reversedColorArray;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation ViewController

//Number of Table view rows
const NSInteger numberOfTableViewRows = 10;

//Number of Collection view cells inside a table view row
const NSInteger numberOfCollectionViewCells = 15;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create a random color Array.
    NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:numberOfCollectionViewCells];
    
    for (NSInteger collectionViewItem = 0; collectionViewItem < numberOfCollectionViewCells; collectionViewItem++)
    {
        
        CGFloat red = arc4random() % 255;
        CGFloat green = arc4random() % 255;
        CGFloat blue = arc4random() % 255;
        UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
        
        [colorArray addObject:color];
    }
    
    _colorArray = [NSArray arrayWithArray:colorArray];
    
    //Take random color array and reverse it before placing into the _reversedColorArray
    _reversedColorArray = [[_colorArray reverseObjectEnumerator] allObjects];
    
    _contentOffsetDictionary = [NSMutableDictionary dictionary];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numberOfTableViewRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //By having two different cell identifiers, two different cell types can be created
    //without interfering with the way reusing of cells occur
    static NSString *cellidentifier = @"cellidentifier";
    static NSString *secondcellidentifier = @"secondcellidentifier";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    TableViewCell *cell2 = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:secondcellidentifier];
    
    if (indexPath.row == 0)
    {
        if (!cell)
        {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        }
        
        //No data in tableview except for the collectionview cells
        
        return cell;
    }
    else if (indexPath.row == 6)
    {
        if (!cell)
        {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        }
        
        //No data in tableview except for the collectionview cells
        
        return cell;
    }
    else
    {
        if (!cell2)
        {
            cell2 = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:secondcellidentifier];
        }
        
        //No data in tableview except for the collectionview cells
        
        return cell2;
    }
    
}

//Cell Type determines the difference between horizontal and portrait cells
- (void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Index 0 and 6 cater to the portrait collection view cell type
    if(indexPath.row == 0)
    {
        [self insertDatasourceAndDelegateForCell:cell forRowAtIndexPath:indexPath andCellType:NO];
    }
    else if(indexPath.row == 6)
    {
        [self insertDatasourceAndDelegateForCell:cell forRowAtIndexPath:indexPath andCellType:NO];
    }
    else
    {
        [self insertDatasourceAndDelegateForCell:cell forRowAtIndexPath:indexPath andCellType:YES];
    }
    
}

//Utility Method: cellType - NO means horizontal, YES means portrait
- (void) insertDatasourceAndDelegateForCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath andCellType:(BOOL)cellType
{
    [cell setCollectionViewDataSourceDelegate:self index:indexPath.row andCellType:cellType];
    NSInteger index = cell.collectionViewHorizontal.tag;
    
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionViewHorizontal setContentOffset:CGPointMake(horizontalOffset, 0)];
}

#pragma mark - UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Index 0 and 6 cater to the portrait collection view cell type
    if (indexPath.row == 0)
    {
        return 270;
    }
    else if (indexPath.row == 6)
    {
        return 270;
    }
    else
    {
        return 190;
    }
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //Index 0 and 6 cater to the portrait collection view cell type
    if (collectionView.tag == 0)
    {
        return numberOfCollectionViewCells;
    }
    else if (collectionView.tag == 6)
    {
        return numberOfCollectionViewCells;
    }
    else
    {
        return numberOfCollectionViewCells;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    
    //Index 0 and 6 cater to the portrait collection view cell type
    if (collectionView.tag == 0)
    {
        //insert color
        cell.backgroundColor = _reversedColorArray[indexPath.row];
    }
    else if (collectionView.tag == 6)
    {
        //insert color
        cell.backgroundColor = _reversedColorArray[indexPath.row];
    }
    else
    {
        //insert color
        cell.backgroundColor = _colorArray[indexPath.row];
    }
    
    return cell;
    
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    NSInteger index = collectionView.tag;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}



@end
