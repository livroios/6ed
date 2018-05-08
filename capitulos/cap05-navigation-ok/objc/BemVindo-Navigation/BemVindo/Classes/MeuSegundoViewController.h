//
//  MeuSegundoViewController.h
//  BemVindo
//
//  Created by Ricardo Lecheta on 11/20/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuSegundoViewController : UIViewController
{
    IBOutlet UILabel *label;
    NSString *msg;
}

@property (nonatomic,strong) NSString *msg;

- (IBAction)voltar;

@end
