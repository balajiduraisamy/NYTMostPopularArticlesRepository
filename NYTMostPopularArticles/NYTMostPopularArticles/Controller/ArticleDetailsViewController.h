//
//  ArticleDetailsViewController.h
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
NS_ASSUME_NONNULL_BEGIN

@interface ArticleDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView_Article;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_abstract;
@property (weak, nonatomic) IBOutlet UILabel *lbl_byline;
@property (weak, nonatomic) IBOutlet UILabel *lbl_publishedDate;
@property (weak, nonatomic) IBOutlet UILabel *lbl_LinkURL;
@property (weak, nonatomic) IBOutlet UITextView *txtView_linkURL;

@property (strong, nonatomic) Article *article;
@end

NS_ASSUME_NONNULL_END
