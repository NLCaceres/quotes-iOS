//
//  DataModel.h
//  InClassLab
//
//  Created by Nicholas Caceres on 9/28/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kAuthor = @"author";
static NSString * const kQuote = @"quote";

@interface QuoteModel : NSObject

// public method signatures
- (NSUInteger) numberOfQuotes;
- (NSDictionary *) randomQuote;
- (NSDictionary *) quoteAtIndex: (NSUInteger) index;

- (void) insertQuote: (NSDictionary *) QuoteObj
               atIndex: (NSUInteger) index;
- (void) insertQuote: (NSDictionary *) QuoteObj;
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author;
- (void) insertQuote: (NSString *) quote
           author: (NSString *) author
             atIndex: (NSUInteger) index;

- (void) removeQuoteAtIndex: (NSUInteger) index;

- (NSDictionary *) nextQuote;
- (NSDictionary *) prevQuote;

@end
