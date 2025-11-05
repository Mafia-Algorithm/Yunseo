// 2810 - 컵홀더

// 한 줄에 N개의 좌석
// 인접한 좌석 사이 컵홀더 1개씩 존재
// 양 끝 좌석에는 컵홀더 1개씩 더 존재
// * 0 * 0 * 0 * 0 * 0 *

// ! 커플석 사이에는 컵홀더 없음
// 컵홀더에 컵을 꽂을 수 있는 최대 사람 수
// S는 일반, L은 커플석

// *S*LL*LL*S*S*LL*
// S0 L0 L0 L L0 S0 S0 L L0

// 커플석이 없을 땐 모두 홀더에 꽂을 수 있음
// 커플석이 존재할 때
// * S * L L * -> 1커플일 때 0명 못함
// * S * L L * L L * -> 2커플일 때 한 명 못 함
// * S * L L * S * L L * -> 중간에 일반석 있어도 커플 연석과 같음
// (* L) (L *) L (L *) L (L *) -> 3커플일 때 2명 못 함

// 1. LL 커플좌석수 찾기
// 2. S는 무조건 꽂을 수 있음
// 3. LL 좌석 수 - 1만큼 꽂지 못함

import Foundation

let N = Int(readLine()!)!
let seats = readLine()!

var fail = (seats.filter{ $0 == "L" }.count / 2)
if fail > 0 { fail -= 1 }
print(N - fail)

