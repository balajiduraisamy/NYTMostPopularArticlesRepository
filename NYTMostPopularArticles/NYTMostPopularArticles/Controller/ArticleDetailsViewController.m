//
//  ArticleDetailsViewController.m
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import "ArticleDetailsViewController.h"

@interface ArticleDetailsViewController ()

@end

@implementation ArticleDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _article.section;
    _lbl_title.text = _article.title;
    _lbl_byline.text = _article.byline;
    _lbl_abstract.text = _article.abstract;
    _lbl_publishedDate.text = _article.datePublished;
    _txtView_linkURL.text = _article.linkURL;
    _txtView_linkURL.editable = NO;
    _txtView_linkURL.dataDetectorTypes = UIDataDetectorTypeAll;
    
    
    NSURL *url = [NSURL URLWithString:_article.imageURLBanner];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _imgView_Article.image = [UIImage imageWithData:data];
    
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
