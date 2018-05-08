//
//  MeuPrimeiroViewController.h
//  BemVindo
//
//  Created by Ricardo Lecheta on 11/19/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuPrimeiroViewController : UIViewController
{
    IBOutlet UILabel *meuPrimeiroLabel;
    IBOutlet UITextField *meuPrimeiroTextField;
    IBOutlet UITextField *meuSegundoTextField;
    IBOutlet UIImageView *imageView;
}

- (IBAction)olaMundo:(id)sender;

- (IBAction)sliderValueChanged:(id)sender;

@end
