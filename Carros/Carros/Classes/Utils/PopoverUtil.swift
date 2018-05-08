import Foundation
class PopoverUtil {
    // Mostra o view controller como popover (janela modal)
    class func show(_ vcSelf: UIViewController,viewController: UIViewController,
                    sourceView: UIView, width: CGFloat, height: CGFloat) {
        let vc = viewController
        // Tamanho da janela
        vc.preferredContentSize = CGSize(width: width, height: height)
        vc.modalPresentationStyle = UIModalPresentationStyle.popover;
        // Origem do popover
        let popoverPresentationController = vc.popoverPresentationController
        popoverPresentationController?.sourceView = sourceView
        // Mostra o view controller como popover
        vcSelf.present(vc, animated: true, completion: nil)
    }
    
    // Idem, mas utiliza o UIBarButtonItem como âncora
    class func show(_ vcSelf: UIViewController,viewController: UIViewController,
                    source: UIBarButtonItem, width: CGFloat, height: CGFloat) {
        let vc = viewController
        // Tamanho da janela
        vc.preferredContentSize = CGSize(width: width, height: height)
        vc.modalPresentationStyle = UIModalPresentationStyle.popover;
        // Origem do popover
        let popoverPresentationController = vc.popoverPresentationController
        popoverPresentationController?.barButtonItem = source
        // Mostra o view controller como popover
        vcSelf.present(vc, animated: true, completion: nil)
    }
}
