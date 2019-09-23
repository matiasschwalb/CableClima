//
//  General.swift
//  cableclima
//
//  Created by Matias David Schwalb on 21/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(String)
}

/**
 Returns the type's simple name.
 That is to say:
 without scope prefixes,
 without properties' values if it's a struct.
 */
public func SimpleName(ofType type: Any.Type) -> String {
    return String(describing: type).components(separatedBy: ".").last!
}

/**
 Returns the concrete type's simple name.
 That is to say:
 without scope prefixes,
 without properties' values if it's a struct.
 
 - seealso: type(of:)
 */
public func SimpleName<T>(of element: T) -> String {
    return SimpleName(ofType: type(of: element as Any))
    // Using as Any to get dynamic type for cases like protocol conforming types.
}

/**
 Returns the concatenation of the given NSAttributedStrings
 */
public func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}

/**
 Convenience method to grab the main thread and perform closure
 
 - Parameter closure: the closure to execute
 
 For more information on why do we need to use this see:
 https://medium.com/@johnsundell/reducing-flakiness-in-swift-tests-5942e5677394
 */
func performUIUpdate(using closure: @escaping () -> Void) {
    // If we are already on the main thread, execute the closure directly
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.async(execute: closure)
    }
}
