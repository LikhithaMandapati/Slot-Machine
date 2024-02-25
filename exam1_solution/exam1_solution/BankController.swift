//
//  BankController.swift
//  exam1_solution
//
//  Created by Vitaly Zhukov on 20.09.2022.
//

import UIKit

class BankController: UIViewController {

    
    @IBOutlet weak var Spins: UILabel!
    
    @IBOutlet weak var Won: UILabel!
    
    @IBOutlet weak var Credit: UILabel!
    
    @IBOutlet weak var CreditInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        updateFirst()
    }
    

    @IBAction func AddCredit(_ sender: Any) {
        if CreditInput.text == "" {
            CreditInput.text = "0"
        }
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: CreditInput.text!)
 
        if allowedCharacters.isSuperset(of: characterSet) {
            Credit.text = String(Int(Credit.text!)! + Int(CreditInput.text!)!)
        } else {
            createAlert(title: "Please enter valid number", msg: "Please add more credit at the bank tab.")
            CreditInput.text = "0"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateFirst() {
        let firstTab = self.tabBarController?.children[0] as! ViewController
        
        firstTab.CreditLabel.text = Credit.text!
    }

}
