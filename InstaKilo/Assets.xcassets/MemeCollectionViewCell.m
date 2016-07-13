//
//  MemeCollectionViewCell.m
//  InstaKilo
//
//  Created by thomas minshull on 2016-07-13.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "MemeCollectionViewCell.h"
#import "Meme.h"

@interface MemeCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation MemeCollectionViewCell

- (void)setUpWithMeme:(Meme *)meme {
    [self.locationLabel setText:meme.location];
    [self.subjectLabel setText:meme.subject];
    [self.imageView setImage:meme.image];
}
@end
