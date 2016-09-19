//
//  Configurable.swift
//  UIDataManagerKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public protocol Configurable {
  associatedtype ItemType
  func configure(with _: ItemType)
}
