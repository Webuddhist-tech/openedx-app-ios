//
//  CourseUnitDropDownCell.swift
//  Course
//
//  Created by Vadim Kuznetsov on 4.12.23.
//

import Core
import SwiftUI
import Theme

struct CourseUnitDropDownCell: View {
    var vertical: CourseVertical
    var isSelected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                completionIndicator
                Text(vertical.displayName)
                    .font(isSelected ? Theme.Fonts.titleSmall : Theme.Fonts.bodyMedium)
                    .foregroundColor(Theme.Colors.textPrimary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                CourseVerticalImageView(blocks: vertical.childs)
                    .foregroundColor(isSelected ? Theme.Colors.accentColor : Theme.Colors.textSecondary)
                    .accessibilityHidden(true)
            }
            .padding(.horizontal, 12)
            .frame(minHeight: 48)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Theme.Colors.accentColor.opacity(0.12) : Color.clear)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    @ViewBuilder
    private var completionIndicator: some View {
        if vertical.completion == 1 {
            Image(systemName: "checkmark")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(Theme.Colors.white)
                .frame(width: 22, height: 22)
                .background(Circle().fill(Theme.Colors.accentColor))
        } else {
            Circle()
                .stroke(Theme.Colors.cardViewStroke, lineWidth: 1.5)
                .frame(width: 22, height: 22)
        }
    }
}

#if DEBUG
struct CourseUnitDropDownCell_Previews: PreviewProvider {
    static var previews: some View {
        let vertical = CourseVertical(
            blockId: "1",
            id: "1",
            courseId: "123",
            displayName: "Lesson 1",
            type: .vertical,
            completion: 1,
            childs: [
                CourseBlock(
                    blockId: "1",
                    id: "1",
                    courseId: "123",
                    topicId: "1",
                    graded: false,
                    due: Date(),
                    completion: 1,
                    type: .video,
                    displayName: "Lesson 1",
                    studentUrl: "",
                    webUrl: "",
                    encodedVideo: nil,
                    multiDevice: true,
                    offlineDownload: nil
                )
            ],
            webUrl: ""
        )
               
        CourseUnitDropDownCell(
            vertical: vertical,
            isSelected: false,
            action: {}
        )
    }
}
#endif
