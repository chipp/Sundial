//
//  Utils.swift
//  Sundial
//
//  Created by Sergei Mikhan on 10/4/17.
//  Copyright © 2017 Netcosports. All rights reserved.
//

import UIKit

extension UIColor {

  func blended(with color: UIColor, progress: CGFloat) -> UIColor {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    var red2: CGFloat = 0
    var green2: CGFloat = 0
    var blue2: CGFloat = 0
    var alpha2: CGFloat = 0
    color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)

    let part = (1 - progress)
    return UIColor(red: red * part + red2 * progress,
                   green: green * part + green2 * progress,
                   blue: blue * part + blue2 * progress,
                   alpha: alpha * part + alpha2 * progress)
  }
}

extension Array {

  subscript(safe index: Index) -> Element? {
    get { return indices ~= index ? self[index] : nil }
    set {
      guard indices ~= index else { return }
      guard let newValue = newValue else { return }
      remove(at: index)
      insert(newValue, at: index)
    }
  }

  var last: Element? {
    get { return self[safe: self.index(before: endIndex)] }
    set { self[safe: self.index(before: endIndex)] = newValue }
  }
}

extension String {

  func width(with font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: [.usesFontLeading, .usesLineFragmentOrigin],
                                        attributes: [NSAttributedStringKey.font: font],
                                        context: nil)

    return boundingBox.width
  }

  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: [.usesFontLeading, .usesLineFragmentOrigin],
                                        attributes: [NSAttributedStringKey.font: font],
                                        context: nil)

    return boundingBox.height
  }
}
