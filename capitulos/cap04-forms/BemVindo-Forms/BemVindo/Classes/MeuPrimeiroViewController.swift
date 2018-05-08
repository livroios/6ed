import UIKit
class MeuPrimeiroViewController: UIViewController, UITextFieldDelegate {
    // Declar o outlet do label
    @IBOutlet var meuPrimeiroLabel : UILabel!
    @IBOutlet var meuPrimeiroTextField : UITextField!
    @IBOutlet var meuSegundoTextField : UITextField!
    @IBOutlet var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Atualiza o texto
        meuPrimeiroLabel.text = "Tela iniciada com sucesso!"
        // Indica que a própria classe implementa o protocolo UITextFieldDelegate para
        // responder aos eventos
        meuPrimeiroTextField.delegate = self
        meuSegundoTextField.delegate = self
        
        // Altera a imagem dinamicamente
        let image = UIImage(named:"ferrari_ff.png")
        imageView.image = image
    }
    // Método que vai tratar o evento do botão Olá
    @IBAction func oladMundo(_ sender: UIControl) {
        print("Olá Mundo")
        var s = "Olá "
        let nome = meuPrimeiroTextField.text!.trim()
        let sobrenome = meuSegundoTextField.text!.trim()
        if(nome == "" || sobrenome == "") {
            alerta("Erro", msg: "Digite todos os campos")
            return;
        }
        s += nome
        s += " " + sobrenome
        meuPrimeiroLabel.text = s
    }
    
    // Método que vai tratar o evento do botão Olá
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        imageView.alpha = CGFloat(slider.value)
    }
    
    // Mostra um alerta
    func alerta(_ title:String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Libera o foco
        meuPrimeiroTextField.resignFirstResponder()
        meuSegundoTextField.resignFirstResponder()
    }
    // Intercepta os botões Next e Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == meuPrimeiroTextField) {
            // Navega para o próximo campo
            meuSegundoTextField.becomeFirstResponder()
            return true;
        } else if (textField == meuSegundoTextField) {
            // Último campo executa o método olaMundo diretamente
            self.oladMundo(textField)
            return true
        }
        return false;
    }
}
