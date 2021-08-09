import UIKit

struct Edit {
    var like: Int
    
    mutating func plus() {
        like += 1
    }
}
var like1 = Edit(like: 1)
like1.like
var like3 = like1
like3
like1.like = 3
print(like1.like)
like3.like

class Edite {
    var like: Int
    init(like: Int) {
        self.like = like
    }
    
    func plus() {
        like += 1
    }
}
var like2 = Edite(like: 1)
like2.like
var like4 = like1
like4
like2.like = 3
print(like1.like)
like4.like
