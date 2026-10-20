//
//  WebviewInjection.swift
//  Core
//
//  Created by Vadim Kuznetsov on 4.01.24.
//

import WebKit
public struct WebviewInjection: WebViewScriptInjectionProtocol {
    public var id: String
    public var script: String
    public var messages: [WebviewMessage]?
    public var injectionTime: WKUserScriptInjectionTime
    public var forMainFrameOnly: Bool
    init(
        id: String,
        script: String,
        messages: [WebviewMessage]? = nil,
        injectionTime: WKUserScriptInjectionTime = .atDocumentEnd,
        forMainFrameOnly: Bool = true
    ) {
        self.id = id
        self.script = script
        self.messages = messages
        self.injectionTime = injectionTime
        self.forMainFrameOnly = forMainFrameOnly
    }
    
    public static func == (lhs: WebviewInjection, rhs: WebviewInjection) -> Bool {
        lhs.id == rhs.id &&
        lhs.script == rhs.script &&
        lhs.injectionTime == rhs.injectionTime &&
        lhs.messages == rhs.messages &&
        lhs.forMainFrameOnly == rhs.forMainFrameOnly
    }
}

public extension WebviewInjection {

    static var surveyCSS: WebviewInjection {
        SurveyCssInjection()
            .webviewInjection()
    }
    
    static var dragAndDropCss: WebviewInjection {
        DragAndDropCssInjection()
            .webviewInjection()
    }

    static var colorInversionCss: WebviewInjection {
        ColorInversionInjection()
            .webviewInjection()
    }

    static var ajaxCallback: WebviewInjection {
        AjaxInjection()
            .webviewInjection()
    }
    
    static var readability: WebviewInjection {
        ReadabilityInjection()
            .webviewInjection()
    }
    
    static var accessibility: WebviewInjection {
        AccessibilityInjection()
            .webviewInjection()
    }

    /// Audio/video fixes for course content:
    /// - iOS web views never start loading `preload="none"` media when play is pressed, so the first
    ///   tap stalls at 00:00. Audio switches to `metadata` when the page loads (a few KB, and the player
    ///   can show its length); video, whose metadata can be large, switches only when touched.
    /// - Only one player plays at a time, e.g. starting another language's audio pauses the first.
    static var mediaPlayback: WebviewInjection {
        let script = """
        (function() {
            function loadMetadata(media) {
                if (media.preload === "none" && media.readyState === 0) {
                    media.preload = "metadata";
                }
            }
            function loadAudioIn(node) {
                if (node.nodeType !== 1) { return; }
                if (node.tagName === "AUDIO") { loadMetadata(node); }
                node.querySelectorAll("audio").forEach(loadMetadata);
            }
            document.addEventListener("DOMContentLoaded", function() {
                loadAudioIn(document.documentElement);
                // Only newly added nodes are checked, so pages that update often stay cheap.
                new MutationObserver(function(mutations) {
                    mutations.forEach(function(mutation) { mutation.addedNodes.forEach(loadAudioIn); });
                }).observe(document.documentElement, { childList: true, subtree: true });
            });
            function prepareTouchedMedia(event) {
                var media = event.target && event.target.closest ? event.target.closest("audio, video") : null;
                if (media) { loadMetadata(media); }
            }
            // Capture phase runs before the player's own controls; click covers VoiceOver and keyboards.
            document.addEventListener("touchstart", prepareTouchedMedia, { capture: true, passive: true });
            document.addEventListener("pointerdown", prepareTouchedMedia, true);
            document.addEventListener("click", prepareTouchedMedia, true);
            // "play" doesn't bubble, so listen in the capture phase.
            document.addEventListener("play", function(event) {
                var started = event.target;
                document.querySelectorAll("audio, video").forEach(function(media) {
                    if (media !== started && !media.paused) { media.pause(); }
                });
            }, true);
        })();
        """
        return WebviewInjection(
            id: "MediaPlaybackInjection",
            script: script,
            messages: nil,
            injectionTime: .atDocumentStart,
            forMainFrameOnly: false
        )
    }

    static var hideCertificatePrintBanner: WebviewInjection {
        let script = """
        (function() {
            window.__openedxHideCertBanner = function() {
                try {
                    var selectors = [
                        ".accomplishment-action",
                        ".wrapper-accomplishment-action",
                        ".btn-print",
                        ".certificate-introduction",
                        ".print-certificate-banner",
                        ".accomplishment-intro"
                    ];
                    var hasSelectorMatch = false;
                    selectors.forEach(function(sel) {
                        var elements = document.querySelectorAll(sel);
                        if (elements.length > 0) {
                            hasSelectorMatch = true;
                        }
                        elements.forEach(function(el) {
                            el.style.setProperty("display", "none", "important");
                        });
                    });
                    if (hasSelectorMatch) {
                        return;
                    }
                    var blocks = document.querySelectorAll(
                        "div, section, article, aside"
                    );
                    var banner = null;
                    var bannerSize = 0;
                    for (var i = 0; i < blocks.length; i++) {
                        var html = blocks[i].outerHTML;
                        var text = (blocks[i].textContent || "").trim();
                        if (
                            html.length < 3000 &&
                            html.length > bannerSize &&
                            /print/i.test(text) &&
                            /certificate/i.test(text)
                        ) {
                            banner = blocks[i];
                            bannerSize = html.length;
                        }
                    }
                    if (banner) {
                        banner.style.setProperty("display", "none", "important");
                    }
                } catch (e) {}
            };
            document.addEventListener("DOMContentLoaded", window.__openedxHideCertBanner);
        })();
        """
        return WebviewInjection(
            id: "HideCertificatePrintBannerInjection",
            script: script,
            messages: nil,
            injectionTime: .atDocumentStart,
            forMainFrameOnly: true
        )
    }

    // Hide common headers/footers in external pages (e.g., policy pages)
    static var hideHeaderFooter: WebviewInjection {
        let css = """
            /* Hide common site headers/footers */
            header, footer,
            [role=\"banner\"], [role=\"contentinfo\"],
            .site-header, .site-footer,
            .global-header, .global-footer,
            .header, .footer,
            .navbar-fixed-top, .navbar, .topbar,
            .bottom-bar, .cookie-banner, .gdpr-banner,
            #header, #footer, #masthead, #site-footer, #site-header {
                display: none !important;
                visibility: hidden !important;
                height: 0 !important;
                min-height: 0 !important;
                max-height: 0 !important;
                margin: 0 !important;
                padding: 0 !important;
                border: 0 !important;
            }

            /* Remove empty space created by fixed headers */
            body {
                padding-top: 0 !important;
                padding-bottom: 0 !important;
                margin-top: 0 !important;
                margin-bottom: 0 !important;
            }
        """
        let script = """
        window.addEventListener("load", () => {
            var css = `\(css)`,
                head = document.head || document.getElementsByTagName('head')[0],
                style = document.createElement('style');
            head.appendChild(style);
            style.type = 'text/css';
            if (style.styleSheet) {
                style.styleSheet.cssText = css;
            } else {
                style.appendChild(document.createTextNode(css));
            }
        })
        """
        return WebviewInjection(
            id: "HideHeaderFooterInlineInjection",
            script: script,
            messages: nil,
            injectionTime: .atDocumentEnd,
            forMainFrameOnly: true
        )
    }
}
