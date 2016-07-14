//
//  Model.m
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MemeDataSource.h"
#import "Meme.h"
#import "MemeCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface MemeDataSource ()

@property MemeCategory currentCategory;
@property (strong, nonatomic) NSArray *memeNames;
@property (strong, nonatomic) NSMutableArray<Meme *> *allMemes;
@property (strong, nonatomic) NSMutableArray<NSMutableArray *> *currentModel;

@end

@implementation MemeDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _memeNames = @[@"Image-1", @"Image-2", @"Image-3", @"Image-4", @"Image-5", @"Image-6", @"Image-7", @"Image-8", @"Image-9", @"Image-10"];
        
        self.allMemes = [@[] mutableCopy];
        
        for (NSString *name in self.memeNames) {
            Meme *meme = [[Meme alloc] initWithName:name];
            
            int rand = arc4random();
            if (rand%3 == 0 ) {
                meme.location = @"Vancouver";
            } else if (rand%2 ==0) {
                meme.location = @"Boston";
            } else {
                meme.location = @"Seattle";
            }
            
            int rand2 = arc4random();
            if (rand2%3 == 0 ) {
                meme.subject = @"Funny";
            } else if (rand2%2 ==0) {
                meme.subject = @"Mean";
            } else {
                meme.subject = @"Borring";
            }
            
            
            [self.allMemes addObject:meme];
        }
        
        [self changeModelCategory:MemeCategoryLocation];
    }
    return self;
}

- (void)changeModelCategory:(MemeCategory)category;{
    self.currentModel = [@[] mutableCopy];

    if (category == MemeCategoryLocation) {
        
        //Sort Array
        NSSortDescriptor *locationDescriptor = [[NSSortDescriptor alloc] initWithKey:@"location" ascending:YES];
        [self.allMemes sortUsingDescriptors:@[locationDescriptor]];
        
        //create current model 2x2 array sections and elements
        for (int i = 0, currentSection = -1; i < [self.allMemes count]; i++) {
            if (i == 0 || ![self.allMemes[i].location isEqualToString:self.allMemes[i-1].location]) {
                currentSection++;
                //create new sub array and add this as first item
                NSMutableArray *thisSection = [@[self.allMemes[i]] mutableCopy];
                [self.currentModel addObject:thisSection];
                
            } else {
                NSMutableArray *thisSection = self.currentModel[currentSection];
                [thisSection addObject:self.allMemes[i]];
            }
        }
        self.currentCategory = category;
    } else {
        
        //Sort Array
        NSSortDescriptor *subjectDescriptor = [[NSSortDescriptor alloc] initWithKey:@"subject" ascending:YES];
        [self.allMemes sortUsingDescriptors:@[subjectDescriptor]];
        
        //create current model 2x2 array sections and elements
        for (int i = 0, currentSection = -1; i < [self.allMemes count]; i++) {
            if (i == 0 || ![self.allMemes[i].subject isEqualToString:self.allMemes[i-1].subject]) {
                currentSection++;
                //create new sub array and add this as first item
                NSMutableArray *thisSection = [@[self.allMemes[i]] mutableCopy];
                [self.currentModel addObject:thisSection];
                
            } else {
                NSMutableArray *thisSection = self.currentModel[currentSection];
                [thisSection addObject:self.allMemes[i]];
            }
        }

    }
    self.currentCategory = category;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.currentModel count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.currentModel[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = @"cell";
    
    MemeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    [cell setUpWithMeme:self.currentModel[indexPath.section][indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                  withReuseIdentifier:@"header"
                                                                                         forIndexPath:indexPath];
        if (self.currentCategory == MemeCategoryLocation) {
            [header.headerLabel setText:[(Meme *)self.currentModel[indexPath.section][indexPath.row] location]];
        } else {
            [header.headerLabel setText:[(Meme *)self.currentModel[indexPath.section][indexPath.row] subject]];
        }
        
        
        return header;
    } else {
        return nil;
    }
}

@end
