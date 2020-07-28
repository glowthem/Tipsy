import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var split = 2
    var totalBill: Double?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)  // touch tip buttons to dismiss keyboard
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let selected = sender.currentTitle!
        let selectedDecimal = String(selected.dropLast())
        
        let selectedDouble = Double(selectedDecimal)!
        tip = selectedDouble / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBill = Double(billTextField.text!)
        
        if let nonOpBill = totalBill {
            print(String(format: "%.2f", nonOpBill * (tip + 1) / Double(split)))
        }else {
            print("입력받은 총 비용이 nil 값이에유!!")
        }
    }
    
}

