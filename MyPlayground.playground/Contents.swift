import UIKit

class Author {
    var book: Book?
}

class Book {
    var numberOfPages = 100
}

let john = Author()
john.book = Book()

var pages: Int = john.book!.numberOfPages
print("\(pages)")

john.book = nil
pages = john.book?.numberOfPages

print("\(pages)")
