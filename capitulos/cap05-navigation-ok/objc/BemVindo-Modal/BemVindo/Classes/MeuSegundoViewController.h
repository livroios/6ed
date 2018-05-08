//
//  MeuSegundoViewController.h
//  BemVindo
//
//  Created by Ricardo Lecheta on 7/9/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuSegundoViewController : UIViewController
{
    IBOutlet UILabel *label;
    NSString *msg;
}

@property (nonatomic, strong) NSString *msg;

- (IBAction)voltar:(id)sender;

@end
