//
//  View+Mutating.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/6/25.
//

import SwiftUI

/// A helper extension that allows mutation of view properties within immutable SwiftUI view structs.
///
/// This utility enables modifying a specific property on a copy of a `View`,
/// effectively creating a new instance with the updated value.
/// It’s particularly useful for creating view modifier–like APIs that mutate internal
/// configuration values (e.g., updating size, color, or style properties).
///
/// Example:
/// ```swift
/// struct MyView: View {
///     private var color: Color = .blue
///
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(color)
///     }
///
///     func viewColor(_ color: Color) -> some View {
///         mutating(keyPath: \.color, value: color)
///     }
/// }
/// ```
///
/// - Important: This function should only be used for creating *modifier-style* APIs in value types
///   (like SwiftUI `View`s). Avoid using it for mutable shared state or side effects.
internal extension View {

    /// Returns a copy of the current view with a modified property value.
    ///
    /// - Parameters:
    ///   - keyPath: A writable key path to the property to be updated.
    ///   - value: The new value to assign to the property.
    /// - Returns: A new instance of `Self` with the updated property value.
    func mutating<T>(keyPath: WritableKeyPath<Self, T>, value: T) -> Self {
        var newSelf = self
        newSelf[keyPath: keyPath] = value
        return newSelf
    }
}
