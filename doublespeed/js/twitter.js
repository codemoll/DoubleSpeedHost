/**
 * Twitter Integration for WHMCS Templates
 * Handles Twitter widgets, sharing, and social media integration
 */

(function(window, document) {
    'use strict';
    
    // Twitter namespace
    window.WHMCS = window.WHMCS || {};
    window.WHMCS.twitter = window.WHMCS.twitter || {};
    
    // Configuration
    var config = {
        widgetUrl: 'https://platform.twitter.com/widgets.js',
        shareUrl: 'https://twitter.com/intent/tweet',
        loaded: false
    };
    
    // Load Twitter widgets script
    function loadTwitterWidgets() {
        if (config.loaded) {
            return;
        }
        
        var script = document.createElement('script');
        script.async = true;
        script.src = config.widgetUrl;
        script.charset = 'utf-8';
        
        var firstScript = document.getElementsByTagName('script')[0];
        firstScript.parentNode.insertBefore(script, firstScript);
        
        config.loaded = true;
    }
    
    // Twitter sharing functionality
    WHMCS.twitter.share = function(options) {
        options = options || {};
        
        var params = [];
        
        // Tweet text
        if (options.text) {
            params.push('text=' + encodeURIComponent(options.text));
        }
        
        // URL to share
        if (options.url) {
            params.push('url=' + encodeURIComponent(options.url));
        } else {
            params.push('url=' + encodeURIComponent(window.location.href));
        }
        
        // Hashtags
        if (options.hashtags) {
            var hashtags = Array.isArray(options.hashtags) ? options.hashtags.join(',') : options.hashtags;
            params.push('hashtags=' + encodeURIComponent(hashtags));
        }
        
        // Via (mention)
        if (options.via) {
            params.push('via=' + encodeURIComponent(options.via));
        }
        
        // Related accounts
        if (options.related) {
            var related = Array.isArray(options.related) ? options.related.join(',') : options.related;
            params.push('related=' + encodeURIComponent(related));
        }
        
        var url = config.shareUrl + '?' + params.join('&');
        
        // Open in popup window
        var width = 550;
        var height = 420;
        var left = (window.screen.width / 2) - (width / 2);
        var top = (window.screen.height / 2) - (height / 2);
        
        var popup = window.open(
            url,
            'twitter-share',
            'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',resizable=yes,scrollbars=yes'
        );
        
        if (popup && popup.focus) {
            popup.focus();
        }
        
        return popup;
    };
    
    // Create Twitter share button
    WHMCS.twitter.createShareButton = function(element, options) {
        if (!element) {
            return;
        }
        
        options = options || {};
        
        // Set default text if not provided
        if (!options.text) {
            options.text = document.title || 'Check this out!';
        }
        
        // Add click handler
        element.addEventListener('click', function(e) {
            e.preventDefault();
            WHMCS.twitter.share(options);
        });
        
        // Update button content if needed
        if (!element.innerHTML.trim()) {
            element.innerHTML = '📲 Share on Twitter';
        }
        
        // Add CSS class for styling
        if (!element.className.includes('twitter-share-btn')) {
            element.className += ' twitter-share-btn';
        }
    };
    
    // Create Twitter follow button
    WHMCS.twitter.createFollowButton = function(element, username, options) {
        if (!element || !username) {
            return;
        }
        
        options = options || {};
        
        var followUrl = 'https://twitter.com/intent/follow?screen_name=' + encodeURIComponent(username);
        
        // Add additional parameters
        if (options.related) {
            followUrl += '&related=' + encodeURIComponent(options.related);
        }
        
        element.addEventListener('click', function(e) {
            e.preventDefault();
            
            var width = 550;
            var height = 420;
            var left = (window.screen.width / 2) - (width / 2);
            var top = (window.screen.height / 2) - (height / 2);
            
            var popup = window.open(
                followUrl,
                'twitter-follow',
                'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',resizable=yes,scrollbars=yes'
            );
            
            if (popup && popup.focus) {
                popup.focus();
            }
        });
        
        // Update button content if needed
        if (!element.innerHTML.trim()) {
            element.innerHTML = '👤 Follow @' + username;
        }
        
        // Add CSS class for styling
        if (!element.className.includes('twitter-follow-btn')) {
            element.className += ' twitter-follow-btn';
        }
    };
    
    // Embed Twitter timeline
    WHMCS.twitter.embedTimeline = function(element, options) {
        if (!element) {
            return;
        }
        
        options = options || {};
        
        // Create timeline container
        var timeline = document.createElement('a');
        timeline.className = 'twitter-timeline';
        timeline.href = 'https://twitter.com/' + (options.username || 'twitter');
        timeline.setAttribute('data-tweet-limit', options.tweetLimit || '5');
        timeline.setAttribute('data-chrome', options.chrome || 'noheader nofooter noborders transparent');
        timeline.setAttribute('data-theme', options.theme || 'dark');
        timeline.textContent = 'Loading tweets...';
        
        // Set additional attributes
        if (options.width) {
            timeline.setAttribute('data-width', options.width);
        }
        if (options.height) {
            timeline.setAttribute('data-height', options.height);
        }
        
        element.appendChild(timeline);
        
        // Load Twitter widgets script if not already loaded
        loadTwitterWidgets();
    };
    
    // Initialize Twitter widgets on page load
    function initTwitterWidgets() {
        // Auto-initialize share buttons
        var shareButtons = document.querySelectorAll('[data-twitter-share]');
        for (var i = 0; i < shareButtons.length; i++) {
            var button = shareButtons[i];
            var options = {
                text: button.getAttribute('data-text'),
                url: button.getAttribute('data-url'),
                hashtags: button.getAttribute('data-hashtags'),
                via: button.getAttribute('data-via'),
                related: button.getAttribute('data-related')
            };
            
            // Remove null/undefined values
            for (var key in options) {
                if (!options[key]) {
                    delete options[key];
                }
            }
            
            WHMCS.twitter.createShareButton(button, options);
        }
        
        // Auto-initialize follow buttons
        var followButtons = document.querySelectorAll('[data-twitter-follow]');
        for (var j = 0; j < followButtons.length; j++) {
            var followButton = followButtons[j];
            var username = followButton.getAttribute('data-twitter-follow');
            var followOptions = {
                related: followButton.getAttribute('data-related')
            };
            
            WHMCS.twitter.createFollowButton(followButton, username, followOptions);
        }
        
        // Auto-initialize timelines
        var timelines = document.querySelectorAll('[data-twitter-timeline]');
        for (var k = 0; k < timelines.length; k++) {
            var timelineElement = timelines[k];
            var timelineOptions = {
                username: timelineElement.getAttribute('data-twitter-timeline'),
                tweetLimit: timelineElement.getAttribute('data-tweet-limit'),
                theme: timelineElement.getAttribute('data-theme'),
                chrome: timelineElement.getAttribute('data-chrome'),
                width: timelineElement.getAttribute('data-width'),
                height: timelineElement.getAttribute('data-height')
            };
            
            WHMCS.twitter.embedTimeline(timelineElement, timelineOptions);
        }
        
        // Load Twitter widgets if any Twitter elements exist
        if (shareButtons.length > 0 || followButtons.length > 0 || timelines.length > 0) {
            loadTwitterWidgets();
        }
    }
    
    // Social media sharing for hosting announcements
    WHMCS.twitter.shareAnnouncement = function(title, url) {
        var options = {
            text: title + ' - ' + (window.WHMCS_COMPANY_NAME || 'Our Hosting Services'),
            url: url,
            hashtags: 'webhosting,hosting',
            via: window.WHMCS_TWITTER_HANDLE || null
        };
        
        return WHMCS.twitter.share(options);
    };
    
    // Share service status updates
    WHMCS.twitter.shareStatus = function(status, url) {
        var statusText = '';
        switch(status) {
            case 'operational':
                statusText = '✅ All systems operational';
                break;
            case 'maintenance':
                statusText = '🔧 Scheduled maintenance in progress';
                break;
            case 'issue':
                statusText = '⚠️ Investigating service issues';
                break;
            default:
                statusText = '📊 System status update';
        }
        
        var options = {
            text: statusText + ' - Stay updated with our service status',
            url: url || window.location.href,
            hashtags: 'webhosting,status,uptime'
        };
        
        return WHMCS.twitter.share(options);
    };
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initTwitterWidgets);
    } else {
        initTwitterWidgets();
    }
    
    // Export for global access
    window.WHMCS.twitter = WHMCS.twitter;
    
})(window, document);