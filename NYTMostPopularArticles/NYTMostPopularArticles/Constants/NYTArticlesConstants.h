//
//  NYTArticlesConstants.h
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#ifndef NYTArticlesConstants_h
#define NYTArticlesConstants_h

typedef enum PERIOD {

    PERDAY = 1,
    PERWEEK = 7,
    PERMONTH = 30
    
} PERIOD;

#define kArticleDetailsIdentifier @"ArticleDetailsIdentifier"
#define kAPIKEYValue @"ef848ca1c21741969bb0459ca8542b65"
#define kURL_GET_MOST_POPULAR_ARTICLE @"https://api.nytimes.com/svc/mostpopular/v2/mostviewed"
#define kATTR_SECTIONS @"all-sections"
#define kAPIKEYKey @"api-key"
#define kQueryChar @"?"
#define kQueryExtension @".json"
#define kCharAssignment @"="
#define kArticleCellIdentifier @"ArticleCellIdentifier"

#endif /* NYTArticlesConstants_h */
