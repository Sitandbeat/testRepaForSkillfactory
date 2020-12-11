import UIKit


let newTuple = (age: 18, name: "Ivan", surname: "Penkovich")
let newSecondTuple = (age: 32, name: "Petro", surname: "Prostyradlo")

newTuple.2
newSecondTuple.name

// Создаем два массива дни и месяца
let daysInMonths: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
daysInMonths.map{ print($0) }
let nameOfMonths: [String] = ["January", "Febrary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

// Печатаем значени двух массивов по формату "Месяц" имеет "колво дней" Дней
nameOfMonths.map{print("\($0) have \(daysInMonths[nameOfMonths.firstIndex(of: $0)!]) days")}


// Создаем пустой массив кортежей нужного типа
typealias tuppleArray = (NameOfMonth: String, DaysInMonths: Int)
var YearArray: [tuppleArray] = []


// Наполняем массив кортежей значениями
nameOfMonths.map{YearArray.append((NameOfMonth: $0, DaysInMonths: (daysInMonths[nameOfMonths.firstIndex(of: $0)!]))) }
// Выводим массив кортежей в консоль
print(YearArray)

// Наполняем массив кортежей значениями и выводим дни в обратном порядке не изменяя исходного массива
var ReverseYearArray: [tuppleArray] = []
var copyOfDaysInMonths = daysInMonths
nameOfMonths.map{ReverseYearArray.append((NameOfMonth: $0, DaysInMonths: (copyOfDaysInMonths.removeLast()))) }
// Выводим массив кортежей в консоль
print(ReverseYearArray)

