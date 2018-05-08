//
//  MeuSegundoViewController.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 7/9/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

#import "MeuSegundoViewController.h"

@implementation MeuSegundoViewController

@synthesize msg;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Copia a mensagem para o label
    label.text = msg;
    
    NSLog(@"%@", msg);
}


- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
