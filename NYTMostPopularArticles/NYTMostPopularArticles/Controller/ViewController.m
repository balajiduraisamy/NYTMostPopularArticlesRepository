//
//  ViewController.m
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import "ViewController.h"
#import "NYTAPIManager.h"
#import "Article.h"
#import "ArticlesCellTableViewCell.h"
#import "NYTArticlesConstants.h"
#import "ArticleDetailsViewController.h"
#define kNavigationTitle @"Most Popular Articles"
#define kPushSegue @"pushSegue"

CGFloat cellHeightConstant = 146.0f;

@interface ViewController ()
{
    NSArray *nytArticlesArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = kNavigationTitle;
    [self getArticlesFromWebservice];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)getArticlesFromWebservice
{
    
        [[NYTAPIManager sharedManager] getMostPopularArticle:^(NSArray *articlesArray, NSError *error)
         {
             if(!error)
             {
                 dispatch_async(dispatch_get_main_queue(), ^ {
                     
                     self->nytArticlesArray = articlesArray;
                     [self->_tbl_articlesList reloadData];
                 });
             }
             else
                 NSLog(@"Error %@", [error localizedDescription]);
         }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([nytArticlesArray count] > 0)
        return  [nytArticlesArray count];
    else
    return 0;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [nytArticlesArray objectAtIndex:indexPath.row];
    
    ArticlesCellTableViewCell *cell = (ArticlesCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kArticleCellIdentifier];
    cell.lbl_title.text = article.title;
    cell.lbl_byLine.text = article.byline;
    cell.lbl_datePublished.text = article.datePublished;
    
    NSURL *url = [NSURL URLWithString:article.imageURLIcon];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    cell.imageView.image = img;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeightConstant;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *article = [nytArticlesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:kPushSegue sender:article];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ArticleDetailsViewController *detailViewController = [segue destinationViewController];
    detailViewController.article = (Article*)sender;
}
@end
