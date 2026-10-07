---
title: PS4 Remote Play on Mac OS X Issues
layout: post

date: 2016-05-07
slug: ps4-remote-play-mac-osx-issues
---

I recently purchased a Playstation 4 from Kogan. As a one television household, being able to connect and play via a
Playstation TV was appealing. Whilst awaiting delivery of the PS4, version 3.5 of the Playstation software was
released. This update added support for Remote Play on Mac and PC.

This was great for me, now I wouldn’t need to buy a Playstation TV or mess around with inputs on my Dell U2713HM to
play. When the PS4 finally arrived and was set it up, remote play was one of the first things that I tried. The process
for setting up and using remote play seems to work as follows:

1. Enable remote play on PS4
2. Connect a Dual shock 4 controller to your Mac via USB
3. Launch the PS4 Remote Play app and adjust the preferences to suit.
   Eg: resolution, image quality etc
4. Hit "Start" and play

![](/images/2016/05/ps4-remote-play-start.png)

The remote play software looks for a Playstation 4 on the local network or tries to connect via the internet. This is
when I ran into issues. Whenever I hit start, my Mac could not detect the PS4 on the local network. After some time, it
would attempt to connect via the internet and fail due to a slow connection.

With a slow home internet connection, playing via the internet is not going to be viable.

Currently, there is not a lot of information about troubleshooting local connection issues. A lack of information
suggests that the local connect feature should just work.

So, the next logical step is to ask what makes my home network unique compared to others. We feed an ADSL connection
into an Airport Extreme, which is extended by an Airport Express.

![](/images/2016/05/network-setup.png)

This is when the potential cause of the issue hit me. One of the few articles I did find, mentioned that the PS4 and
the Mac/PC should be connected to the same router.

The Airport Express is in our TV cabinet to provide an ethernet bridge to our FetchTV. Given it was right next to the
PS4, it seemed likely that it was connecting to it and not the Airport Extreme. We are about to return our FetchTV, so
I connected the PS4 via ethernet instead.

Repeat the steps above and now it works! It seems that the local connection feature needs the Mac/PC and the PS4 to be
connected to the same router.

Now to play some Firewatch...

![](/images/2016/05/ps4-up-and-running.png)
