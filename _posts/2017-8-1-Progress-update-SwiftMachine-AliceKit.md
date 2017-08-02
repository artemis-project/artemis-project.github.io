---
layout: post
title: Becoming a reality - AliceKit and the Swift Machine
author: Marquis Kurt
categories: alicekit insight
permalink: /insights/alicekit/alicekit-and-the-swift-machine/
excerpt_separator: <!--more-->
---
It's been a few weeks since I originally published my [article on Medium that proposed the future of Artemis](https://medium.com/@MacEatWindows/i-thought-about-artemis-for-a-while-and-i-think-i-turned-on-my-ink-machine-f14f4a532f9b), and I'm proud to say that we are indeed starting to make headway with it. Since publishing that article, our team has begun extensive research and experimentation with the capabilities of Swift, Wayland, and Qt.<!--more--> Earlier this month, **[Wesley Hersherger](https://github.com/MggMuggins)** wrote an article discussing the relationship with Wayland, X, and how Artemis may adopt these technologies soon. Needless to say, we have made some great strides in making the future Artemis a reality.

## Meet AliceKit Angel
![AliceKit logo]({{ site.baseurl }}/assets/images/apps/alicekit.png)
Creating command-line apps with Swift is relatively easy, but bringing the capabilities and extensibility of the Qt GUI framework to it is quite a challenge. We saw this as a huge challenge, too, as creating an entire desktop environment with core apps would be a massive undertaking on our part.

However, after some roaming around on GitHub, we came across **[Andreas Schulz's](http://www.github.com/Longhanks)** new project that makes this idea a reality: _Qlift_. This brand-new Swift package, although unfinished and not fully implemented, brings a lot of capabilites that we hadn't seen before, especially for Qt. We knew that we found the key to the door of the future here. So, we took the core framework of Qlift, future ideas for an extension API with Desiree, and a layout for a Swift package that made sense and created something truly amazing: AliceKit.

AliceKit is a special set of tools and libraries that enable developers on both macOS and Linux to build amazing and beautiful apps using Swift and Qt. It's still a bit early to call it ready, but we are working on making AliceKit both easy and fun to use. Hopefully, we'll create our own Swift package that already bundles our ideas and Qlift together into a single package.

Of course, we can't really evangelize AliceKit without making a proper developer tool for it.

## The Swift Machine
![Swift Machine header](https://github.com/artemis-project/swift-machine/raw/master/Resources/Repository/GitHub_Header.jpg)

And thus begins the work of a brand-new IDE to make the creation of AliceKit apps even easier: **The Swift Machine**. Here's how we best described it on our [GitHub page](http://www.github.com/artemis-project/swift-machine):

> "The Swift Machine brings AliceKit apps and extensions to life and creates them from rich ideas. This integrated development environment eases the process of making beautiful and functional apps in Swift and put the developer in control, not the other way around. Yes, we did learn from the mistakes of Joey Drews's ink machine; that's why the Swift Machine is built with AliceKit itself."

Within the last couple of days, I've managed to make some good progress on creating the essential structure of the Swift Machine app, with its own Swift files for the app, window UI, and menu. Andreas has also contributed by fixing errors and adding functionalities to the Qlift API for use in the Swift Machine, like menu actions. Here's a GIF that really demoes the progress I have made:

![Swift Machine progress]({{ site.baseurl }}/assets/images/swiftmachine-progress.gif)

Not only is this IDE going to simplify a lot of things in development, it's also an ideal AliceKit app, proudly bearing the "Powered by AliceKit" banner on the README. If you want to contribute, feel free to make a pull request on GitHub or join us on Riot.

That's all for this little update blurb. Happy August!