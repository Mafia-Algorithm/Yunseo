import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    // col번째 컬럼 값 기준 오름차순, 기본 키 기준 내림차순
    var data = data.sorted{
        if $0[col-1] == $1[col-1] {
            return $0[0] > $1[0]
        }
        return $0[col-1] < $1[col-1]
    }

    // i번째 행: 각 컬럼의 값을 i로 나눈 나머지들의 합
    var si = [Int]()
    (row_begin...row_end).forEach{i in 
        si.append(data[i-1].map{$0 % i}.reduce(0, +))
    }
    
    // s_i값을 누적하여 XOR한 값을 반환
    return si.reduce(0, ^)
}
