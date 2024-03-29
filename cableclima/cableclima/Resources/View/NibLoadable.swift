//
//  NibLoadable.swift
//  cableclima
//
//  Created by Matias David Schwalb on 20/09/2019.
//  Copyright © 2019 Matias David Schwalb. All rights reserved.
//

import Foundation
import UIKit

/*
 Represents an object which is loaded from a nib.
 */
public protocol NibLoadable {
    
    /**
     Name of Nib to load component from.
     By default, the type's simple name.
     */
    static var nibName: String { get }
    
    /**
     Bundle from where to load the nib.
     By default, the main bundle;
     except for classes, it defaults to the class' bundle.
     */
    static var nibBundle: Bundle { get }
    
}

public extension NibLoadable {
    
    static var nibName: String {
        return SimpleName(ofType: self)
    }
    
    static var nibBundle: Bundle {
        if let classSelf = self as? AnyClass {
            return Bundle(for: classSelf.self)
        }
        return Bundle.main
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nibBundle)
    }
    
    /**
     Loads the nib for the specific component.
     
     - warning: This may through an ObjC NSException if there is no
     nib with that name in that bundle.
     - seealso: Bundle.loadNib(named:)
     */
    static func loadFromNib<T>() -> T? {
        return nibBundle.loadNib(named: nibName)
    }
    // Using generics because using Self makes it impossible to
    //   provide default implementations for non-final classes.
    
}
