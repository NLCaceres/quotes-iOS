//
//  ViewController.m
//  InClassLab
//
//  Created by Nicholas Caceres on 9/28/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "ViewController.h"
#import "QuoteModel.h"

@interface ViewController ()

// IBOutlets
// Labels initialized! for tap gestures to get hold of
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

// private properties
@property (strong, nonatomic) QuoteModel *quoteSet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.quoteSet = [[QuoteModel alloc] init];
    
    // Tap Gesture Recognizer
    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];
    
    // Add swipe gesture recognizers
    UISwipeGestureRecognizer *leftSwipe =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(leftSwipeRecognized:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(rightSwipeRecognized:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
}


- (void) singleTapRecognized : (UITapGestureRecognizer *) recognizer {
    
    NSDictionary * quote = [self.quoteSet randomQuote];
    
    self.authorLabel.text = [quote objectForKey:kAuthor];
    self.quoteLabel.text = [quote objectForKey:kQuote];
    
}

- (void) leftSwipeRecognized : (UIGestureRecognizer *) recognizer {
   
    NSDictionary * quote = [self.quoteSet nextQuote];
    
    self.authorLabel.text = [quote objectForKey:kAuthor];
    self.quoteLabel.text = [quote objectForKey:kQuote];
    
}

- (void) rightSwipeRecognized : (UIGestureRecognizer *) recognizer {
    
    NSDictionary * quote = [self.quoteSet prevQuote];
    
    self.authorLabel.text = [quote objectForKey:kAuthor];
    self.quoteLabel.text = [quote objectForKey:kQuote];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
