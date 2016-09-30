//
//  ViewContainerAction.swift
//  GridKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public enum ViewContainerActionType {
  
  case custom(String)
  
  var key: String {
    switch (self) {
    case .custom(let key):
      return key
    }
  }
  
}


public class ViewContainerActionData<ViewType: Configurable> {
  public let item: ViewType.ItemType
  public let view: ViewType?
  
  init(item: ViewType.ItemType, view: ViewType?) {
    self.item = item
    self.view = view
  }
}


public class ViewContainerAction<ViewType: Configurable> {

  public let type: ViewContainerActionType
  fileprivate let handler: ((_ data: ViewContainerActionData<ViewType>) -> Any?)
  
  public init<T>(_ type: ViewContainerActionType, handler: @escaping (_ data: ViewContainerActionData<ViewType>) -> T) {
    self.type = type
    self.handler = handler
  }

  func invoke(item: ViewType.ItemType, view: ViewType?) -> Any? {
    return handler(ViewContainerActionData(item: item, view: view))
  }
  
}
