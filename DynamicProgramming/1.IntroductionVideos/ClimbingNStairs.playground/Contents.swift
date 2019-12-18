/**
 A child is trying to climb a staircase. The maximum number of steps he can climb at a time is two or one.
 If there are n steps in total in how many ways can he climb the staircase
 */

func steps(n: Int) {
   var f:[Int] = [Int](repeating: 1, count: 3)
   f[2] = 2
   print(f[1])
   print(f[2])
   
   for i in 3..<n {
       f[i%3] = f[(i-1)%3] + f[(i-2)%3]
       print(f[i%3])
   }
}

steps(n: 10)
