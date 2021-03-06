struct InverseSuffixIterator: IteratorProtocol {
    
    let string:String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = String(string.reversed())
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> String? {
        guard offset < last else {
            return nil
        }
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return String(sub.reversed())
    }
}

struct InverseSuffixSequence: Sequence {
    let string:String
    
    func makeIterator() -> InverseSuffixIterator {
        return InverseSuffixIterator(string: string)
    }
}
