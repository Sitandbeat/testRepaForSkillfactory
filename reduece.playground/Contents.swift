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
nameOfMonths.map{YearArray.append((NameOfMonth: $0, DaysInMonths: (daysInMonths[nameOfMonths.firstIndex(of: $0) ?? 0]))) }
// Выводим массив кортежей в консоль
print(YearArray)

// Наполняем массив кортежей значениями и выводим дни в обратном порядке не изменяя исходного массива
var ReverseYearArray: [tuppleArray] = []
var copyOfDaysInMonths = daysInMonths
nameOfMonths.map{ReverseYearArray.append((NameOfMonth: $0, DaysInMonths: (copyOfDaysInMonths.removeLast()))) }
// Выводим массив кортежей в консоль
print(ReverseYearArray)

// Функция которая принимает 2 значения и выводит остаток в днях до конца года от указанной даты
func randomDateDaysToNY(day: Int, Month: String) {
    if !nameOfMonths.contains(Month) {
        print ("Use valid name of Month from the Array \'nameOfMonths\' ")
    }

    else {
    var daysToNy = 0
    let monthIndex = nameOfMonths.firstIndex(of: Month)!
    
    if day < 0 || day > daysInMonths[monthIndex] {
        print ("the input should be bigger than 0 and smaller then \(daysInMonths[monthIndex] + 1)") }
    
    for days in daysInMonths[monthIndex..<daysInMonths.count] {
        daysToNy += days
    }
        print (daysToNy - day)
        
    }
}

randomDateDaysToNY(day: 3, Month: "December")

// Cоздаем словарь студентов, формата имя фамилия - ключ
var studentsJournal: [String: Int] = ["Макалей Калкин": 1, "Джонни Депп": 4, "Ума Турман": 3, "Билл Скарсгард" :3]

// Изменение оценки студенту
studentsJournal["Ума Турман"] = 5

// проверка оценок студентов и вывод сообщений

func checkPoints (Dict: Dictionary <String, Int>) {
    for (name, point) in Dict {
        if point < 3 {
            print(" \(name) - you should pass your exam once again")
        } else {
            print(" \(name) - Congratulations, you pass the exam")
        }
    }
}

checkPoints(Dict: studentsJournal)

// Добавляем еще несколько студентов

studentsJournal["Билл Клинтон"] = 4
studentsJournal["Билл Мюррей"] = 3

// Удаляем студента
studentsJournal["Макалей Калкин"] = nil

// Считаем средний бал

let points = [Int](studentsJournal.values)
print (Double(points.reduce(0, +))/Double(points.count))
