//
//  main.swift
//  Day02
//
//  Created by Hyeji on 2021/07/15.
//

import Foundation

// nil 때문에 에러가 많이 걸리는데 이를 방지해주고자 nil을 사용하는 것임!

var str1: String

str1 = "Apple"
str1 = "Google"
// str1 = nil -> nil 값 못들어감! (nil은 optional 변수에만 들어감)

print(str1)

var str2: String?
str2 = "Apple"
str2 = "Google"
// Optional("Google") 이라고 출력됨!
// str2 = nil
// nil은 nil로 출력됨!
print(str2!) // Google 만 출력하고자 ! 사용함!!

str2 = "123"
// optional을 변환시키면 또 optional 나오기 때문에 즉, data는 풀렸지만 타입은 여전히 optional 이기 때문에 한 번 더 풀어줘야 하는 것임
// String -> Int 이거 먼저 풀고 또 optional 풀어줘야 함!
// 변환자에는 ! 을 한 번 더 써줘야 사용이 가능함! (변환했기 때문)
// 근데 보통 이렇게 안쓴다!
var int1: Int = Int(str2!)!
print(int1 + 10)

var string1: String?
string1 = "Apple"
string1 = nil
// print(string1!)

// var string2: String!
// string2 = nil
// print(string2)
