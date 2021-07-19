//
//  main.swift
//  Day04
//
//  Created by Hyeji on 2021/07/19.
//

import Foundation

// 함수 (기능들 하나로 만들기)
func funcName(){ // 함수 기본 구조 (public, private 구분 안 함)
    
}

func interSum(a: Int, b: Int) -> Int{ // 변수 이름 a, b & 데이터 타입 : Int & return -> Int (없으면 -> Void 쓰거나 아예 안써도 가능)
    //        데이터 들어오는 곳     데이터 나가는 곳
    return a + b
}

var abSum = interSum(a: 5, b: 8)
print(abSum)

// 변수는 많이 사용하지 않는 게 좋음! -> 우리가 만드는 건 스마트 폰에서 돌아가는데 변수는 무조건 메모리를 많이 차지하기 때문!
print(interSum(a: 5, b: 8))

func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "hyehh"))
print(greet(person: "Brian"))
print(greet(person: "Grace"))

// Argument가 필요없는 함수
func sayHelloWorld() -> String {
    return "Hello World!"
}

print(sayHelloWorld())

// 우편번호 zipCode: String - 한 칸 띄어쓰기 하면 사용자에게 우편번호 라는 글자만 보임! (단, _ 사용 불가)
// country: String? = "USA" - parameter 적지 않을 경우 default 값 USA (?없이 String 적으면 무조건 default 값은 USA - 단, nil 허용 안하는 것임)
func buildAddress(_ name: String, address: String, city: String, 우편번호 zipCode: String, country: String? = "USA") -> String{
    return """
        \(name)
        \(address)
        \(city)
        \(zipCode)
        \(country ?? "")
        """
    // \(country ?? "") - nil 이면 "" 빈 칸 찍어줌
}

print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: "China"))
print(buildAddress("장비", address: "중국", city: "북경", 우편번호: "234")) // USA
print(buildAddress("유비", address: "중국", city: "상하이", 우편번호: "123", country: nil)) // 빈 칸 (nil이기 때문)

// 가변 매개변수 (Argument에 들어가는 변수의 개수가 상황에 따라 달라짐)
// ... 범위 연산자
func sayHelloFriends(me: String, friend: String...) -> String {
    return "Hello \(friend)! I'm \(me)."
}

print(sayHelloFriends(me: "초선", friend: "손견", "손책", "장양")) // 리스트로 담겨서 출력됨!

// 복수의 값을 반환하는 함수 (return 여러 개)
func getCountry() -> (dialCode: Int, isoCode: String, name: String) {
    let country = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country
}

let ret = getCountry()
print(ret)
print(ret.dialCode)

// 시작 숫자부터 끝 숫자까지의 합계를 구하는 함수
// 1) for문
func addRange(start:Int, end:Int) -> String {
    var sum = 0
    for i in start...end{
        sum += i
    }
    return "\(start)부터 \(end)까지의 합은 \(sum)입니다."
}
// 2) while문
func plusRange(start:Int, end:Int) -> String {
    var sum = 0
    var num = start
    while num <= end{
        sum += num
        num += 1
    }
    return "\(start)부터 \(end)까지의 합은 \(sum)입니다."
}

print(addRange(start:1, end:100))
print(plusRange(start: 1, end: 100))

// Overloading : 함수의 이름은 중복되도 parameter의 개수로 구분이 가능
// 도형의 면적과 둘레를 구하는 함수
// 원
func shape(_ r: Double){
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원 : \(area), \(border)")
}

shape(5)

// 직사각형
func shape(_ w: Int, _ h: Int){
    let area = w * h
    let border = 2 * (w + h)
    print("직사각형 : \(area), \(border)")
}

shape(5, 6)

// 직각 삼각형
func shape(_ bottom: Int, _ height: Int, _ bevel: Int){
    let area = (Double(bevel) + Double(height)) / 2
    let border = bottom + height + bevel
    print("직각 삼각형 : \(area), \(border)")
}

shape(2, 3, 4)

/*
 Class : 전통적인 OOP (object oriented programming)관점에서의 클래스 - 이 구조는 Swift에서도 동일
 - 단일 상속
 - property
 - constructor
 - method // 스위프트에서는 function
 - 참조 타입 선언(Call by reference)
 
 Struct (상속을 할 수 없는 Class)
 - 상속 불가
 - property
 - constructor
 - method // 스위프트에서는 function
 - 값 타입 선언(Call by value)
 */

// Class 와 Struct 의 비교
struct ValueType { // 이름 대문자로 시작!
    var property = 1
}

class ReferenceType { // 이름 대문자로 시작!
    var property = 1
}

// class이름 object이름 = new Constructor : Swift에서는 여기에서 new 만 안쓰면 됨!

// struct는 복제하고 써도 아무상관 없으나 class는 복제하고 쓰면 같은 값을 가지게 된다!

let firstStructInstance: ValueType = ValueType()
// let firstStructInstance = ValueType() 이렇게 써도 됨!
var secondStructInstance = firstStructInstance // 쌍둥이 만들어도 value값은 다르게 가짐 (이란성 쌍둥이라고 생각)
secondStructInstance.property = 2

// 값은 다 다르게 가지고 있음!
print("first : \(firstStructInstance.property)")
print("second : \(secondStructInstance.property)")

let firstClassInstance: ReferenceType = ReferenceType()
// let firstClassInstance = ReferenceType()
var secondClassInstance = firstClassInstance // 쌍둥이 만들면 value값은 같은 값을 가짐 (일란성 쌍둥이라고 생각)
secondClassInstance.property = 2

// 같이 값이 바뀌어버림!
print("first : \(firstClassInstance.property)")
print("second : \(secondClassInstance.property)")

