import Foundation

public final class UnsafeInteriorMutable<T: Sendable>: @unchecked Sendable {
	private var value: T?

	public init() {}

	public func set(_ value: T) {
		self.value = value
	}

	public func get() -> T? {
		return value
	}

	public func lazy(_ closure: () -> T?) -> T? {
		if case let .some(wrapped) = value {
			return wrapped
		}

		if let newValue = closure() {
			value = newValue
			return newValue
		}

		return nil
	}
}
