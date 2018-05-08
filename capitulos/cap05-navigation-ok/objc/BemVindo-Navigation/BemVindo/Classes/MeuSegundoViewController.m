//
//  MeuSegundoViewController.m
//  BemVindo
//
//  Created by Ricardo Lecheta on 11/20/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MeuSegundoViewController.h"

@implementation MeuSegundoViewController

@synthesize msg;

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Segundo Controller";

    // Copia o conteúdo da mensagem "msg" para o label
    label.text = msg;
    
    // Customizando o botão Voltar
    UIBarButtonItem *btVoltar = [[UIBarButtonItem alloc] initWithTitle:@"Voltar"
                                                                 style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = btVoltar;
}

#pragma mark - Eventos
- (IBAction)voltar {
    
    // Primeira forma
//    [self.view removeFromSuperview];
    
    // Segunda forma: Tópico 5.7
    // Fecha o controller voltando para a tela anterior
//    [self dismissViewControllerAnimated:YES completion:nil];


    // Terceira Forma: Tópico 5.8 Navigation Controller
    // Desempilha o controller atual da navigation bar
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
