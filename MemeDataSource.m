//
//  Model.m
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MemeDataSource.h"
#import "Meme.h"

@interface MemeDataSource ()

@property MemeCategory currentCategory;
@property (strong, nonatomic) NSArray *memeNames;
@property (strong, nonatomic) NSMutableArray<Meme *> *allMemes;
@property (strong, nonatomic) NSMutableArray<NSMutableArray *> *currentModel;
//@property (strong, nonatomic) NSMutableArray *currentModelsSections;

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

}
@end
