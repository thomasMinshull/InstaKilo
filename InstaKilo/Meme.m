//
//  Meme.m
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "Meme.h"

@implementation Meme

- (instancetype)initWithName:(NSString *)string {
    self = [super init];
    if (self) {
        _memeName = string;
        _image = [UIImage imageNamed:string];
    }
    return self;
}



@end
