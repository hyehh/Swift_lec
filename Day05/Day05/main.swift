//
//  main.swift
//  Day05
//
//  Created by Hyeji on 2021/07/20.
//

import Foundation

// class는 화면 하나다! 라고 생각하기
// 상속받지 않을 경우 struct 사용하는 게 퍼포먼스적으로 좋음!
// 구조체 : Structure
// : Swift에서 Data Type을 정의할 때 많이 사용 (Int나 String 같은 데이터 타입 형성할 때 사용)

// Structure 생성
struct Sample {
    // property : 변수에 대해 데이터 타입 정의
    var sampleProperty: Int = 10 // 가변 property
    let fixedSampleProperty: Int = 100 // 불변 property
    static var typeProperty: Int = 1000 // 타입 property - 많이 사용하기!
    
    // 생성자
    init() { // init 이 생성자 만드는 역할
       // 비어있는 생성자 형성
    }
    
    // function
    func instanceMethod() {
        print("instance method")
    }
    
    // static function - 많이 사용은 안하지만 만들 수는 있음
    static func typeMethod(){
        print("type method")
    }
}

// Structure 사용 (static 없으면 instance 생성해야 사용 가능)
var samp: Sample = Sample() // Instance 형성
//        클라스이름  생성자이름
var samp2 = Sample() // 타입은 자동으로 추론해서 적어주기 때문에 이렇게 정의해도 가능!
// static은 samp. 에서 사용 불가
print(samp.sampleProperty)
samp.sampleProperty = 100
print(samp.sampleProperty)
// samp에서 값 변경해줘도 samp2의 값은 변경되지 않음
print(samp2.sampleProperty)

// Type Property : static
// Sample. 에서 static 사용 가능 (static 관련 부분은 원래 이름(Sample) 그대로 적어야 나옴)
Sample.typeMethod()
print(Sample.typeProperty)

// 학생 구조체
struct Student {
    var name: String = "unknown"
    // 원래 class는 swift 에서 지정어이기 때문에 사용 불가
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입 입니다.")
    }
    
    // static 함수와 아닌 함수는 엄연히 다른 함수이기 때문에 이름 동일해도 사용이 가능
    func selfIntroduce() {
        //print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()

var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

// let은 아무것도 변경할 수 없음
let cathy: Student = Student()
// cathy.name = "Cathy" // name이 var이어도 instance 자체가 let 이기 때문에 변경 불가
cathy.selfIntroduce() // 찍는 것 밖에 할 수 없음

// Class로 변경
class Student1 {
    var name: String = "unknown"
    // 원래 class는 swift 에서 지정어이기 때문에 사용 불가
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입 입니다.")
    }
    
    // static 함수와 아닌 함수는 엄연히 다른 함수이기 때문에 이름 동일해도 사용이 가능
    func selfIntroduce() {
        //print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student1.selfIntroduce()
var student1: Student1 = Student1()

class Shape{
    
    // property
    var area = 0.0
    var border = 0.0
    
//    func input(_ r: Double) -> String {
//        let pi = 3.14
//        area = pi * r * r
//        border = 2 * pi * r
//        return "\(area), \(border)"
//    }
    
    func input(_ r: Double) {
        let pi = 3.14
        area = pi * r * r
        border = 2 * pi * r
        print("원의 면적은 \(String(format: "%.2f", (area))) 이고 둘레는 \(String(format: "%.2f", (border))) 입니다.")
    }
    
//    func input(_ a: Int, _ b: Int) {
//        // 왼쪽에서 데이터 타입 변환하는 의미가 없음
//        let area1 = Int(area.rounded())
//        area1 = a * b
//        border = Double(2 * (a + b))
//    }
    
    func input(_ w: Double, _ h: Double) {
        area = w * h
        border = 2 * (w + h)
        print("직사각형의 면적은 \(String(format: "%.2f", (area))) 이고 둘레는 \(String(format: "%.2f", (border))) 입니다.")
    }
    
    func input(_ a: Double, _ b: Double, _ c: Double) {
        area = (a * b) / 2
        border = a + b + c
        print("직각삼각형의 면적은 \(String(format: "%.2f", (area))) 이고 둘레는 \(String(format: "%.2f", (border))) 입니다.")
    }
    
}

let sh1: Shape = Shape()
// sh1 = Shape() // 생성자를 못바꾼다!
let sh2: Shape = Shape()
let sh3: Shape = Shape()

//print(sh1.input(5)) // 원의 면적과 둘레 구하기 - 원의 면적은 -- 이고 둘레는 -- 입니다.
sh1.input(5) // 원의 면적과 둘레 구하기
sh2.input(5,6) // 직사각형의 면적과 둘레 구하기
sh3.input(5,6,8) // 직각삼각형의 면적과 둘레 구하기

// 생성자로 계산
class Shape1 {
    var area = 0.0
    let pi = 3.14157
    
    // 비어있는 생성자
    init() {
        print("계산 시작")
    }
    
    // 면적 구하는 생성자
    init(radius: Double) {
        area = radius * radius * pi
        calc()
    }
    
    // 면적 구하는 메소드
    func input(r: Double){
        area = r * r * pi
        calc()
    }
    
    func calc() {
        print("원의 면적은 \(Int(area))입니다.")
    }
}

let sh4: Shape1 = Shape1() // 비어있는 생성자에서만 "계산 시작" 출력됨!
sh4.input(r: 5.0)
let sh5: Shape1 = Shape1(radius: 5.0) // 여기에서는 "계산 시작" 출력 안됨!

class Shape2 {
    var area = 0.0
    var border = 0.0
    var shape = ""
    
    init() {
        print("계산 시작")
    }
    
    // 원의 면적 구하는 생성자
    init(r :Double) {
        let pi = 3.14
        shape = "원"
        area = r * r * pi
        border = 2 * pi * r
        calc()
    }
    
    init(w: Double, h: Double) {
        shape = "직사각형"
        area = w * h
        border = 2 * (w * h)
        calc()
    }
    
    init(a: Double, b: Double, c: Double) {
        shape = "직각삼각형"
        area = (a * b) / 2
        border = a + b + c
        calc()
    }
    
    func calc() {
        print("\(shape) : \(Int(area)), \(Int(border))")
    }
    
}

let sha: Shape2 = Shape2(r: 5)
// sh1 = Shape() // 생성자를 못바꾼다!
let shb: Shape2 = Shape2(w: 5, h: 6)
let shc: Shape2 = Shape2(a: 3, b: 4, c: 5)

//print(sh1.input(5)) // 원의 면적과 둘레 구하기 - 원의 면적은 -- 이고 둘레는 -- 입니다.
//sha.input(5) // 원의 면적과 둘레 구하기
//shb.input(5,6) // 직사각형의 면적과 둘레 구하기
//shc.input(5,6,8) // 직각삼각형의 면적과 둘레 구하기

// Extension
// 구조체, 클래스, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능
// 기존에 존재하는 기능은 재정의할 수 없다. (새로운 기능만 추가하는 것)
extension Int{ // Int 에 새로운 기능을 추가하겠다!
    var isEven: Bool{
        return self % 2 == 0 // self 는 들어온 값!
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}
// 기존 기능에 홀짝 수 판단 extension 시킨 것! . 찍으면 나옴
print(1.isEven)
print(1.isOdd)
// extension과 클라스를 연결시켜주는 게 delegate
// extension은 클라스 밖에서 사용하는 것! 그래서 연결이 필요함

// Closure : 함수인데 이름이 없는 함수 (python의 lambda함수)
// ios 에서는 딱 한 군데에서만 사용 : alert message 만들 때만 사용!
func sumFunction(a: Int, b: Int) -> Int{
    return a + b
}

var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult)

// Closure
//              타입정의               이 부분은 원래 function과 동일
var sumClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in // in 앞에 적어준다는 것 기억!
    return a + b
}

sumResult = sumClosure(10, 20)
print(sumResult)

// Random
// in 뒤에는 범위
print(Int.random(in: 1..<10))
print(Int.random(in: 1..<10))

func genNum() -> String{
    return String(Int.random(in: 1..<10))
}

print(genNum())
print(genNum())

