import UIKit
// Список ошибок в перечислении
enum ListOfErrors: Error {
    case error400 //= "400 Bad Request"
    case error404 //= "404 Not Found"
    case error500 //= "500 Internal Server Error"
}
// Ошибки для задания 4
enum ListOfErrorsForTypes: Error {
    case areEqual
    case areNotEqual
}

// Создаем переменные для ошибок
var error400:Bool = true
var error404:Bool = false
var error500:Bool = false

// Создаем генерирующую функцию

func errorDetector() throws {
    if error400 {
        throw ListOfErrors.error400
    }
    if error404 {
        throw ListOfErrors.error404
    }
    if error500 {
        throw ListOfErrors.error500
    }
}

// Конструкция Do - Catch для обработки ошибок (вариант без функции и с ней)
do {
    try errorDetector()
//    if error400 {
//    throw ListOfErrors.error400
//    }
//    if error404 {
//    throw ListOfErrors.error404
//    }
//    if error500 {
//        throw ListOfErrors.error500
} catch ListOfErrors.error400 {
    print("400 Bad Request")
} catch ListOfErrors.error404 {
    print("404 Not Found")
} catch ListOfErrors.error500 {
    print ("500 Internal Server Error")
}


// 3. Есть функция, принимающая на вход два разных типа, которая проверяет типы входных значений. Выводит “Yes”, если они одинаковые, в противном случае — “No”.
// + добавил возврат bool для задания 5, чтобы не переписывать функцию
func typeChecker<T: Equatable, E: Equatable>(firstValue: T, secondValue: E) -> Bool{
    if type(of: firstValue) == type(of: secondValue) {
        print ("YES")
        return true
    } else {print("NO")
        return  false
    }
}
typeChecker(firstValue: "lama", secondValue: "Panama")

// 4. Реализовано то же самое, что и в пункте 3, но если тип входных значений различается, выбрасывается исключение. Если тип одинаковый — исключение тоже выбрасывается.
func typeCheckerWithThrows<T: Equatable, E: Equatable>(firstValue: T, secondValue: E) throws {
    if type(of: firstValue) == type(of: secondValue) {
        throw ListOfErrorsForTypes.areEqual
    }
    else {
        print("NO")
        throw ListOfErrorsForTypes.areNotEqual
    }
}
do { try typeCheckerWithThrows(firstValue: "Panama", secondValue: "Panama")
} catch ListOfErrorsForTypes.areEqual {
    print("YES")
} catch ListOfErrorsForTypes.areNotEqual {
    print("NO")
}

// 5. Есть функция, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства (==).
func valueChecker <T: Equatable, E: Equatable> (firstValue: T, secondValue: E) {
    if typeChecker(firstValue: firstValue, secondValue: secondValue) {
        let newFirstValue = firstValue
        let newSecondValue = secondValue as! T
        if newFirstValue == newSecondValue {
            print("They equal")
        } else {print("They aren't equal")}
    } else {print("Types are different")}
}

valueChecker(firstValue: 3, secondValue: "lama")
