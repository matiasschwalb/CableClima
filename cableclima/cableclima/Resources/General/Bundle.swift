//
//  Bundle.swift
//  cableclima
//
//  Created by Matias David Schwalb on 21/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /**
     Loads a nib from the bundle.
     
     - parameter nibName: Contains a StringRepresentable nib.
     - returns: The loaded NibType or .none if it don't exists.
     - seealso: loadNibNamed()
     - warning: This may through an ObjC NSException if there is no
     nib with that name in that bundle.
     */
    func loadNib<NibType, T: RawRepresentable>(named nibName: T) -> NibType? where T.RawValue == String {
        return loadNibNamed(nibName.rawValue, owner: self, options: .none)?[0] as? NibType
    }
    
    /**
     Returns the value associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The value associated with key in the receiver's property
     list (Info.plist) as Any or .none if the key doesn't exist.
     - seealso: object(forInfoDictionaryKey:) and String(describing:)
     */
    subscript(key: String) -> Any? {
        return get(from: key)
    }
    
    /**
     Returns the string associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The string associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not a string or if it's an empty string.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getString(from key: String) -> String? {
        let string: String? = get(from: key)
        return (string?.isEmpty ?? true) ? .none : string
    }
    
    /**
     Returns the integer associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The integer associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not an integer.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getInt(from key: String) -> Int? {
        return get(from: key)
    }
    
    /**
     Returns the float number associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The float associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not not a real number.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getFloat(from key: String) -> Float? {
        return get(from: key)
    }
    
    /**
     Returns the date associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The date associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not a date.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getDate(from key: String) -> Date? {
        return get(from: key)
    }
    
    /**
     Returns the data associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The data associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not data.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getData(from key: String) -> Data? {
        return get(from: key)
    }
    
    /**
     Returns the array associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The array associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not an array of elements
     of type T.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getArray<T>(from key: String) -> [T]? {
        return get(from: key)
    }
    
    /**
     Returns the dictionary associated with the specified key in the receiver's
     information property list (Info.plist).
     
     - parameter key: A key in the bundle's property list.
     - returns: The dictionary associated with key in the receiver's property list (Info.plist)
     or .none if the key doesn't exist or if the value is not a dictionary of
     keys of type K and values of type V.
     - seealso: object(forInfoDictionaryKey:)
     */
    func getDictionary<V>(from key: String) -> [String: V]? {
        return get(from: key)
    }
    
}

fileprivate extension Bundle {
    
    func get<T>(from key: String) -> T? {
        let optionalAny = object(forInfoDictionaryKey: key)
        let optionalValue: T? = optionalAny.flatMap { $0 as? T }
        return optionalValue
    }
    
}

extension String: RawRepresentable {
    
    public init?(rawValue: String) {
        self = rawValue
    }
    
    public var rawValue: String {
        return self
    }
    
}
