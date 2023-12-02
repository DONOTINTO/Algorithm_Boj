//다시 실행하고 싶은 문제는 Solved 파일 내 문제를 복사하여 이곳(main.swift)에 붙여놓고 실행
/*
 [Boj-10699]
 서울의 오늘 날짜를 출력하는 프로그램을 작성하시오.
 
 [INPUT]
 x
 
 [OUTPUT]
 서울의 오늘 날짜를 "YYYY-MM-DD" 형식으로 출력한다.
 
 */

import Foundation

var formatter = DateFormatter()
formatter.locale = Locale(identifier: "ko_KR")
formatter.timeZone = TimeZone(abbreviation: "KST")
formatter.dateFormat = "yyyy-MM-dd-HH"
print(formatter.string(from: Date()))
