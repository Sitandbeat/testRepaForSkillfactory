//
//  ViewController.swift
//  TestFileForTasks
//
//  Created by Maxim on 16.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "0"
        // Do any additional setup after loading the view.
    }
    
    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var resultNumber:Double = 0

    
    var varOperator = "+"
    var isNewNumber = false
    var resultProviden = false
    var isSecondNumber = false
    
    var readyForCalculations = false
    
    func removeDot() {
        if result.text!.suffix(2) == ".0" {
            result.text!.removeLast(2)
        }}
    
    // функция для подсчета при нажатии второго знака действия
    func updateResultWithOperator() {
        if readyForCalculations {
            calculateFloat(Operator: varOperator)
            resultProviden = true
        }
    }
    
    // функция проверки первое число ноль или нет, для контроля ввода 0
    func checkerZero() {
        if result.text == "0" {
            clearTextField()
        }
    }
    
    func clearTextField(){
        result.text = ""
    }

    
    // Функция для калькулятора основных операций
    func calculateFloat (Operator: String) {
        if !resultProviden {
            secondNumber = Double(result.text!)!
        }
            
            switch Operator {
            case "+":
                resultNumber = firstNumber+secondNumber
                    result.text = String(resultNumber)
            case "-":
                resultNumber = firstNumber-secondNumber
                result.text = String(resultNumber)
                
            case "*":
                resultNumber = firstNumber*secondNumber
                result.text = String(resultNumber)
            case "/":
                resultNumber = firstNumber/secondNumber
                result.text = String(resultNumber)

            default:
                result.text = "ERROR"}
        
        removeDot()

    }
    // Функция для проверки что введеное число второе, обнуляем значение в поле текста
    func resetForSecondNumber() {
        if isNewNumber {
            result.text = ""
        }
    }
    // Функция сохраняет данные из строки ввода в число формата дабл
    func saveNumberInt() {
        firstNumber = Double(result.text!)!
        readyForCalculations = true
    }
    
    // очищаем текстовое поле для последующего ввода следующей операции
    func clearResultAfterCalc() {
        if resultProviden {
            clearTextField()
            resultProviden = false
        }
    }
        
    @IBAction func Button1(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        result.text = result.text! + "1"
        isNewNumber = false
        clearResultAfterCalc()
        
    }
    
    @IBAction func Button2(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "2"
        isNewNumber = false
        
    }
    @IBAction func Button3(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "3"
        isNewNumber = false
    }
    @IBAction func Button4(_ sender: Any) {
        resetForSecondNumber()
        clearResultAfterCalc()
        result.text = result.text! + "4"
        isNewNumber = false
    }
    @IBAction func Button5(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "5"
        isNewNumber = false
    }
    @IBAction func Button6(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "6"
        isNewNumber = false
    }
    @IBAction func Button7(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "7"
        isNewNumber = false

    }
    @IBAction func Button8(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "8"
        isNewNumber = false
    }
    @IBAction func Button9(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "9"
        isNewNumber = false
    }
    @IBAction func Button0(_ sender: Any) {
        resetForSecondNumber()
        checkerZero()
        clearResultAfterCalc()
        result.text = result.text! + "0"
        isNewNumber = false
    }
    @IBAction func ButtonPercent(_ sender: Any) {
        if !isSecondNumber {
        firstNumber = Double(result.text!)!/100
            result.text = String(firstNumber)
            removeDot()
        }
        secondNumber = firstNumber/100 * Double(result.text!)!
        result.text = String(secondNumber)
        removeDot()
        
    }
    
    @IBAction func ButtonMinusPlus(_ sender: Any) {
        if result.text != "0" {
        if result.text!.hasPrefix("-") {
            result.text!.remove(at: result.text!.startIndex)
        }
        else {
            result.text = "-" + result.text!}
        }
    }
    
    @IBAction func ButtonClear(_ sender: Any) {
        result.text = "0"
        firstNumber = 0
        secondNumber = 0
        resultNumber = 0
        isNewNumber = false
        isSecondNumber = false
        resultProviden = false
        readyForCalculations = false
    }
    @IBAction func ButtonDevide(_ sender: Any) {
        updateResultWithOperator()
        varOperator = "/"
        isNewNumber = true
        isSecondNumber = true
        saveNumberInt()
    }
    
    @IBAction func ButtonMultiply(_ sender: Any) {
        updateResultWithOperator()
        varOperator = "*"
        isNewNumber = true
        isSecondNumber = true
        
        saveNumberInt()

    }
    
    @IBAction func ButtonMinus(_ sender: Any) {
        updateResultWithOperator()
        varOperator = "-"
        isNewNumber = true
        isSecondNumber = true
        saveNumberInt()

    }
    @IBAction func ButtonPlus(_ sender: Any) {
        updateResultWithOperator()
        varOperator = "+"
        isNewNumber = true
        isSecondNumber = true
        saveNumberInt()
    }
    
    @IBAction func dot(_ sender: Any) {
        if result.text!.contains(".") {}
        else {result.text = result.text! + "."}
    }
    
    
    @IBAction func ButtonEqual(_ sender: Any) {
        calculateFloat(Operator: varOperator)
        saveNumberInt()
        resultProviden = true
        
        readyForCalculations = false
    }
    
}
