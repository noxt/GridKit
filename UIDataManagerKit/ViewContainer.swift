//
//  ViewContainer.swift
//  UIDataManagerKit
//
//  Created by Dmitry Ivanenko on 19.09.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public protocol ContainerConfigurable {
  func configure()
}


public protocol ContainerActionable {
  func invoke(_ action: ViewContainerActionType) -> Any?
}


public protocol Container: ContainerConfigurable, ContainerActionable {
  var view: UIView { get set }
}


public class ViewContainer<ViewType: UIView>: Container where ViewType: Configurable {
  
  public var view: UIView = ViewType()
  internal let item: ViewType.ItemType
  fileprivate lazy var actions = [String: ViewContainerAction<ViewType>]()
  
  public init(item: ViewType.ItemType, actions: [ViewContainerAction<ViewType>]? = nil) {
    self.item = item
    actions?.forEach { self.actions[$0.type.key] = $0 }
  }
  
  // MARK: - ContainerConfigurable
  
  public func configure() {
    (view as! ViewType).configure(with: self.item)
  }
  
  
  // MARK: - ContainerActionable
  
  public func invoke(_ action: ViewContainerActionType) -> Any? {
    return actions[action.key]?.invoke(item: item, view: view as? ViewType)
  }
  
}
