//
//  rootCollectionViewController.m
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "rootCollectionViewController.h"
#import "MemeDataSource.h"

@interface rootCollectionViewController ()

@property (strong, nonatomic) MemeDataSource *dataSource;

@end

@implementation rootCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // outsourcing the dataSource
    self.dataSource = [[MemeDataSource alloc] init];
    
    self.collectionView.dataSource = self.dataSource;
    
    // add Segmented controller 

}

#pragma mark -Actions

- (IBAction)segmentedControllerTapped:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.dataSource changeModelCategory:MemeCategoryLocation];
    } else {
        [self.dataSource changeModelCategory:MemeCategorySubject];
    }
    [self.collectionView reloadData];
}




#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
