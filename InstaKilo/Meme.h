//
//  Meme.h
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Meme : NSObject

@property (strong, nonatomic) NSString *memeName;
@property (strong, nonatomic, readonly) UIImage *image;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *subject;

- (instancetype)initWithName:(NSString *)string;

@end
