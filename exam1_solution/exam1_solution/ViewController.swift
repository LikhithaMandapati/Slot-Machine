//
//  ViewController.swift
//  exam1_solution
//
//  Created by Vitaly Zhukov on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var spins_cnt = 0
    var won = 0
    let spinImgs = [UIImage(named:"1"),
                     UIImage(named:"2"),
                     UIImage(named:"3"),
                     UIImage(named:"4"),
                     UIImage(named:"5")]
    
    @IBOutlet weak var CreditLabel: UILabel!
    
    @IBOutlet weak var BetLabel: UILabel!
    
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet weak var Image2: UIImageView!
    
    @IBOutlet weak var Image3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(_ animated: Bool) {
        updateSecond()
    }
    
    @IBAction func Spin(_ sender: Any) {
        
        if Int(CreditLabel.text!)! >= Int(BetLabel.text!)! {
        
        Image1.image = spinImgs.randomElement() as! UIImage
        Image2.image = spinImgs.randomElement() as! UIImage
        Image3.image = spinImgs.randomElement() as! UIImage
        spins_cnt += 1
            
            if Image1.image! == Image2.image! && Image2.image! == Image3.image! {
                CreditLabel.text = String(Int(CreditLabel.text!)! + Int(BetLabel.text!)!*10)
                won += Int(BetLabel.text!)!*10
            } else {
                CreditLabel.text = String(Int(CreditLabel.text!)! - Int(BetLabel.text!)!)
            }
            
        } else {
        createAlert(title: "Not enough credit!", msg: "Please add more credit at the bank tab.")
        }
        BetLabel.text = "1"

    }
    
    
    @IBAction func BetIncrease(_ sender: Any) {
        if Int(BetLabel.text!)! < 1000 {
            BetLabel.text = String(Int(BetLabel.text!)!*2)
        } else {
            BetLabel.text = "1"
        }
        
    }
    
    func createAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateSecond() {
        let secondTab = self.tabBarController?.children[1] as! BankController
        
        secondTab.Spins.text = String(spins_cnt)
        secondTab.Credit.text = CreditLabel.text!
        secondTab.Won.text = String(won)
    }
    
}

