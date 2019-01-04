//
//  ViewController.swift
//  ShoppingCalculator
//
//  Created by Chengyue Gong on 2019/1/2.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var originalPrice: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var salesTax: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBOutlet weak var clBtnOriginalPrice: UIButton!
    @IBOutlet weak var clBtnDiscount: UIButton!
    @IBOutlet weak var clBtnSalesTax: UIButton!
    
    var oValue: Double = 0 // original price
    var dValue: Double = 0 // dicount %
    var sValue: Double = 0 // sales tax %
    
    // Set new final price
    func setFinalPrice() {
        var price = oValue * (1-dValue/100) * (1+sValue/100)
        if price < 0 {
            price = 0
        }
        let displayText = "$\(String(format: "%.2f", price))"
        finalPrice.text = displayText
    }
    
    // Update the final price when editing the text field
    @IBAction func originalPriceChanged(_ sender: UITextField) {
        if let o = Double(sender.text!) {
            oValue = o
        } else {
            oValue = 0
        }
        setFinalPrice()
    }
    
    @IBAction func discountChanged(_ sender: UITextField) {
        if let d = Double(sender.text!) {
            dValue = d
        } else {
            dValue = 0
        }
        setFinalPrice()
    }
    
    @IBAction func salesTaxChanged(_ sender: UITextField) {
        if let s = Double(sender.text!) {
            sValue = s
        } else {
            sValue = 0
        }
        setFinalPrice()
    }
    
    // Clear text field when press the buttn "X" and update the final price
    @IBAction func clearOriginalPrice(_ sender: UIButton) {
        originalPrice.text = nil
        oValue = 0
        setFinalPrice()
    }
    
    @IBAction func clearDiscount(_ sender: UIButton) {
        discount.text = nil
        dValue = 0
        setFinalPrice()
    }
    
    @IBAction func clearSalesTax(_ sender: UIButton) {
        salesTax.text = nil
        sValue = 0
        setFinalPrice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Set the keyborad type to a decimal pad
        originalPrice.keyboardType = UIKeyboardType.decimalPad
        discount.keyboardType = UIKeyboardType.decimalPad
        salesTax.keyboardType = UIKeyboardType.decimalPad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
