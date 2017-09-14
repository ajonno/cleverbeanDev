
import UIKit

extension UITextField {
	public var substituteFontName : String {
		get {
			return self.font?.fontName ?? "";
		}
		set {
			let fontNameToTest = self.font?.fontName.lowercased() ?? "";
			var fontName = newValue;
			if fontNameToTest.range(of: "bold") != nil {
				fontName += "-Bold";
			} else if fontNameToTest.range(of: "extrabold") != nil {
				fontName += "-ExtraBold";
			} else if fontNameToTest.range(of: "semibold") != nil {
				fontName += "-SemiBold";
			} else if fontNameToTest.range(of: "black") != nil {
				fontName += "-Black";
			} else if fontNameToTest.range(of: "medium") != nil {
				fontName += "-Medium";
			} else if fontNameToTest.range(of: "regular") != nil {
				fontName += "-Regular";
			} else if fontNameToTest.range(of: "thin") != nil {
				fontName += "-Thin";
			} else if fontNameToTest.range(of: "light") != nil {
				fontName += "-Light";
			} else if fontNameToTest.range(of: "ultralight") != nil {
				fontName += "-ExtraLight";
			}
			self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
		}
	}
}
