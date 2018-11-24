//
//  ArticlesCellTableViewCell.h
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticlesCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView_Article;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_byLine;
@property (weak, nonatomic) IBOutlet UILabel *lbl_datePublished;

@end

NS_ASSUME_NONNULL_END
