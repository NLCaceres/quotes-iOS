//
//  DataModel.m
//  InClassLab
//
//  Created by Nicholas Caceres on 9/28/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "QuoteModel.h"

// Class Extension
@interface QuoteModel ()

// private properties
@property (strong, nonatomic) NSMutableArray *quotes;
@property NSUInteger currentIndex;

@end

@implementation QuoteModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary *quote1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"You are never too old to set a new goal or to dream a new dream.", kQuote, @"C. S. Lewis", kAuthor, nil];
        NSDictionary *quote2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"The will to win, the desire to succeed, the urge to reach your full potential... these are the keys that will unlock the door to personal excellence.", kQuote, @"Confucius", kAuthor, nil];
        NSDictionary *quote3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"All our dreams can come true if we have the courage to pursue them.", kQuote, @"Walt Disney", kAuthor, nil];
        NSDictionary *quote4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"The secret of getting ahead is getting started.", kQuote, @"Mark Twain", kAuthor, nil];
        NSDictionary *quote5 = [[NSDictionary alloc] initWithObjectsAndKeys: @"Do you want to know who you are? Don't ask. Act! Action will delineate and define you.", kQuote, @"Thomas Jefferson", kAuthor, nil];
        NSDictionary *quote6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"I hated every minute of training, but I said 'Don't quit. Suffer now and live the rest of your life as a champion.'", kQuote, @"Muhammad Ali", kAuthor, nil];
        NSDictionary *quote7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Excellence is an art won by training and habituation... We are what we repeatedly do. Excellence, then is not an act but a habit.", kQuote, @"Aristotle", kAuthor, nil];
        NSDictionary *quote8 = [[NSDictionary alloc] initWithObjectsAndKeys:@"The ultimate measure of a man is not where he stands in moments of comfort and convenience, but where he stands at times of challenge and controversy.", kQuote, @"Martin Luther King Jr.", kAuthor, nil];
        NSDictionary *quote9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Better to illuminate than merely shine, to deliver to others contemplated truths than merely contemplate.", kQuote, @"St. Thomas Aquinas", kAuthor, nil];
        NSDictionary *quote10 = [[NSDictionary alloc] initWithObjectsAndKeys:@"I've heard there are troubles of more than one kind. Some come from ahead, some from behind. But I've brought a big bat, you see, now my troubles are going to have troubles with me.", kQuote, @"Dr. Seuss", kAuthor, nil];

        _quotes = [[NSMutableArray alloc] initWithObjects:quote1, quote2, quote3, quote4, quote5, quote6, quote7, quote8, quote9, quote10, nil];
        
    }
    return self;
}

- (NSUInteger) numberOfQuotes {
    return [self.quotes count];
}

- (NSDictionary *) randomQuote {
    NSInteger num = random() % [self numberOfQuotes];
    return self.quotes[num];
}

- (NSDictionary *) quoteAtIndex:(NSUInteger) index {
    return self.quotes[index];
}

- (void) insertQuote: (NSDictionary *) QuoteObj
               atIndex: (NSUInteger) index {
    
    if ( index <= [self numberOfQuotes]) {
        [self.quotes insertObject: QuoteObj atIndex: index];
    }
}
- (void) insertQuote: (NSDictionary *) QuoteObj {
    [self.quotes addObject: QuoteObj];
}
- (void) insertQuote: (NSString *) quote
             author: (NSString *) author {
                 
    NSDictionary *newQuote = [[NSDictionary alloc] initWithObjectsAndKeys:quote, kQuote, author, kAuthor, nil];
    [self insertQuote: newQuote];
}

- (void) insertQuote: (NSString *) quote
             author: (NSString *) author
               atIndex: (NSUInteger) index {
    NSDictionary *newQuote = [[NSDictionary alloc] initWithObjectsAndKeys:quote, kQuote, author, kAuthor, nil];
    [self insertQuote: newQuote atIndex: index];
}

- (void) removeQuoteAtIndex:(NSUInteger)index {
    if (index < [self numberOfQuotes]) {
        [self.quotes removeObjectAtIndex: index];
    }
}


- (NSDictionary *) nextQuote {
    _currentIndex ++;
    return self.quotes[_currentIndex];
}

- (NSDictionary *) prevQuote {
    _currentIndex --;
    return self.quotes[_currentIndex];
}
 
@end
