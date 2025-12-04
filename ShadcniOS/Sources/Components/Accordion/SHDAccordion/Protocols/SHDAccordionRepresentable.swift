//
//  SHDAccordionRepresentable.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import Foundation

/// A protocol that defines the data requirements for types
/// that can be displayed within an accordion component.
///
/// ## Discussion
/// Conforming types must provide a `title` and `content` string,
/// which represent the header and body of an accordion item, respectively.
///
/// By conforming to `Hashable`, each accordion item can be uniquely
/// identified within SwiftUI list or collections.
///
/// ## Usage
/// ```swift
/// struct FAQItem: SHDAccordionRepresentable {
///     let title: String
///     let content: String
/// }
///
/// let faq = FAQItem(
///     title: "What is Shadcn?",
///     content: "Shadcn is a design system for building modern SwiftUI components."
/// )
/// ```

public protocol SHDAccordionRepresentable: Hashable {
    /// The title displayed in the accordion header
    var title: String { get }

    /// The content displayed when the accordion item is expanded
    var content: String { get }
}
