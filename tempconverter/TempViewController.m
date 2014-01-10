//
//  TempViewController.m
//  tempconverter
//
//  Created by Andy Rhee on 1/9/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@property (nonatomic, strong) NSString *lastFahrenheit;
@property (nonatomic, strong) NSString *lastCelcius;

@end


@implementation TempViewController

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)fahrenheitTextField:(UITextField *)sender {
    NSLog(@"Fahrenheit text field entered.");
}

- (IBAction)celciusTextField:(UITextField *)sender {
    NSLog(@"Celcius text field entered");
}

- (IBAction)convertButton:(UIButton *)sender {
    NSLog(@"Convert button pressed.");
    [self updateValues];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temparature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.celciusTextField.text = @"0.0";
    self.fahrenheitTextField.text = @"32.0";
    self.lastCelcius = self.celciusTextField.text;
    self.lastFahrenheit = self.fahrenheitTextField.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues
{
    NSLog(@"%@ lf: %@ f: %@ lc: %@ c: %@", @"Update values", self.lastFahrenheit, self.fahrenheitTextField.text, self.lastCelcius, self.celciusTextField.text);
    
    if ( ! [self.fahrenheitTextField.text isEqualToString:self.lastFahrenheit]) {
        
        self.lastFahrenheit = [NSString stringWithFormat:@"%0.1f", [self.fahrenheitTextField.text floatValue ] ];
        
        self.fahrenheitTextField.text = self.lastFahrenheit;
        
        float celcius = ([self.lastFahrenheit floatValue] - 32) * 5 / 9;
        
        self.celciusTextField.text = [NSString stringWithFormat:@"%0.1f", celcius];
        
        self.lastCelcius = self.celciusTextField.text;

        NSLog(@"%@ %0.1f %@ %0.1f", @"Fahrenheit: ", [self.lastFahrenheit floatValue], @" Celcius: ", celcius);
        
    }
    else if (! [self.celciusTextField.text isEqualToString: self.lastCelcius] ) {
        
        self.lastCelcius = [NSString stringWithFormat:@"%0.1f", [self.celciusTextField.text floatValue] ];
        
        self.celciusTextField.text = self.lastCelcius;
        
        float fahrenheit = ([self.lastCelcius floatValue] * 9 / 5) + 32;
        
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.1f", fahrenheit];
        
        self.lastFahrenheit = self.fahrenheitTextField.text;
        
        NSLog(@"%@ %0.1f %@ %0.1f", @"Fahrenheit: ", fahrenheit, @" Celcius: ", [self.celciusTextField.text floatValue]);
    }
}

@end
