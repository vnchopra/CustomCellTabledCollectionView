//
//  ViewController.h
//  CustomCellTabledCollectionView
//
//  Created by Varun Chopra on 10/5/15.
//  Copyright © 2015 Varun Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableview;


@end

