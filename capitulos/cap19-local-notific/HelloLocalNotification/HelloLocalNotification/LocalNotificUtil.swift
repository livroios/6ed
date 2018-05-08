//
//  Alerta.swift
//  Carros
//
//  Created by Ricardo Lecheta on 6/28/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class LocalNotificUtil {

    class func addLocalNotification(_ alertBody:String, _ alertAction:String, _ badge:TimeInterval) {
        // Define a Mensagem para exibir ao usuário
        let not = UILocalNotification()
        not.alertBody = alertBody
        
        // Texto da ação quando o botão com a notificação aparecer
        not.alertAction = alertAction
        
        // Som
        not.soundName = UILocalNotificationDefaultSoundName
        
        // Incrementa o applicationIconBadgeNumber baseado no que está configurado no UIApplication
        not.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        
        // Configura a notificação para daqui a 2 segundos
        not.fireDate = Date(timeIntervalSinceNow:badge)
        not.timeZone = TimeZone.current
        
        // Agenda a notificação
        UIApplication.shared.scheduleLocalNotification(not)
        print("Notificação agendada com sucesso")
    }

}
