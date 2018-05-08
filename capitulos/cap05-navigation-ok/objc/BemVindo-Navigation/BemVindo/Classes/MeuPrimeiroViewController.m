//
//  MeuPrimeiroViewController.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 11/19/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MeuPrimeiroViewController.h"


@interface MeuPrimeiroViewController ()

@end

@implementation MeuPrimeiroViewController

@synthesize segundo;

#pragma mark - View lifecycle
-(void)viewDidLoad {
    self.title = @"Primeiro Controller";
    
    meuPrimeiroLabel.text = @"Tela iniciada com sucesso!";
    
    // Altera a imagem dinamicamente
    UIImage *image = [UIImage imageNamed:@"ferrari_ff.png"];
    imageView.image = image;
    
    // Cores da navigation bar
//  self.navigationController.navigationBar.tintColor = [UIColor greenColor];
//  self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
}

- (IBAction)olaMundo:(id)sender {
    NSLog(@"Olá");
    if ([meuPrimeiroTextField.text isEqualToString:@""] ||
        [meuSegundoTextField.text isEqualToString:@""]) {
        UIAlertView *a = [[UIAlertView alloc] initWithTitle: @"Erro"
                                                    message: @"Digite todos os campos" delegate: self cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
        [a show];
        return;
    }

    // Cria a mensagem
    NSString *s = @"Olá ";
    s = [s stringByAppendingString:meuPrimeiroTextField.text];
    s = [s stringByAppendingString:@" "];
    s = [s stringByAppendingString:meuSegundoTextField.text];
    meuPrimeiroLabel.text = s;
    
    // Libera o foco para fechar o teclado virtual
    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];
    
    // Cria o segundo controller
    self.segundo = [[MeuSegundoViewController alloc] init];
    // Seta a mensagem
    self.segundo.msg = s;
    
    
    // *** Primeira Forma: Tópico 5.6
    // Recupera a UIWindow que gerencia toda as telas do aplicativo
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // Adiciona a view do segundo controller na window
//    UIView *view = segundo.view;
//    [window addSubview:view];


    // *** Segunda Forma: Tópico 5.7 "presentViewController"
    // Navega para o próximo controller
    //segundo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:segundo animated:YES completion:nil];

    // *** Terceira Forma: Tópico 5.8 Navigation Controller
    [self.navigationController pushViewController:segundo animated:YES];
    
}

// Fecha o teclado virtual ao tocar em algum lugar da tela
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == meuPrimeiroTextField) {
        // Navega para o próximo campo
        [meuSegundoTextField becomeFirstResponder];
        return YES;
    } else if (textField == meuSegundoTextField) {
        // Último campo executa o método olaMundo diretamente
        [self olaMundo:textField];
        return YES;
    }
    return NO;
}

- (IBAction)sliderValueChanged:(id)sender {
    UISlider *slider = sender;
    imageView.alpha = [slider value];
}

@end
