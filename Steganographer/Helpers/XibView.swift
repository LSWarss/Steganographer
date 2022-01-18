//
//  XibView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 11/12/2021.
//

import UIKit

public class XibView: UIView {

    public var xibName: String { String(describing: type(of: self)) }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(xibName)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup(xibName)
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup(xibName)
    }

    public override var intrinsicContentSize: CGSize {
        return subviews.first?.intrinsicContentSize ?? super.intrinsicContentSize
    }

}

public class XibControl: UIControl {

    public var xibName: String { String(describing: type(of: self)) }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(xibName)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup(xibName)
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup(xibName)
    }

    public override var intrinsicContentSize: CGSize {
        return subviews.first?.intrinsicContentSize ?? super.intrinsicContentSize
    }
}

public class XibHeaderFooterView: UITableViewHeaderFooterView {

    public var xibName: String { String(describing: type(of: self)) }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        xibSetup(xibName)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup(xibName)
    }

    public override var intrinsicContentSize: CGSize {
        return subviews.first?.intrinsicContentSize ?? super.intrinsicContentSize
    }
}

public class XibCollectionReusableView: UICollectionReusableView {

    public var xibName: String { String(describing: type(of: self)) }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(xibName)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup(xibName)
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup(xibName)
    }

    public override var intrinsicContentSize: CGSize {
        return subviews.first?.intrinsicContentSize ?? super.intrinsicContentSize
    }
}

private extension UIView {

    func xibSetup(_ xibName: String) {
        guard let view = loadViewFromNib(xibName) else { return }
        addSubview(view)
        view.pinToView(self)
    }

    func loadViewFromNib(_ xibName: String) -> UIView? {
        let nibName = xibName
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first { $0 is UIView } as? UIView
    }

}
