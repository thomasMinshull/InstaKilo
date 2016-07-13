//
//  Model.h
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // imports delegate :P Bit of overKill

typedef NS_ENUM(NSInteger, MemeCategory) {
    MemeCategoryLocation,
    MemeCategorySubject
};

@interface MemeDataSource : NSObject <UICollectionViewDataSource>

- (void)changeModelCategory:(MemeCategory)category;

@end
