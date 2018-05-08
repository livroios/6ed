import UIKit
import UserNotifications

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Inicia o Firebase
        FirebaseApp.configure()
        
        // Configura o delegate do Firebase
        Messaging.messaging().delegate = self
        
        // Solicita permissão para que este app receba mensagens de Push
        // Vai mostrar um alerta para o usuário confirmar
        if #available(iOS 10.0, *) {
            // Para iOS >= 10
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            // Para versões antigas.
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        // Registra o aplicativo para receber mensagens de Push
        application.registerForRemoteNotifications()

        return true
    }
    
    // Chamado quando recebe um Push (versões antigas)
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {

        // Imprime os dados recebidos por Push
        log(userInfo: userInfo)
    }
    
    // Chamado quando recebe um Push (versões antigas)
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        // Imprime os dados recebidos por Push
        log(userInfo: userInfo)
        
        // Informa ao iOS que o app recebeu a mensagem
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    // Falhou para registrar no Firebase
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Erro ao se registrar para receber Push: \(error.localizedDescription)")
    }
}

// Código para iOS >= 10
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // (A)
    // Recebeu uma notificação no iOS >= 10
    // Com o app aberto
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notificacao com o app aberto")
        
        // Dados da mensagem
        let userInfo = notification.request.content.userInfo
        
        // Imprime os dados recebidos por Push
        log(userInfo: userInfo)
        
        // Informa ao iOS que o app recebeu a mensagem
        completionHandler([])
    }
    
    // (B)
    // Recebeu uma notificação
    // Com o app fechado, ao clicar na notificação
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        print("Notificacao com o app fechado. Clicou na notificação.")
        
        // Imprime os dados recebidos por Push
        log(userInfo: userInfo)
        
        completionHandler()
    }
    
    // Imprime os dados recebidos por Push
    func log(userInfo: [AnyHashable : Any]) {
        // Imprime a mensagem recebida por Push
        print("userInfo: \(userInfo)")
        
        if let aps = userInfo["aps"] as? Dictionary<String, Any> {
            
            let alert = aps["alert"]
            if let alert = alert {
                
                let alertDict = aps["alert"] as? Dictionary<String, Any>
                if let alertDict = alertDict {
                    // Quando envia o titulo o alerta vem com o titulo e body
                    if let title = alertDict["title"] {
                        print("Title: \(title)")
                    }
                    
                    if let body = alertDict["body"] {
                        print("Body: \(body)")
                    }
                } else {
                    // Imprime o alerta se não foi informado o title
                    print(alert)
                }
            }
        }
        if let nome = userInfo["nome"] {
            print("Nome:  \(nome)")
        }
        if let sobrenome = userInfo["sobrenome"] {
            print("Sobrenome:  \(sobrenome)")
        }
    
    }
}
// fim do iOS >= 10

// Delegate do Firebase
extension AppDelegate : MessagingDelegate {
    // Chamado quando o aplicativo recebe um Device Token
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        
        // (C)
        // Imprime o Token do dispositivo
        print("Firebase registration token: \(fcmToken)")
        
        // Aqui devemos enviar este token para o servidor...
    }
}
