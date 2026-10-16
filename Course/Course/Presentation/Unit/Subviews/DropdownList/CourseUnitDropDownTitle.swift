//
//  CourseUnitDropDownTitle.swift
//  Course
//
//  Created by Vadim Kuznetsov on 4.12.23.
//

import SwiftUI
import Theme

struct CourseUnitDropDownTitle: View {
    var title: String
    var caption: String?
    var isAvailable: Bool
    @Binding var showDropdown: Bool

    var body: some View {
        if let caption {
            VStack(spacing: 4) {
                Text(caption)
                    .lineLimit(1)
                    .font(Theme.Fonts.bodyMedium)
                    .foregroundColor(Theme.Colors.textSecondaryDark)
                if isAvailable {
                    Button {
                        showDropdown.toggle()
                    } label: {
                        HStack(spacing: 6) {
                            unitTitle
                            Image(systemName: "chevron.down")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Theme.Colors.accentColor)
                                .dropdownArrowRotationAnimation(value: showDropdown)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 12)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(showDropdown ? Theme.Colors.accentColor.opacity(0.08) : Theme.Colors.background)
                        )
                        .overlay(
                            Capsule()
                                .stroke(
                                    showDropdown ? Theme.Colors.accentColor : Theme.Colors.cardViewStroke,
                                    lineWidth: 1
                                )
                        )
                        .contentShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(title)
                    .accessibilityAddTraits(showDropdown ? [.isButton, .isSelected] : .isButton)
                } else {
                    unitTitle
                        .accessibilityAddTraits(.isHeader)
                }
            }
        } else if isAvailable {
            Button {
                if isAvailable {
                    showDropdown.toggle()
                }
            } label: {
                HStack {
                    Text(title)
                        .opacity(showDropdown ? 0.7 : 1.0)
                        .lineLimit(1)
                        .font(Theme.Fonts.bodyMedium)
                        .foregroundColor(Theme.Colors.textPrimary)
                    if isAvailable {
                        Image(systemName: "chevron.down").renderingMode(.template)
                            .dropdownArrowRotationAnimation(value: showDropdown)
                            .foregroundColor(Theme.Colors.textPrimary)
                    }
                }
            }
            .buttonStyle(.plain)
        } else {
            Text(title)
                .lineLimit(1)
        }
    }

    private var unitTitle: some View {
        Text(title)
            .lineLimit(1)
            .font(Theme.Fonts.titleMedium)
            .foregroundColor(Theme.Colors.textPrimary)
    }
}

#if DEBUG
struct CourseUnitDropDownTitle_Previews: PreviewProvider {
    static var previews: some View {
        CourseUnitDropDownTitle(
            title: "Dropdown title",
            caption: "Section title",
            isAvailable: true,
            showDropdown: .constant(false)
        )
    }
}
#endif
