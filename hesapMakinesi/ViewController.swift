//
//  ViewController.swift
//  hesapMakinesi
//
//  Created by melek türüdi on 22.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var working:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func clearAll() {
        working = ""
        calculatorWorking.text = ""
        calculatorResult.text = ""
        
    }
    @IBAction func equalsTap(_ sender: Any) {
        
        if(validInput()){
        let checkedWorkingsForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil ) as! Double
        let resultString = formatResult(result: result)
        calculatorResult.text = resultString
        }
        else {
            let alert = UIAlertController(title: "Invalid", message: "calculator unable to do math on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func validInput () -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working{
            if(specialChracter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0){
                return false
            }
            if (index == working.count - 1 ){
                return false
            }
            if(previous != -1) {
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    func specialChracter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
     return false
        
    }
    
    func formatResult(result: Double) -> String{
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    @IBAction func allClearTap(_ sender: Any) {
        if(!working.isEmpty){
            working.removeLast()
            calculatorWorking.text = working
        }
        clearAll()
    }
    @IBAction func backTap(_ sender: Any) {
    }
    func addTwoWorking(value: String){
        working = working + value
        calculatorWorking.text = working
    }
    @IBAction func percentTap(_ sender: Any) {
        addTwoWorking(value: "%")
    }
    @IBAction func divideTap(_ sender: Any) {
        addTwoWorking(value: "/")
    }
    @IBAction func timesTap(_ sender: Any) {
        addTwoWorking(value: "*")
    }
    @IBAction func minusTap(_ sender: Any) {
        addTwoWorking(value: "-")
    }
    @IBAction func plusTap(_ sender: Any) {
        addTwoWorking(value: "+")
    }
    @IBAction func decimalTap(_ sender: Any) {
        addTwoWorking(value: "/")
    }
    @IBAction func zeroTap(_ sender: Any) {
        addTwoWorking(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addTwoWorking(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addTwoWorking(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addTwoWorking(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addTwoWorking(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addTwoWorking(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addTwoWorking(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addTwoWorking(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addTwoWorking(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addTwoWorking(value: "9")
    }
    
}

