//
//  UIBlockingProgressHUD.swift
//  ImageFeed_8_sprint
//
//  Created by Марат Хасанов on 12.10.2023.
//

import ProgressHUD
import UIKit

final class UIBlockingProgressHUD {
    private static var window: UIWindow? {
        return UIApplication.shared.windows.first
    }
    public static func show() {
        window?.isUserInteractionEnabled = false
        ProgressHUD.show()
    }
    static func dismiss() {
        window?.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
}
