import UIKit
import Foundation

var str = "Hello, playground"

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }
            dict[num] = i
        }
        fatalError("No valid outputs")
    }
}
let result = Solution().twoSum([2,7,11,15], 9)
print("result is : \(result)")


//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
class ListNode {
    
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
}

class Solution1 {
    func getValFromNode(_ node:ListNode?) -> Int {
        if node == nil {
            return 0
        }
        else {
            return node!.value
        }
    }
    
    func getNextNode(_ node:ListNode?) ->ListNode? {
        if node != nil {
            return node!.next
        }
        else {
            return nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if(l1==nil)&&(l2==nil) {
            return nil
        }
        
        var ll1 = l1
        var ll2 = l2
        
        let head = ListNode(value: 0)
        var point = head
        var carry = 0
        
        while (ll1 != nil) || (ll2 != nil) || carry != 0 {
            let total = getValFromNode(ll1) + getValFromNode(ll2) + carry
            point.value = total % 10
            carry = total / 10
            
            ll1 = getNextNode(ll1)
            ll2 = getNextNode(ll2)
            if ll1 != nil || ll2 != nil || carry != 0 {
                point.next = ListNode(value: 0)
                point = point.next!
            }
        }
        
        return head
    }
}

class LinkedList {
    
    let head: ListNode
    
    init(node: ListNode) {
        self.head = node
    }
    
    convenience init(nodeValue: Int) {
        self.init(node: ListNode(value: nodeValue))
    }
    
    func addNode(node: ListNode) {
        var current: ListNode = self.head
        while current.next != nil {
            current = current.next!
        }
        current.next = node
    }
    
    func addNode(withValue value: Int) {
        self.addNode(node: ListNode(value: value))
    }
    
    func traverse() -> [Int]{
        var results: [Int] = []
        var current: ListNode = self.head
        while current.next != nil {
            current = current.next!
            results.append(current.value)
        }
        return results
    }
    
    func getValFromNode(_ node:ListNode?) -> Int {
        if node == nil {
            return 0
        }
        else {
            return node!.value
        }
    }
    
    func getNextNode(_ node:ListNode?) ->ListNode? {
        if node != nil {
            return node!.next
        }
        else {
            return nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if(l1==nil)&&(l2==nil) {
            return nil
        }
        
        var ll1 = l1
        var ll2 = l2
        
        let head = ListNode(value: 0)
        var point = head
        var carry = 0
        
        while (ll1 != nil) || (ll2 != nil) || carry != 0 {
            let total = getValFromNode(ll1) + getValFromNode(ll2) + carry
            point.value = total % 10
            carry = total / 10
            
            ll1 = getNextNode(ll1)
            ll2 = getNextNode(ll2)
            if ll1 != nil || ll2 != nil || carry != 0 {
                point.next = ListNode(value: 0)
                point = point.next!
            }
        }
        
        return head
    }
    
}

let list1 = LinkedList(nodeValue: 2)
list1.addNode(withValue: 4)
list1.addNode(withValue: 3)
list1.traverse()
let list2 = LinkedList(nodeValue: 2)
list2.addNode(withValue: 4)
list2.addNode(withValue: 3)
list2.traverse()

let numbers1 = ListNode(value: 2)
numbers1.next?.value = 4
numbers1.next?.value = 3

let numbers2 = ListNode(value: 5)
numbers2.next?.value = 6
numbers2.next?.value = 4

//let result2 = Solution1().addTwoNumbers(numbers1, numbers2)
let result2 = Solution1().addTwoNumbers(numbers1, numbers2)


private extension String {
    
    func randomAccessCharactersArray() -> [Character] {
        return Array(self)
    }
}

struct Medium {
    // t = O(N), s = O(1)
    static func longest(_ s: String) -> Int {
        let charArr = s.randomAccessCharactersArray()
        let len = charArr.count
        if len <= 1 {
            return len
        } else {
            var tmpMaxLen = 1
            var maxLen = 1
            var hashMap = Dictionary<Character, Int>()
            hashMap[charArr[0]] = 0
            for i in 1..<len {
                if let lastPosition = hashMap[charArr[i]] {
                    if lastPosition < i - tmpMaxLen {
                        tmpMaxLen += 1
                    } else {
                        tmpMaxLen = i - lastPosition
                    }
                } else {
                    tmpMaxLen += 1
                }
                hashMap[charArr[i]] = i
                if tmpMaxLen > maxLen {
                    maxLen = tmpMaxLen
                }
            }
            return maxLen
        }
    }
}
let n = Medium.longest("ahmed")
print(n)

class Solution3 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var i1 = nums1.startIndex
        var i2 = nums2.startIndex
        var resultArr = Array<Int>()
        while i1 < nums1.endIndex && i2 < nums2.endIndex {
            let num1 = nums1[i1]
            let num2 = nums2[i2]
            if num1 < num2 {
                resultArr.append(num1)
                i1 = nums1.index(i1, offsetBy: 1)
            } else {
                resultArr.append(num2)
                i2 = nums2.index(i2, offsetBy: 1)
            }
        }
        if i1 < nums1.endIndex {
            resultArr += nums1[i1..<nums1.endIndex]
        }
        if i2 < nums2.endIndex {
            resultArr += nums2[i2..<nums2.endIndex]
        }
        let midIndex = resultArr.index(resultArr.startIndex, offsetBy: (resultArr.count - 1) / 2)
        return resultArr.count % 2 == 0
            ? Double(resultArr[midIndex] + resultArr[resultArr.index(midIndex, offsetBy: 1)]) / 2
            : Double(resultArr[midIndex])
    }
}

let m = Solution3().findMedianSortedArrays([1,2,3], [4])
print(m)

private extension String {
    subscript (range: Range<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex)!])
    }
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray2() -> [Character] {
        return Array(self)
    }
}

struct Medium2 {
    // t = O(N^2), s = O(1)
    static func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        var startIndex: Int = 0
        var maxLen: Int = 1
        var i = 0
        let charArr = s.randomAccessCharactersArray2()
        while i < s.count {
            guard s.count - i > maxLen / 2 else {
                break
            }
            var j = i
            var k = i
            while k < s.count - 1 && charArr[k+1] == charArr[k] {
                k += 1
            }
            i = k + 1
            while k < s.count - 1 && j > 0 && charArr[k+1] == charArr[j-1] {
                k += 1
                j -= 1
            }
            let newLen = k - j + 1
            if newLen > maxLen {
                startIndex = j
                maxLen = newLen
            }
        }
        return String(charArr[startIndex ..< (startIndex + maxLen)])
    }
}

let m2 = Medium2.longestPalindrome("abbabbabb")
print(m2)

struct Easy_006_ZigZag_Conversion {
    // t = O(N), s = O(N)
    static func convert(s: String, nRows: Int) -> String {
        var arr = Array<String>(repeating: String(), count: nRows)
        var i = 0
        let charArr = s.randomAccessCharactersArray()
        let len = charArr.count
        while i < len {
            var index = 0
            while index < nRows && i < len {
                arr[index].append(charArr[i])
                i += 1
                index += 1
            }
            index = nRows - 2
            while index > 0 && i < len {
                arr[index].append(charArr[i])
                i += 1
                index -= 1
            }
        }
        var res = String()
        for i in 0 ..< nRows {
            res += arr[i]
        }
        return res
    }
}

let z = Easy_006_ZigZag_Conversion.convert( s: "PAYPALISHIRING", nRows: 4)
print(z)

//class Solution4 {
//    func reverse(x: Int) -> Int {
//        //var xx = x
//        var rev_num = 0
//
//        while x > 0 {
//            rev_num = rev_num * 10 + x % 10
//            //rev_num = rev_num / 10
//        }
//        return rev_num
//
//}
//}
//let r = Solution4().reverse(x: 1234)
//print(r)

class Soluion5 {
    func reverse(_ x: Int) -> Int {
        var xx = x
        //var n = 45
        
        var reverse: Int = 0
        
        while (xx != 0) {
            
            reverse = reverse * 10
            
            reverse = reverse + xx % 10
            
            xx = xx / 10
            
        }
        return reverse
    }
}
let r = Soluion5().reverse(1234)
print(r)


class Solution6 {
    func myAtoi(_ str: String) -> Int {
        var num: Int? = nil
        var isMinus: Bool? = nil
        
        for a in str {
            let s = String(a)
            if num == nil && isMinus == nil && (s == " " || s == "-" || s == "+"){
                if s == "-" || s == "+" {
                    isMinus = s == "-"
                }
                continue
            }
            if let i = Int(s){
                let ii = (isMinus ?? false) ? i * -1 : i
                if (num ?? 0) > 214748364 || (num == 214748364 && ii > 7) {
                    return 2147483647
                }
                if (num ?? 0) < -214748364 || (num == -214748364 && ii < -8) {
                    return -2147483648
                }
                num = (num ?? 0) * 10 + ii
            }else{
                break
            }
        }
        return num ?? 0
    }
}
let sTi = Solution6().myAtoi("1234")
print(sTi)

class Solution7 {
    func isPalindrome(_ x: Int) -> Bool {
        let xx = String(x)
        let len = xx.count / 2
        
        for i in 0..<len
        {
            let start = xx.index(xx.startIndex, offsetBy: i)
            let end = xx.index(xx.endIndex, offsetBy: (i * -1) - 1)
            if xx[start] != xx[end] {
                return false
            }
        }
        return true
    }
    
}
let p = Solution7().isPalindrome(-121)
print(p)

//extension String {
//
//    func contains(find: String) -> Bool{
//       return self.rangeOfString(find) != nil
//     }
//
//    func containsIgnoringCase(find: String) -> Bool{
//       return self.rangeOfString(find, options: NSStringCompareOptions.CaseInsensitiveSearch) != nil
//     }
//}

class Solution8 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        
        
        //        if (s.contains(".") || s.contains("*") && (s.range(of: s) != nil)) || ((p.contains("*") || p.contains(".") && p.contains("*") || p.contains(".") )) && (p.range(of: p) != nil) {
        //            return true
        //        }
        //            return false
        
        if s.contains(".") || s.contains("*") {
            return true
        }else if p.contains(".") || p.contains("*") {
            return true
        }else if (s.contains(".") || s.contains("*") && (s.range(of: s) != nil)) {
            return true
        }else if (p.contains(".") || p.contains("*") && (p.range(of: p) != nil)) {
            return true
        }
        
        return false
    }
}
let mm = Solution8().isMatch("aa", "a")
print(mm)


class Solution9 {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var start = 0
        var end = height.count - 1
        
        while start < end {
            if height[start] < height[end]{
                maxArea = max(maxArea, height[start] * (end - start))
                start += 1
            } else {
                maxArea = max(maxArea, height[end] * (end - start))
                end -= 1
            }
        }
        
        return maxArea
    }
}
let ma = Solution9().maxArea([4,3,2,1,4])
print(ma)

class Solution10 {
    func roman(number: Int) -> String
    {
        //let decimals = [1000, 500, 100, 50, 10, 5, 1]
        let decimals = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        //let numerals = ["M", "D", "C", "L", "X", "V", "I"]
        let numerals = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        //[(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
        
        var result = ""
        var number = number
        
        while number > 0
        {
            for (index, decimal) in decimals.enumerated()
            {
                if number - decimal >= 0 {
                    number -= decimal
                    result += numerals[index]
                    break
                }
            }
        }
        
        return result
    }
    
}
let cRTI = Solution10().roman(number: 4)
print(cRTI)


class Solution11 {
    func romanToInt(_ s: String) -> Int {
        let charcters = [Character](s)
        var result: Int = 0
        
        if let first = charcters.first { // take the first number
            result = romaonCharToInt(first)
        }
        for index in 1 ..< charcters.count {
            let current = romaonCharToInt(charcters[index])
            let pre = romaonCharToInt(charcters[index - 1])
            if current <= pre {
                result += current
            }else {
                //If it is greater than the previous number, we add the current number minus twice the previous number, so that we can subtract the multi-addition in the previous cycle.
                result = result - pre * 2 + current;
            }
        }
        return result
    }
    
    func romaonCharToInt(_ c: Character) -> Int {
        let char = c
        switch(char) {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            return 0
        }
    }
    
}
let rTI = Solution11().romanToInt("III")
print(rTI)

class Solution12 {
        func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.count == 0{
                return ""
            }else if strs.count == 1 {
                return strs.first!
            }else{
                var result = ""
                for (index, a) in strs.first!.enumerated() {
                    for str in strs[1..<strs.count] {
                        if index < str.count {
                            if a != str[str.index(str.startIndex, offsetBy: index)] {
                                return result
                            }
                        }else{
                            return result
                        }
                    }
                    result.append(a)
                }
                return result
            }
        }
        func longestCommonPrefix1(_ strs: [String]) -> String {
            if strs.count == 0{
                return ""
            }else if strs.count == 1 {
                return strs.first!
            }else{
                var result = strs[0]
                for i in 1..<strs.count {
                    let str = strs[i]
                    while !str.hasPrefix(result) {
                        result = String(result.prefix(result.count - 1))
                        if result.isEmpty {
                            return ""
                        }
                    }
                }
                return result
            }
        }
    }

let lcp = Solution12().longestCommonPrefix(["flower","flow","flight"])
print(lcp)

class Solution13 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var resNums = [[Int]]()
        if nums.count < 3 {
            return resNums
        }
        
        let sortedNums = nums.sorted()
        
        for i in 0...sortedNums.count - 1 {
            if ((i > 0) && (sortedNums[i] == sortedNums[i - 1])) {
                continue
            }
            var left = i + 1
            var right = sortedNums.count - 1
            let first = sortedNums[i]
            while right > left {
                let second = sortedNums[left]
                let third = sortedNums[right]
                let sum = first + second + third
                if sum < 0 {
                    left += 1
                }
                else if sum > 0 {
                    right -= 1
                }
                else {
                    if ((left - 1 > i) && (sortedNums[left] == sortedNums[left - 1])) {
                        left += 1
                    }
                    else {
                        resNums.append([first,second,third])
                        left += 1
                    }
                }
            }
        }
        
        return resNums
    }
}
let threeSum = Solution13().threeSum([-1,0,1,2,-1,-4])
print(threeSum)

class Solution14 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        var result = nums[0] + nums[1] + nums[2]
        var diff = abs(result - target)

        for (index, num) in sortedNums.enumerated() {
            var start = index + 1
            var end = sortedNums.count - 1

            while start < end {
                var sum = num + sortedNums[start] + sortedNums[end]
                guard sum != target else {
                    return target
                }
                let newDiff = abs(sum - target)
                if newDiff < diff {
                    diff = newDiff
                    result = sum
                }
                if sum > target {
                    end -= 1
                } else {
                    start += 1
                }
            }
        }

        return result
    }
}
let threeSumClosest = Solution14().threeSumClosest([-1, 1, 2, 4], 1)
print(threeSumClosest)

class Solution15 {
    func mapIntToLetter(start: Int, end: Int) -> Dictionary<Int, [Character]> {
        let lowerLetters = Array("abcdefghijklmnopqrstuvwxyz")
        var result = Dictionary<Int, [Character]>()
        var count = 0

        for num in start...end {
            let offset = num == 7 || num == 9 ? 4 : 3
            result[num] = Array(lowerLetters[count..<(count + offset)])
            count += offset
        }
        return result
    }

    func letterCombinations(_ digits: String) -> [String] {
        let dict = mapIntToLetter(start: 2, end: 9)
        var result = [String]()

        for char in digits {
            let letters = dict[Int(String(char))!, default: [Character]()]
            if result.count == 0 {
                result = letters.map { String($0) }
                continue
            }
            var newResult = [String]()
            for letter in letters {
                for existStr in result {
                    newResult.append("\(existStr)\(letter)")
                }
            }
            result = newResult
        }
        return result
    }
}

let lc = Solution15().letterCombinations("23")
print(lc)

extension Collection where Element: Equatable {
  
  /// In a sorted collection, replaces the given index with a successor mapping to a unique element.
  ///
  /// - Parameter index: A valid index of the collection. `index` must be less than `endIndex`
  func formUniqueIndex(after index: inout Index) {
    var prev = index
    repeat {
      prev = index
      formIndex(after: &index)
    } while index < endIndex && self[prev] == self[index]
  }
}


class Solution16 {
    
    func fourSum<T: BidirectionalCollection>(_ collection: T, target: T.Element) -> [[T.Element]] where T.Element: Numeric & Comparable {
      let sorted = collection.sorted()
      var ret: [[T.Element]] = []
      
      var l = sorted.startIndex
        FourSum: while l < sorted.endIndex { defer { sorted.formUniqueIndex(after: &l) }
        var ml = sorted.index(after: l)
        
            ThreeSum: while ml < sorted.endIndex { defer { sorted.formUniqueIndex(after: &ml) }
          var mr = sorted.index(after: ml)
          var r = sorted.index(before: sorted.endIndex)
          
          TwoSum: while mr < r && r < sorted.endIndex {
            let sum = sorted[l] + sorted[ml] + sorted[mr] + sorted[r]
            if sum == target {
              ret.append([sorted[l], sorted[ml], sorted[mr], sorted[r]])
                sorted.formUniqueIndex(after: &mr)
                sorted.formUniqueIndex(after: &r)
            } else if sum < target {
                sorted.formUniqueIndex(after: &mr)
            } else {
                sorted.formUniqueIndex(after: &r)
            }
          }
        }
      }
      return ret
    }
    
}
let fourSum = Solution16().fourSum([1,0,-1,0,-2,2], target: 0)
print(fourSum)


class Solution17 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let node = head, n > 0 else {
            return nil
        }
        var listNode = node
        var slowNode = node
        var fastIndex = 0
        var slowIndex = 0

        while listNode.next != nil {
            if fastIndex >= n {
                slowIndex += 1
                slowNode = slowNode.next!
            }
            fastIndex += 1
            listNode = listNode.next!
        }
        if n == fastIndex + 1 {
            return slowNode.next
        }
        slowNode.next = slowNode.next?.next
        return node
    }
}
let no = ListNode(value: 1)
no.value = 2
no.value = 3
no.value = 4
no.value = 5
let rNTHFE = Solution17().removeNthFromEnd(no, 2)
//print(rNTHFE!)

class Solution18 {
    let charMap: [Character:Character] = [
        "}": "{",
        ")": "(",
        "]": "["
    ]

    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            let c = charMap[char]
            if c == nil {
                stack.append(char)
            } else {
                if stack.popLast() != c {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}
let ch = Solution18().isValid("()")
print(ch)

class Solution19 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2

        let head: ListNode = ListNode(value: 0)
        var tmp = head
        while list1 != nil && list2 != nil {
            let v1 = list1!.value
            let v2 = list2!.value

            if v1 > v2 {
                tmp.next = list2!
                list2 = list2?.next
            } else {
                tmp.next = list1!
                list1 = list1?.next
            }
            tmp = tmp.next!
        }
        tmp.next = list1 ?? list2
        return head.next
    }
}

class Solution20 {
     func helper(arr: inout [String], str: String, n: Int, m: Int) {
            if m == 0 && n == 0 {
                arr.append(str)
                return
            }
            if m > 0 {
                helper(arr: &arr, str: str + ")", n: n, m: m-1)
            }
            if n > 0 {
                helper(arr: &arr, str: str + "(", n: n-1, m: m+1)
            }
        }
         func generateParenthesis(_ n: Int) -> [String] {
            var arr: [String] = []
            helper(arr: &arr, str: "", n: n, m: 0)
            return arr
        }
}
let g = Solution20().generateParenthesis(3)
print(g)

class Solution21 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
            var lists = lists
            
            switch lists.count {
            case 0:
                return nil
            case 1:
                return lists[0]
            case 2:
                return mergeTwoLists(lists[0], lists[1])
            default:
                let mid = lists.count/2
                return mergeTwoLists(mergeKLists(Array(lists[0...mid])), mergeKLists(Array(lists[(mid+1)...(lists.count-1)])))
            }
        }
        
        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            // Original list recursive
            if l1 == nil {
                return l2
            }
            if l2 == nil {
                return l1
            }
                     // Each time take the smallest of the two linked lists to the head
            if l1!.value < l2!.value {
                l1?.next = mergeTwoLists(l1!.next, l2)
                return l1
            }else{
                l2?.next = mergeTwoLists(l1, l2!.next)
                return l2
            }
        }
}



func MatrixChallenge(_ strArr: [String]) -> String {

  // code goes here
  // Note: feel free to modify the return type of this function
  var nRows = 0
  nRows = strArr.count
    var res = ""
    for i in 0 ..< nRows {
            res += strArr[i]
        }
        return res
  for matrix in strArr {
    
    strArr.joined(separator: " , ")
    //strArr.split(whereSeparator: "  ")
//    var res = matrix
//    for i in 0 ..< nRows {
//            res += strArr[i]
//        }
//        return res

  }
  
  
  return strArr[0]

}
let gh = MatrixChallenge(["aaaa","bbbb","cccc","vvvv"])
//gh.replacingOccurrences(of: ",", with: "\n")
print(gh.replacingOccurrences(of: ",", with: "-"))



