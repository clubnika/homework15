import UIKit

let arrayNum = [123,122,124,512,5643,164,146,266]

// 1)
let sortedArray = arrayNum.sorted()

let sortedArray2 = arrayNum.sorted { (first: Int, second: Int) -> Bool in
    return first > second
}
let sortedArray3 = arrayNum.sorted {$0 < $1}
sortedArray3

// 2)
let stringArray = arrayNum.map { String($0) }
stringArray

// 3)
let nameArray = ["Misha","Vasia","Elisa","Milka"]
let stringName = nameArray.reduce("", {$0 + " \($1)"})
stringName

let stringName2 = nameArray.reduce("") { (q, name) -> String in
    return q + " " + name
}

// 4)
func delayTwoSeconds (q: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
        q()
    })
}

delayTwoSeconds {
    print("Текст с задержкой")
}

// 5)
func one() -> String{
    print("ONE")
    return "ONE"
}
func two() -> String{
    print("TWO")
    return "TWO"
}

func countCharacter( o: @escaping () -> String, t: @escaping () -> String) -> ( () -> Int ){
    return { let o = o(), t = t(); return (o + t).count }
}

var qwe = countCharacter(o: one, t: two)
qwe()

var qwert = countCharacter(o: one, t: one)
countCharacter(o: one, t: one)
qwert()

func printOne()->(){
    print("Печать ОДИН")
}
func printTwo()->(){
    print("Печать ДВА")
}

func loadVoid(one: @escaping () -> (), two: @escaping () -> () ) -> ( ()->() ) {
    one(); two()
    return { print("просто вызов функции") }
}

loadVoid(one: printOne , two: printTwo)
var pustata = loadVoid(one: printOne, two: printTwo)
pustata()

// 6)
func f(one: Int,two: Int)->Bool{
    return one < two
}
func sort(array: [Int], f: (Int,Int) -> Bool ) -> [Int] {
    return array.sorted(by: f)
}
var arr = [2,5,7,1]
sort(array: arr, f: f)

sort(array: arrayNum, f: f)
