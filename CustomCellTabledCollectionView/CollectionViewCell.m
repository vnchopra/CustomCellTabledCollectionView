//
//  CollectionViewCell.m
//  CustomCellTabledCollectionView
//
//  Created by Varun Chopra on 10/5/15.
//  Copyright © 2015 Varun Chopra. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
  
//Here can you add custom stuff to your cell if you like
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCustomStuff];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setNeedsDisplay]; // force drawRect:
}

#pragma mark - Create Subviews

- (void)setupCustomStuff
{
    //Add custom stuff here
}

@end
