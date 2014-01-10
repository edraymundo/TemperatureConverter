//
//  TemperatureViewController.m
//  temperature
//
//  Created by kex on 1/8/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

- (IBAction)buttonClick:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)farenheitChanged:(id)sender;
- (IBAction)celsiusChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UITextField *farenheitLabel;
@property (weak, nonatomic) IBOutlet UITextField *celsiusLabel;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.button.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)farenheitToCelsius{
    float farenheit = [self.farenheitLabel.text floatValue];
    self.celsiusLabel.text = [NSString stringWithFormat:@"%0.0f",(farenheit -  32) * 5/9];
}

- (void)celsiusToFarenheit{
    float celsius = [self.celsiusLabel.text floatValue];
    self.farenheitLabel.text = [NSString stringWithFormat:@"%0.0f",celsius * 9/5 + 32];
}

- (IBAction)buttonClick:(id)sender {
    if(self.celsiusLabel.text == NULL && self.farenheitLabel.text == NULL){
        return;
    }
    if(self.celsiusLabel.text == NULL){
        [self farenheitToCelsius];
    }else{
        [self celsiusToFarenheit];
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)farenheitChanged:(id)sender {
    self.celsiusLabel.text = NULL;
}

- (IBAction)celsiusChanged:(id)sender {
    self.farenheitLabel.text = NULL;
}

@end
