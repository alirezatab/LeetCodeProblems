enum Brackets: Character {
    case openSquare = "["
    case closeSquare = "]"
    case openParent = "("
    case closeParent = ")"
    case openBracket = "{"
    case closeBracket = "}"
}

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count != 0 else {return true}
        
        var stack = [Character]()
        
        for char in s {
            // better to use enums
            if stack.isEmpty && (char == Brackets.closeBracket.rawValue ||
                char == Brackets.closeSquare.rawValue ||
                char == Brackets.closeParent.rawValue) {
                return false
            }
            
            if char == Brackets.openBracket.rawValue ||
                char == Brackets.openSquare.rawValue ||
                char == Brackets.openParent.rawValue {
                
                stack.append(char)
            } else if stack.last == Brackets.openBracket.rawValue &&
                char == Brackets.closeBracket.rawValue {
                stack.removeLast()
            } else if stack.last == Brackets.openParent.rawValue &&
                char == Brackets.closeParent.rawValue {
                stack.removeLast()
            } else if stack.last == Brackets.openSquare.rawValue &&
                char == Brackets.closeSquare.rawValue {
                stack.removeLast()
            } else {
                return false
            }
        }
        return stack.count == 0 ? true : false
    }
}
