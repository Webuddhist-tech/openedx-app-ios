//
//  LessonView.swift
//  CourseDetails
//
//  Created by  Stepanok Ivan on 05.10.2022.
//

import Foundation
import SwiftUI
import Core
import OEXFoundation
import Discussion
import Combine
import Theme

public struct CourseUnitView: View {
    
    @ObservedObject public var viewModel: CourseUnitViewModel
    @State private var showAlert: Bool = false
    @State var alertMessage: String? {
        didSet {
            withAnimation {
                showAlert = alertMessage != nil
            }
        }
    }
    @State var offsetView: CGPoint = .zero
    @State var showDiscussion: Bool = false
    @Environment(\.isPresented) private var isPresented
    @Environment(\.isHorizontal) private var isHorizontal
    public let playerStateSubject = CurrentValueSubject<VideoPlayerState?, Never>(nil)
    
    // Dropdown parameters
    @State var showDropdown: Bool = false
    private let portraitTopSpacing: CGFloat = 60
    private let landscapeTopSpacing: CGFloat = 75
    
    @State private var videoURLs: [String: URL?] = [:]
    @State private var webURLs: [String: URL?] = [:]

    @State var currentBlock: CourseBlock?

    // Measured at runtime so the layout follows Dynamic Type; initial values match the default text size.
    @State private var captionHeaderHeight: CGFloat = 62
    @State private var navigationButtonsHeight: CGFloat = 42
    private let navigationButtonsBottomPadding: CGFloat = 50

    let isDropdownActive: Bool
    
    var sequenceTitle: String {
        let chapter = viewModel.chapters[viewModel.chapterIndex]
        let sequence = chapter.childs[viewModel.sequentialIndex]
        return sequence.displayName
    }
    
    var unitTitle: String {
        let chapter = viewModel.chapters[viewModel.chapterIndex]
        let sequence = chapter.childs[viewModel.sequentialIndex]
        let unit = sequence.childs[viewModel.verticalIndex]
        return unit.displayName
    }
    
    var isDropdownAvailable: Bool {
        viewModel.verticals.count > 1
    }
    
    var isHorizontalNavigation: Bool {
        viewModel.courseUnitProgressEnabled
    }
    
    public init(
        viewModel: CourseUnitViewModel,
        isDropdownActive: Bool = false
    ) {
        self.viewModel = viewModel
        self.isDropdownActive = isDropdownActive
        viewModel.loadIndex()
        viewModel.nextTitles()

        if viewModel.showVideoNavigation {
            Task {
               await viewModel.getCourseVideoBlocks()
            }
        }
    }
                
    public var body: some View {
        ZStack(alignment: .top) {
            // MARK: - Page Body
            ZStack(alignment: .bottom) {
                GeometryReader { reader in
                    VStack(spacing: 0) {
                        topInset(reader: reader)
                        content(reader: reader)
                    }
                    .frame(maxWidth: .infinity)
                    .clipped()

                }
                // MARK: - Alert
                if showAlert {
                    ZStack(alignment: .bottomLeading) {
                        Spacer()
                        HStack(spacing: 6) {
                            CoreAssets.rotateDevice.swiftUIImage.renderingMode(.template)
                                .onAppear {
                                    alertMessage = CourseLocalization.Alert.rotateDevice
                                }
                            Text(alertMessage ?? "")
                        }.shadowCardStyle(bgColor: Theme.Colors.accentColor,
                                          textColor: Theme.Colors.white)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            doAfter(Theme.Timeout.snackbarMessageLongTimeout) {
                                alertMessage = nil
                                showAlert = false
                            }
                        }
                    }
                }
                courseNavigation
            }
            .onDisappear {
                if !isPresented {
                    playerStateSubject.send(VideoPlayerState.kill)
                }
            }
            if isDropdownActive && showDropdown {
                CourseUnitVerticalsDropdownView(
                    verticals: viewModel.verticals,
                    currentIndex: viewModel.verticalIndex,
                    offsetY: (isHorizontal ? landscapeTopSpacing : portraitTopSpacing) + captionHeaderExtraHeight,
                    dimmingTopInset: topInsetHeight,
                    showDropdown: $showDropdown
                ) { vertical in
                    let data = VerticalData.dataFor(blockId: vertical.childs.first?.id, in: viewModel.chapters)
                    viewModel.route(to: data)
                    playerStateSubject.send(VideoPlayerState.kill)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onRightSwipeGesture {
            playerStateSubject.send(VideoPlayerState.kill)
            viewModel.router.back()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                showDiscussion = viewModel.selectedLesson().type == .discussion
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .background(
            Theme.Colors.unitCanvasBackground
                .ignoresSafeArea()
        )
        .dropdownAnimation(isActive: isDropdownActive, value: showDropdown)
    }

    // MARK: - Content

    // The subsection title is drawn as a caption above the unit title. In video navigation
    // mode the navigation bar shows the current video's name instead.
    private var showsCaptionHeader: Bool {
        !viewModel.showVideoNavigation
    }

    private var captionHeaderTopPadding: CGFloat {
        isHorizontal ? 10 : 4
    }

    private var baseTopInsetHeight: CGFloat {
        isHorizontal ?
        (viewModel.courseUnitProgressEnabled ? 78 : 75) :
        (viewModel.courseUnitProgressEnabled ? 68 : 50)
    }

    private var topInsetHeight: CGFloat {
        guard showsCaptionHeader else { return baseTopInsetHeight }
        // Leave a small gap between the measured caption header and the content.
        return max(baseTopInsetHeight, captionHeaderHeight + 6)
    }

    private var captionHeaderExtraHeight: CGFloat {
        topInsetHeight - baseTopInsetHeight
    }

    // Each page is as tall as the reader but starts below the top inset, so its last
    // `topInsetHeight` points are off screen; in portrait the card also has to clear
    // the floating navigation buttons.
    private var webCardBottomPadding: CGFloat {
        let navigationClearance = isHorizontal
        ? 16
        : navigationButtonsBottomPadding + navigationButtonsHeight + 16
        return topInsetHeight + navigationClearance
    }

    private func topInset(reader: GeometryProxy) -> some View {
        VStack { Theme.Colors.unitCanvasBackground }
            .frame(width: reader.size.width, height: topInsetHeight)
    }

    @ViewBuilder
    private func content(reader: GeometryProxy) -> some View {
        let alignment = UnitAlignment(horizontalAlignment: .top, verticalAlignment: .leading)
        let offset = viewOffset(for: viewModel.index, with: reader.size, insets: reader.safeAreaInsets)

        UnitStack(isVerticalNavigation: !isHorizontalNavigation, alignment: alignment, spacing: 0) {
            let data = Array(viewModel.verticals[viewModel.verticalIndex].childs.enumerated())
            ForEach(data, id: \.offset) {index, block in
                let lessonType = LessonType.from(block, streamingQuality: viewModel.streamingQuality)
                let header = blockHeader(block: block, index: index)
                VStack(spacing: 0) {
                    // Blocks shown in a web card draw the dashes and header inside the card.
                    if !rendersWebCard(lessonType) && !viewModel.courseUnitProgressEnabled {
                        standaloneBlockHeader(header, lessonType: lessonType, width: reader.size.width)
                    }

                    if viewModel.showVideoNavigation {
                        if !isHorizontal {
                            VideoNavigationView(
                                viewModel: viewModel,
                                currentBlock: $currentBlock,
                                block: block
                            )
                            .onReceive(NotificationCenter.default.publisher(for:
                                    .onVideoProgressUpdated)) { _ in
                                Task {
                                    await viewModel.getCourseVideoBlocks()
                                }
                            }
                        }
                    }

                    contentView(for: block, lessonType: lessonType, index: index, reader: reader)
                        .onChange(of: viewModel.allVideosForNavigation) { _ in
                            if let currentBlock {
                                let index = self.viewModel.allVideosForNavigation.firstIndex(of: currentBlock)
                                viewModel.currentVideoIndex = index
                            }
                        }
                }
                .frame(
                    width: isHorizontal ? reader.size.width - (isHorizontalNavigation ? 0 : 16) : reader.size.width,
                    height: reader.size.height
                )
                .padding(.trailing, isHorizontal && isHorizontalNavigation ? reader.safeAreaInsets.trailing : 0)
                .id(index)
            }
        }
        .offset(x: offset.x, y: offset.y)
        .animation(.easeInOut(duration: 0.2), value: viewModel.index)
        .clipped()
        .onChange(
            of: viewModel.index,
            perform: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    showDiscussion = viewModel.selectedLesson().type == .discussion
                }
            }
        )
        .onReceive(
            NotificationCenter.default.publisher(
                for: NSNotification.blockCompletion
            )
        ) { _ in
            let blockID = viewModel.selectedLesson().id
            Task {
                await viewModel.blockCompletionRequest(blockID: blockID)
            }
        }
    }

    @ViewBuilder
    private func contentView(
        for block: CourseBlock,
        lessonType: LessonType,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        switch lessonType {
        // MARK: YouTube
        case let .youtube(url, blockID):
            youtubeView(
                block: block,
                url: url,
                blockID: blockID,
                index: index,
                reader: reader
            )
            .onAppear {
                self.currentBlock = block
            }

        // MARK: Encoded Video
        case let .video(encodedUrl, blockID):
            videoView(
                block: block,
                encodedUrl: encodedUrl,
                blockID: blockID,
                index: index,
                reader: reader
            )
            .onAppear {
                self.currentBlock = block
            }
        // MARK: Web
        case let .web(url, injections, blockId, isDownloadable):
            webView(
                block: block,
                url: url,
                injections: injections,
                blockId: blockId,
                isDownloadable: isDownloadable,
                index: index,
                reader: reader
            )
        // MARK: Unknown
        case .unknown(let url):
            unknownView(
                block: block,
                url: url,
                index: index,
                reader: reader
            )
        // MARK: Discussion
        case let .discussion(blockID, blockKey, title):
            discussionView(
                block: block,
                blockID: blockID,
                blockKey: blockKey,
                title: title,
                index: index,
                reader: reader
            )
        }
    }

    @ViewBuilder
    private func youtubeView(
        block: CourseBlock,
        url: String,
        blockID: String,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        if index == viewModel.index {
            if viewModel.connectivity.isInternetAvaliable {
                YouTubeView(
                    name: block.displayName,
                    url: url,
                    courseID: viewModel.courseID,
                    blockID: blockID,
                    playerStateSubject: playerStateSubject,
                    languages: block.subtitles ?? [],
                    isOnScreen: index == viewModel.index
                )
                .frameLimit(width: reader.size.width)
                
                if !isHorizontal {
                    Spacer(minLength: 150)
                }
            } else {
                OfflineContentView(
                    isDownloadable: false
                )
            }
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func videoView(
        block: CourseBlock,
        encodedUrl: String,
        blockID: String,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        Group {
            if index == viewModel.index {
                if viewModel.connectivity.isInternetAvaliable {
                    EncodedVideoView(
                        name: block.displayName,
                        url: URL(string: encodedUrl),
                        courseID: viewModel.courseID,
                        blockID: blockID,
                        playerStateSubject: playerStateSubject,
                        languages: block.subtitles ?? [],
                        isOnScreen: index == viewModel.index
                    )
                    .padding(.top, 5)
                    .frameLimit(width: reader.size.width)
                    
                    if !isHorizontal {
                        Spacer(minLength: 150)
                    }
                } else if let offlineURL = videoURLs[blockID] {
                    EncodedVideoView(
                        name: block.displayName,
                        url: offlineURL,
                        courseID: viewModel.courseID,
                        blockID: blockID,
                        playerStateSubject: playerStateSubject,
                        languages: block.subtitles ?? [],
                        isOnScreen: index == viewModel.index
                    )
                    .padding(.top, 5)
                    .frameLimit(width: reader.size.width)
                    
                    if !isHorizontal {
                        Spacer(minLength: 150)
                    }
                } else {
                    OfflineContentView(
                        isDownloadable: true
                    )
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            Task {
                if let url = await viewModel.urlForVideoFileOrFallback(
                    blockId: blockID,
                    url: encodedUrl
                ) {
                    videoURLs[blockID] = url
                }
            }
        }
    }

    /// Mirrors `webView(...)`: web blocks get the card unless they're offline and not downloaded.
    private func rendersWebCard(_ lessonType: LessonType) -> Bool {
        guard case let .web(_, _, blockId, _) = lessonType else { return false }
        return viewModel.connectivity.isInternetAvaliable || webURLs[blockId] != nil
    }

    @ViewBuilder
    private func standaloneBlockHeader(_ header: UnitBlockHeader, lessonType: LessonType, width: CGFloat) -> some View {
        VStack(spacing: 0) {
            if header.total > 1 {
                UnitProgressDashes(header: header)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 4)
            }
            // Discussions show their own title, and in video navigation mode the
            // navigation bar already shows the current video's name.
            if case .discussion = lessonType {
            } else if !viewModel.showVideoNavigation {
                UnitBlockHeaderView(header: header)
            }
        }
        .frameLimit(width: width)
    }

    private func blockHeader(block: CourseBlock, index: Int) -> UnitBlockHeader {
        UnitBlockHeader(
            title: block.displayName,
            icon: block.type.unitHeaderIcon,
            position: index + 1,
            total: viewModel.verticals[viewModel.verticalIndex].childs.count
        )
    }

    @ViewBuilder
    private func webView(
        block: CourseBlock,
        url: String,
        injections: [WebviewInjection],
        blockId: String,
        isDownloadable: Bool,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        Group {
            if index >= viewModel.index - 1 && index <= viewModel.index + 1 {
                if viewModel.connectivity.isInternetAvaliable {
                    WebView(
                        url: url,
                        localUrl: nil,
                        injections: injections,
                        blockID: block.id,
                        header: viewModel.courseUnitProgressEnabled ? nil : blockHeader(block: block, index: index),
                        bottomPadding: webCardBottomPadding
                    )
                } else if let offlineURL = webURLs[blockId] {
                    WebView(
                        url: url,
                        localUrl: offlineURL?.absoluteString,
                        injections: injections,
                        blockID: block.id,
                        header: viewModel.courseUnitProgressEnabled ? nil : blockHeader(block: block, index: index),
                        bottomPadding: webCardBottomPadding
                    )
                } else {
                    OfflineContentView(
                        isDownloadable: isDownloadable
                    )
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            Task {
                if let offlineURL = await viewModel.urlForOfflineContent(blockId: blockId) {
                    webURLs[blockId] = offlineURL
                }
            }
        }
    }

    @ViewBuilder
    private func unknownView(
        block: CourseBlock,
        url: String,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        if index >= viewModel.index - 1 && index <= viewModel.index + 1 {
            if viewModel.connectivity.isInternetAvaliable {
                NotAvailableOnMobileView(url: url)
                    .frameLimit(width: reader.size.width)
            } else {
                OfflineContentView(
                    isDownloadable: false
                )
            }
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    private func discussionView(
        block: CourseBlock,
        blockID: String,
        blockKey: String,
        title: String,
        index: Int,
        reader: GeometryProxy
    ) -> some View {
        if index >= viewModel.index - 1 && index <= viewModel.index + 1 {
            if viewModel.connectivity.isInternetAvaliable {
                VStack {
                    if showDiscussion {
                        DiscussionView(
                            id: viewModel.courseID,
                            blockID: blockID,
                            blockKey: blockKey,
                            title: title,
                            viewModel: viewModel
                        )
                        Spacer(minLength: 100)
                    } else {
                        VStack {
                            Color.clear
                        }
                    }
                }
                // No need for iPad paddings here because they were added
                // to PostsView that is placed inside DiscussionView
            } else {
                FullScreenErrorView(type: .noInternet)
            }
        } else {
            EmptyView()
        }
    }

    private func viewOffset(for index: Int, with size: CGSize, insets: EdgeInsets) -> CGPoint {
        let rightInset = (isHorizontal ? insets.trailing * CGFloat(index) : 0)
        let x: CGFloat = isHorizontalNavigation ? -(size.width * CGFloat(index) + rightInset) : 0
        let y: CGFloat = isHorizontalNavigation ? 0 : -(size.height * CGFloat(index))
        return CGPoint(x: x, y: y)
    }
    
    // MARK: - Course Navigation

    private var courseNavigation: some View {
        VStack(spacing: 0) {
            ZStack {
                navigationBar
                courseNavigationView
            }
        }
        .frame(maxWidth: .infinity)
    }

    private var navigationBar: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                NavigationBar(
                    title: viewModel.showVideoNavigation ? currentBlock?.displayName ?? "" : "",
                    leftButtonAction: {
                        viewModel.router.back()
                        playerStateSubject.send(VideoPlayerState.kill)
                    }
                )
                .padding(.top, isHorizontal ? 10 : 0)
                .padding(.leading, isHorizontal ? -16 : 0)

                if isDropdownActive && !showsCaptionHeader {
                    CourseUnitDropDownTitle(
                        title: unitTitle,
                        isAvailable: isDropdownAvailable,
                        showDropdown: $showDropdown
                    )
                    .padding(.horizontal, 48)
                }
            }
            .overlay(alignment: .top) {
                if showsCaptionHeader {
                    CourseUnitDropDownTitle(
                        title: unitTitle,
                        caption: sequenceTitle,
                        isAvailable: isDropdownActive && isDropdownAvailable,
                        showDropdown: $showDropdown
                    )
                    .padding(.horizontal, 48)
                    .padding(.top, captionHeaderTopPadding)
                    .background(
                        GeometryReader { proxy in
                            Color.clear.preference(key: CaptionHeaderHeightKey.self, value: proxy.size.height)
                        }
                    )
                }
            }
            .background(
                !viewModel.showVideoNavigation
                ? Theme.Colors.unitCanvasBackground
                : Theme.Colors.courseCardBackground
            )
            .padding(.trailing, isHorizontal ? 215 : 0)
            Spacer()
        }
        .onPreferenceChange(CaptionHeaderHeightKey.self) { captionHeaderHeight = $0 }
    }

    private var courseNavigationView: some View {
        HStack(alignment: .center) {
            if isHorizontal {
                Spacer()
            }
            VStack {
                if !isHorizontal {
                    Spacer()
                }
                CourseNavigationView(
                    viewModel: viewModel,
                    playerStateSubject: playerStateSubject
                )
                .background(
                    GeometryReader { proxy in
                        Color.clear.preference(key: NavigationButtonsHeightKey.self, value: proxy.size.height)
                    }
                )
                if isHorizontal {
                    Spacer()
                }
            }
            .padding(.bottom, isHorizontal ? 0 : navigationButtonsBottomPadding)
            .padding(.top, isHorizontal ? 12 : 0)
        }
        .onPreferenceChange(NavigationButtonsHeightKey.self) { navigationButtonsHeight = $0 }
    }
}

private struct CaptionHeaderHeightKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

private struct NavigationButtonsHeightKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

#if DEBUG
struct CourseUnitView_Previews: PreviewProvider {
    static var previews: some View {
        let blocks = [
            CourseBlock(
                blockId: "1",
                id: "1",
                courseId: "123",
                topicId: "1",
                graded: false,
                due: Date(),
                completion: 0,
                type: .video,
                displayName: "Lesson 1",
                studentUrl: "",
                webUrl: "",
                encodedVideo: nil,
                multiDevice: true,
                offlineDownload: nil
            ),
            CourseBlock(
                blockId: "2",
                id: "2",
                courseId: "123",
                topicId: "2",
                graded: false,
                due: Date(),
                completion: 0,
                type: .video,
                displayName: "Lesson 2",
                studentUrl: "2",
                webUrl: "2",
                encodedVideo: nil,
                multiDevice: false,
                offlineDownload: nil
            ),
            CourseBlock(
                blockId: "3",
                id: "3",
                courseId: "123",
                topicId: "3",
                graded: false,
                due: Date(),
                completion: 0,
                type: .unknown,
                displayName: "Lesson 3",
                studentUrl: "3",
                webUrl: "3",
                encodedVideo: nil,
                multiDevice: true,
                offlineDownload: nil
            ),
            CourseBlock(
                blockId: "4",
                id: "4",
                courseId: "123",
                topicId: "4",
                graded: false,
                due: Date(),
                completion: 0,
                type: .unknown,
                displayName: "4",
                studentUrl: "4",
                webUrl: "4",
                encodedVideo: nil,
                multiDevice: false,
                offlineDownload: nil
            )
        ]
        
        let chapters = [
            CourseChapter(
                blockId: "0",
                id: "0",
                displayName: "0",
                type: .chapter,
                childs: [
                    CourseSequential(
                        blockId: "5",
                        id: "5",
                        displayName: "5",
                        type: .sequential,
                        completion: 0,
                        childs: [
                            CourseVertical(
                                blockId: "6",
                                id: "6",
                                courseId: "123",
                                displayName: "6",
                                type: .vertical,
                                completion: 0,
                                childs: blocks,
                                webUrl: ""
                            )
                        ],
                        sequentialProgress: SequentialProgress(
                            assignmentType: "Advanced Assessment Tools",
                            numPointsEarned: 1,
                            numPointsPossible: 3,
                            shortLabel: nil
                        ),
                        due: Date()
                    )
                ]
            ),
            CourseChapter(
                blockId: "2",
                id: "2",
                displayName: "2",
                type: .chapter,
                childs: [
                    CourseSequential(
                        blockId: "3",
                        id: "3",
                        displayName: "3",
                        type: .sequential,
                        completion: 0,
                        childs: [
                            CourseVertical(
                                blockId: "4",
                                id: "4",
                                courseId: "1",
                                displayName: "4",
                                type: .vertical,
                                completion: 0,
                                childs: blocks,
                                webUrl: ""
                            )
                        ],
                        sequentialProgress: SequentialProgress(
                            assignmentType: "Basic Assessment Tools",
                            numPointsEarned: 1,
                            numPointsPossible: 3,
                            shortLabel: nil
                        ),
                        due: Date()
                    )
                ])
        ]
        
        return CourseUnitView(viewModel: CourseUnitViewModel(
            lessonID: "",
            courseID: "",
            courseName: "courseName",
            chapters: chapters,
            chapterIndex: 0,
            sequentialIndex: 0,
            verticalIndex: 0,
            interactor: CourseInteractor.mock,
            config: ConfigMock(),
            router: CourseRouterMock(),
            analytics: CourseAnalyticsMock(),
            connectivity: Connectivity(),
            storage: CourseStorageMock(),
            manager: DownloadManagerMock()
        ))
    }
}
#endif
